{ pkgs, inputs, ... }: {

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "G14";
    networkmanager.enable = true;
    firewall.enable = false;
  };

   services.xserver = {
    enable = true;
    layout = "us";
    videoDrivers = [ "nvidia" ];
    desktopManager = {
      xterm.enable = false;
      xfce= {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    displayManager.defaultSession = "xfce";
    windowManager.i3.enable = true;
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