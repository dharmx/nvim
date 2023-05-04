local M = {}

function M.setup(options)
  local mason_root = require("mason.settings").current.install_root_dir
  local roots = { ".git", "pom.xml", "mvnw", "gradlew", ".idea", ".iml" }
  local root = vim.fs.dirname(vim.fs.find(roots, { upward = true })[1]) or vim.loop.cwd()
  local workspace = vim.fn.stdpath("cache") .. "/workspace/" .. vim.fn.fnamemodify(root, ":p:h:t")

  local schema = {
    cmd = {
      mason_root .. "/bin/jdtls",
      "-jar",
      vim.fn.glob(mason_root .. "/packages/jdtls/plugins/*.jar"),
      "-configuration",
      mason_root .. "/packages/jdtls/config_linux",
      "-data",
      workspace,
    },
    root_dir = root,
    settings = {
      java = {
        saveActions = { organizeImports = true },
        signatureHelp = { enabled = true },
        completion = {
          favoriteStaticMembers = {
            "org.junit.jupiter.api.Assertions.*",
            "java.util.Objects.requireNonNull",
            "java.util.Objects.requireNonNullElse",
          },
          filteredTypes = { "com.sun.*", "io.micrometer.shaded.*", "java.awt.*", "jdk.*", "sun.*" },
        },
        sources = {
          organizeImports = {
            starThreshold = 9999,
            staticStarThreshold = 9999,
          },
        },
        codeGeneration = {
          hashCodeEquals = { useJava7Objects = false },
          useBlocks = false,
          toString = {
            template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
          },
        },
        project = {
          referencedLibraries = {
            root .. "/lib**/*.jar",
            root .. "/*.jar",
          },
        },
      },
    },
  }

  schema = vim.tbl_deep_extend("keep", schema, options)
  local _jdtls, jdtls = pcall(require, "jdtls")
  if not _jdtls then
    schema.root_dir = require("lspconfig.util").root_pattern(roots)
    require("lspconfig").jdtls.setup(schema)
    return
  end

  local jdtls_setup = require("jdtls.setup")
  local extendedClientCapabilities = jdtls.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
  schema.init_options = { extendedClientCapabilities = extendedClientCapabilities }
  jdtls.start_or_attach(schema)
  jdtls_setup.add_commands()
end

function M.load_telescope(options)
  local _ui, ui = pcall(require, "jdtls.ui")
  if not _ui then return end
  options = vim.F.if_nil(options, {})

  local finders = require("telescope.finders")
  local sorters = require("telescope.sorters")
  local actions = require("telescope.actions")
  local pickers = require("telescope.pickers")

  ui.pick_one_async = function(items, prompt, label, callback)
    pickers
      .new(options, {
        prompt_title = prompt,
        finder = finders.new_table({
          results = items,
          entry_maker = function(entry) return { value = entry, display = label(entry), ordinal = label(entry) } end,
        }),
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function(buffer)
          actions.goto_file_selection_edit:replace(function()
            local selection = actions.get_selected_entry(buffer)
            actions.close(buffer)
            callback(selection.value)
          end)
          return true
        end,
      })
      :find()
  end
end

return M
