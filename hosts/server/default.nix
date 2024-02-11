{ config, pkgs, ....}: 
{
    imports = 
    [./hardware-configuration.nix];

    boot.loder.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
    };
    services.conman.enable = true;
    time.timeZone = "America/New_york";
    services.xserver.enable = true;

    services.xserver.displayManager.lighdm.enable = true;
    services.xserver.displayManager.enlightenment.enable = true;

    services.xserver = {
        layout = "us";
        xKBVarient = "";
        }
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.printing.enable = true;
    services.acpid.enable = true;
    security.ttkit.ebable = true;
    services.pipewire {
        enable = true;
        alasa.enable = true;
        alasa.support32Bit = true;
        pulse.enable = true;
      };

}

