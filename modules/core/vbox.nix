{config,  pkgs, ...}:
{
  nixpkgs.config.virtualbox.enableExtensionPack = true;
  virtualisation = {
    virtualbox = {
      guest.enable = true;
      host = {
        enable = true;
        addNetworkInterface = true;
      };
    };

  };
}
