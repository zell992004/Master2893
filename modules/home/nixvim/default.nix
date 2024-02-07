{
  config,
  pkgs,
  lib,
  nixvim,
  ...
}: 
with lib;
  let
    cfg = config.modules.nixvim;
in {
  options.modules.nixvim = { enable = mkEnableOption "nixvim";};
  config = mkIf cfg.enable {
    programs.nixvim = {
        enable = true;
        plugins = {
          lightline.enable = true;
          telescope.enable = true;
          nix.enable = true;
          treesitter = {
            enable = true;
            ensureInstalled = "all";
            };
          };
        extraPlugins = with pkgs.vimPlugins; [
          vim-nix
          gruvbox
          nerdtree
        ];
        colorscheme = "gruvbox";
        options = {
          number = true;
          relativenumber = true;
          shiftwidth = 2;
        };
        keymaps = [
          {
            action = "<cmd>Telescope live_grep<CR>";
            key = "<leader>g";
          }
        ];

      };
    
  };
}
