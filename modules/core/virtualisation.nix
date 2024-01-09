{config,  pkgs, ...}:
{
  servicse.spice-vdagentd.enable = true;
  virtualisation = {
    libvirtd = {
      spiceUSBRedirection.enable = true;
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        };
    };
  }
}
