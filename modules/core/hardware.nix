{ pkgs,  ... }: {
  # hardware.video.hidpi.enable = true;
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
    intel-media-driver
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
    intel-compute-runtime
  ];
  powerManagement.cpuFreqGovernor = "performance";
}
