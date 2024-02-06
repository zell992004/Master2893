{ pkgs, inputs, config, ... }: {

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "kvm-intel" ];
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
services.hardware.bolt.enable = true;
#Hyprland display fixes

home-manager.users.zell.wayland.windowManager.hyprland.settings.monitor = [
     "eDP-1,3840x2160,0x0,2"
     "HDMI-A-1,1920x1080,1920x0, 1"
     "DP-5,1920x1080,3840x0, 1"
     "DP-4,1920x1080,-1920x0,1"
      ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}