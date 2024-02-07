{ inputs
, pkgs
, config
, lib
, ...
}: 
  
  with lib;
    let
      cfg = config.modules.packagep;
    in {
      
    options.modules.packagep = { enable = mkEnableOption "packagep"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
      # programming
      nix-prefetch-github
      rnix-lsp
      # others
      openssl
      libnotify
      pamixer
      xfce.thunar
      pavucontrol
      wget
      unzip
      gparted
      mpv
      playerctl
      qalculate-gtk
      bleachbit
      imv
      htop
      nvtop
      xdg-utils
      fzf
      ffmpeg
      bore-cli
      discord
      eza
      obsidian
      waynergy
      sops
    ];
    };
}
