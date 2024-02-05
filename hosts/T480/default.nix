{ pkgs, ... }: {


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ "nvidia" ];

  networking = {
    hostName = "T480";
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
    xkb.layout = "us";
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

#home-manager items
home-manager.users.zell.wayland.windowManager.hyprland.settings.monitor = [
     "eDP-1,1920x1080,0x0,1"
     ];
}