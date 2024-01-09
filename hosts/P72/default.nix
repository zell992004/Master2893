{ pkgs, ... }: {


  networking = {
    hostName = "P72";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  hardware = {
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        open = false;
        nvidiaSettings = true;
        };
  };

   services.xserver = {
    enable = true;
    layout = "us";
    videoDrivers = [ "nvidia" ];
    displayManager.autoLogin = {
      enable = true;
      user = "zell";
    };
    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
    };
  };
services.gvfs.enable = true;
services.hardware.bolt.enable = true;
#services.gnome.core-utilities.enable = false;
}