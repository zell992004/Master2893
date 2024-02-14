{ pkgs,  ... }: {
  # hardware.video.hidpi.enable = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
  ];
  };
  powerManagement.cpuFreqGovernor = "performance";
}
