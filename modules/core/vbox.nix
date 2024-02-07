{config,  pkgs, ...}:
{
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