{ pkgs,  ... }: {
  # hardware.video.hidpi.enable = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
 # hardware.opengl.extraPackages = with pkgs; [
 #   intel-media-driver
 #   vaapiIntel
 #   vaapiVdpau
 #   libvdpau-va-gl
 #   intel-compute-runtime
 # ];
  };
  powerManagement.cpuFreqGovernor = "performance";
}
