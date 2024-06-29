local M = {}

function M.make_current_file_executable()
  local current_file = vim.fn.expand("%:p")
  if vim.fn.filereadable(current_file) == 0 then
    vim.notify("File does not exist: " .. current_file, vim.log.levels.ERROR)
    return
  end
  vim.fn.jobstart({ "chmod", "+x", current_file }, {
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("File is now executable: " .. current_file, vim.log.levels.INFO)
      else
        vim.notify("Failed to make file executable: " .. current_file, vim.log.levels.ERROR)
      end
    end,
  })
end

function M.open_live_server()
  local server_script = "/home/dark/Documents/Programming/Scripts/live_server.sh"
  local filepath = vim.fn.expand("%:p")
  vim.fn.jobstart({ server_script, filepath }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        print(vim.inspect(data))
        for _, line in ipairs(data) do
          local port = tonumber(line:match("http://localhost:(%d+)"))
          if port then
            local filename = vim.fn.expand("%:t")
            local url = string.format("http://localhost:%d/%s", port, filename)
            vim.fn.jobstart({ "firefox", "--new-window", url }, {
              on_exit = function(_, code)
                if code ~= 0 then
                  vim.notify("Failed to open browser", vim.log.levels.ERROR)
                end
              end,
            })
            return
          end
        end
        vim.notify("Failed to determine server port", vim.log.levels.ERROR)
      end
    end,
    on_exit = function(_, code)
      if code ~= 0 then
        vim.notify("Failed to start LiveServer", vim.log.levels.ERROR)
      end
    end,
  })
end

function M.kill_http_servers()
  vim.fn.jobstart("pkill -f 'python3 -m http.server'", {
    on_exit = function(_, code)
      if code ~= 0 then
        vim.notify("Failed to kill HTTP servers", vim.log.levels.ERROR)
      else
        vim.notify("All Live-Servers killed...", vim.log.levels.INFO)
      end
    end,
  })
end

function M.fetch_java_methods()
  local url = vim.fn.input("Enter the URL of the Java API documentation: ")
  if url == "" then
    vim.notify("URL must be provided", vim.log.levels.ERROR)
    return
  end
  local command = string.format("python3 /home/dark/Documents/Programming/Scripts/javadoc_parser.py '%s'", url)
  local target_dir = "/home/dark/Documents/Notebooks/Java/Java-Docs"
  vim.fn.jobstart(command, {
    on_stdout = function(_, data)
      if data then
        vim.notify(table.concat(data, "\n"), vim.log.levels.INFO)
      end
    end,
    on_stderr = function(_, data)
      if data then
        vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR)
      end
    end,
    on_exit = function(_, code)
      if code == 0 then
        local handle = io.popen("ls -t " .. target_dir)
        local result = handle:read("*a")
        handle:close()
        local filename = result:match("([^\n]+)")
        local filepath = target_dir .. "/" .. filename
        if filename then
          vim.notify("Java methods fetched successfully. Opening file: " .. filepath, vim.log.levels.INFO)
          vim.api.nvim_command("edit " .. filepath)
        else
          vim.notify("Failed to determine the generated file.", vim.log.levels.ERROR)
        end
      else
        vim.notify("Failed to fetch Java methods", vim.log.levels.ERROR)
      end
    end,
  })
end

function M.search_google()
  local query = vim.fn.input("Google Search: ")
  if query == "" then
    vim.notify("Search canceled or empty", vim.log.levels.WARN)
    return
  end
  local search_url = string.format("https://www.google.com/search?q=%s", vim.fn.escape(query, " "))
  local open_command = string.format("!firefox -- '%s' &> /dev/null &", search_url)
  vim.api.nvim_command(open_command)
  vim.notify("Searching Google for: " .. query, vim.log.levels.INFO)
end

function M.detach_tmux_session()
  vim.fn.jobstart("tmux detach", {
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("Detached from Tmux session successfully", vim.log.levels.INFO)
      else
        vim.notify("Failed to detach from Tmux session", vim.log.levels.ERROR)
      end
    end,
  })
end

function M.convert_and_open_pdf()
  local filepath = vim.fn.expand("%:p")
  local command = "python3 /home/dark/Documents/Programming/Scripts/libreconverter.py " .. filepath
  vim.fn.jobstart(command, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      if data then
        vim.notify(table.concat(data, "\n"), vim.log.levels.INFO)
      end
    end,
    on_stderr = function(_, data)
      if data then
        vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR)
      end
    end,
    on_exit = function(_, code)
      if code == 0 then
        local pdf_file = "/home/dark/Documents/Notebooks/LibreNotes/" .. vim.fn.expand("%:t:r") .. ".pdf"
        vim.fn.jobstart("zathura " .. pdf_file)
      else
        vim.notify("Failed to convert file to PDF", vim.log.levels.ERROR)
      end
    end,
  })
end

function M.create_new_librenote()
  local new_filename = vim.fn.input("Enter the new note name (without extension): ")
  if new_filename == "" then
    vim.notify("File name cannot be empty", vim.log.levels.ERROR)
    return
  end
  local full_path = "/home/dark/Documents/Notebooks/LibreNotes/" .. new_filename .. ".txt"
  vim.cmd("edit " .. full_path)
end

function M.run_rocket_book_script()
  local script_path = "/usr/local/bin/openrocketbooks"
  vim.cmd("enew")
  vim.cmd("terminal " .. script_path)
  vim.cmd("startinsert")
end

function M.open_lazygit()
  vim.cmd("term lazygit")
  vim.cmd("startinsert")
end

function M.open_ghetto_which_key()
  vim.cmd("tabnew ~/.config/nvim/commands.txt")
  vim.cmd("setlocal readonly")
  vim.cmd("setlocal nomodifiable")
end

function M.open_assembly_reference_file()
  vim.cmd("tabnew /home/dark/Documents/Notebooks/Assembly/assembly-instructions.txt")
  vim.cmd("setlocal readonly")
  vim.cmd("setlocal nomodifiable")
end

function M.setup()
  vim.api.nvim_create_user_command("LiveServer", M.open_live_server, {})
  vim.api.nvim_create_user_command("KillLiveServers", M.kill_http_servers, {})
  vim.api.nvim_create_user_command("ParseJavadoc", M.fetch_java_methods, {})
  vim.api.nvim_create_user_command("GoogleSearch", M.search_google, {})
  vim.api.nvim_create_user_command("TmuxDetach", M.detach_tmux_session, {})
  vim.api.nvim_create_user_command("LibreConvert", M.convert_and_open_pdf, {})
  vim.api.nvim_create_user_command("LibreNote", M.create_new_librenote, {})
  vim.api.nvim_create_user_command("MakeExecutable", M.make_current_file_executable, {})
  vim.api.nvim_create_user_command("OpenRocketbooks", M.run_rocket_book_script, {})
  vim.api.nvim_create_user_command("LazyGit", M.open_lazygit, {})
  vim.api.nvim_create_user_command("GhettoWhich", M.open_ghetto_which_key, {})
  vim.api.nvim_create_user_command("AssemblyReference", M.open_assembly_reference_file, {})
end

M.setup()

return M

