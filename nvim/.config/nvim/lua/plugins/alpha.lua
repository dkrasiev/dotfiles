local function read_logo_from_file(path)
  local lines = {}

  for line in io.lines(vim.fs.normalize(path)) do
    table.insert(lines, line)
  end

  return lines
end

local function get_date() return os.date " %Y-%m-%d   %H:%M:%S" end

local function get_header()
  local header = read_logo_from_file "~/.config/nvim/lua/assets/splash"
  local date = get_date()

  table.insert(header, "")
  table.insert(header, "   " .. date)

  return header
end

return {
  "goolord/alpha-nvim",
  -- opts = function(_, opts) opts.section.header.val = get_header() end,
  opts = {
    section = {
      header = {
        val = get_header(),
      },
    },
  },
}
