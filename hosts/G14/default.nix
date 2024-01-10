{ pkgs, inputs, ... }: {

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "P72";
    networkmanager.enable = true;
    firewall.enable = false;
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


#home-manager items
home-manager.users.zell.wayland.windowManager.hyprland.settings.monitor = [
     "eDP-1,1920x1080,0x0,1"
     ];
}