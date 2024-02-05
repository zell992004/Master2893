{ pkgs, inputs, ... }: {

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "AIO3475";
    networkmanager.enable = true;
    firewall.enable = false;
  };

   services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [ "amd" ];
    displayManager.lightdm.enable = true;
    desktopManager.deepin.enable = true;
    
    
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