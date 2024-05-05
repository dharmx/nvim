-- local on = require("on")
-- on.UILeave.CmdlineEnter:desc("test"):group("TEST"):prin("Test!"):only()()

return setmetatable({}, {
  __index = function(_, event)
    local params = { { event }, opts = {} }
    local methods = {}

    function methods:ex(cmd)
      params.opts[type(cmd) == "string" and "command" or "callback"] = cmd
      return self
    end
    function methods:set(...)
      return self:ex("set " .. table.concat({...}, " "))
    end
    function methods:prin(item)
      params.opts.command = string.format("echo %q", item)
      return self
    end
    function methods:see()
      params.opts.callback = vim.print
      return self
    end
    function methods:group(label, clear)
      if type(label) == "string" then
        params.opts.group = vim.api.nvim_create_augroup(label, { clear = clear })
      else
        params.opts.group = label
      end
      return self
    end
    function methods:pat(patterns)
      params.opts.pattern = patterns
      return self
    end
    function methods:desc(label)
      params.opts.desc = label
      return self
    end
    function methods:buf(buffer)
      params.opts.buffer = buffer
      return self
    end
    function methods:only()
      params.opts.buffer = 0
      return self
    end
    function methods:nest()
      params.opts.nested = true
      return self
    end
    function methods:nonest()
      params.opts.nested = false
      return self
    end
    function methods:once()
      params.opts.once = true
      return self
    end
    function methods:more()
      params.opts.once = false
      return self
    end
    function methods:test()
      vim.print(params)
      return self
    end

    return setmetatable(methods, {
      __index = function(self, key)
        table.insert(params[1], key)
        return self
      end,
      __call = function()
        vim.api.nvim_create_autocmd(params[1], params.opts)
      end,
    })
  end,
})
