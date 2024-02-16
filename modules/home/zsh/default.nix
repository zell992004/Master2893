{ hostname
, config
, pkgs
, lib
, ...
}:
with lib;
  let 
    cfg = config.modules.zsh;
in {
  options.modules.zsh = { enable = mkEnableOption "zsh";};
  config = mkIf cfg.enable {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
  #  prezto = {
  #      enable = true;
  #      tmux.autoStartLocal = true;
  #      tmux.autoStartRemote = true;
  #    };
    initExtra = ''
    ZSH_TMUX_AUTOSTART=true
    '';
    oh-my-zsh = {
      enable = true;
      plugins = with pkgs; [ "tmux" ];

    };
    shellAliases = {
      n = "clear && neofetch";
      v = "nvim";
      record = "wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";
      ls = "eza --icons --long";
      startbg = " nohup ~/Master2893/backgrounds/swww_randomize.sh ~/Master2893/backgrounds > output.log 2>&1 &";
      # nixos
      ncg = "nix-collect-garbage && nix-collect-garbage -d && sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/*";
      nrs = "sudo nixos-rebuild switch --flake ~/Master2893/.#";
      fl = "cd ~/Flakes/ && v";
      vmnetstart = "sudo virsh net-start default";
      pwnconnect = "~/Master2893/modules/home/scripts/pwnconnect.sh~";
    };
  };
  };
}
