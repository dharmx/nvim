return {
  task = function(options)
    local pipes = {
      stdin = vim.loop.new_pipe(),
      stdout = vim.loop.new_pipe(),
      stderr = vim.loop.new_pipe(),
    }

    if options.before then options.before() end
    local handle, process = vim.loop.spawn(table.remove(options.cmd, 1), {
      args = #options.cmd == 0 and nil or options.cmd,
      cwd = options.directory,
      env = options.env,
      detached = options.detached,
      hide = options.hide,
      stdio = vim.tbl_values(pipes),
    }, function(code, signal)
      if options.callback then options.callback(code, signal, vim.tbl_values(pipes)) end
    end)

    local function readstd(pipe, callback)
      vim.loop.read_start(pipe, function(errors, data)
        assert(not errors, errors)
        if callback and data then callback(errors, data, { task = handle, process = process }) end
      end)
    end

    readstd(pipes.stdout, options.on_errors)
    readstd(pipes.stdout, options.on_outputs)
    handle:close(options.on_close)
  end,
}
