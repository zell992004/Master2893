{config, lib, ... }:
with lib;
  let   
    cfg = config.modules.hyprvar;
in
{
  options.modules.hyprvar = { enable = mkEnableOption "hyprvar"; };
  config = mkIf cfg.enable {
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GDK_BACKEND = "wayland";
    WLR_DRM_NO_ATOMIC = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    SDL_VIDEODRIVER = "wayland";
    NEO4J_CONF=/home/zell/my_neo4j.conf;
  };
  };
}
