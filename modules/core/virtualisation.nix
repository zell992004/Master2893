{config,  pkgs, ...}:
{
  programs.dconf.enable = true;
  programs.virt-manager.enable = true;
  virtualisation = {
    spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
      
    };
  };
}
