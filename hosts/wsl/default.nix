{
  pkgs,
  username,
  ...
}: {
  wsl = {
    enable = true;
    defaultUser = "zell";
    startMenuLaunchers = true;
    nativeSystemd = true;
  };
}