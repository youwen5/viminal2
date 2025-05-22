-- [nfnl] ./fnl/plugins/lsp-progress.fnl
local function _1_()
  local function _2_(client_name, spinner, series_messages)
    if (#series_messages == 0) then
      return nil
    else
    end
    return {body = (spinner .. " " .. table.concat(series_messages, ", ")), name = client_name}
  end
  local function _4_(client_messages)
    local function stringify(name, msg)
      return ((msg and string.format("%s %s", name, msg)) or name)
    end
    local sign = "\243\176\134\167"
    local lsp_clients = vim.lsp.get_clients()
    local messages_map = {}
    for _, climsg in ipairs(client_messages) do
      messages_map[climsg.name] = climsg.body
    end
    if (#lsp_clients > 0) then
      local function _5_(a, b)
        return (a.name < b.name)
      end
      table.sort(lsp_clients, _5_)
      local builder = {}
      for _, cli in ipairs(lsp_clients) do
        if (((type(cli) == "table") and (type(cli.name) == "string")) and (string.len(cli.name) > 0)) then
          if messages_map[cli.name] then
            table.insert(builder, stringify(cli.name, messages_map[cli.name]))
          else
            table.insert(builder, stringify(cli.name))
          end
        else
        end
      end
      if (#builder > 0) then
        local ___antifnl_rtn_1___ = (sign .. " " .. table.concat(builder, ", "))
        return ___antifnl_rtn_1___
      else
      end
    else
    end
    return ""
  end
  return require("lsp-progress").setup({client_format = _2_, format = _4_})
end
return {"lsp-progress.nvim", after = _1_, event = "LspAttach"}
