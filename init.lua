local pack = "tangerine" or "packer" or "paq" or "lazy"

vim.g.maplocalleader = " "

local function bootstrap(url, ref)
    local name = url:gsub(".*/", "")
    local path

    if pack == "lazy" then
        path = vim.fn.stdpath("data") .. "/lazy/" .. name
        vim.opt.rtp:prepend(path)
    else
        path = vim.fn.stdpath("data") .. "/site/pack/".. pack .. "/start/" .. name
    end

    if vim.fn.isdirectory(path) == 0 then
        print(name .. ": installing in data dir...")

        vim.fn.system {"git", "clone", url, path}
        if ref then
            vim.fn.system {"git", "-C", path, "checkout", ref}
        end

        vim.cmd "redraw"
        print(name .. ": finished installing")
    end
end

bootstrap("https://github.com/udayvir-singh/tangerine.nvim", "v2.9")

require("tangerine").setup({
  rtpdirs = {
    "ftplugin",
  },
  compiler = {
    verbose = false,
    hooks = { "onsave", "oninit" }
  }
})
