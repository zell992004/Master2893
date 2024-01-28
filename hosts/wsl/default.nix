{ config, lib, pkgs, ... }:
{
 wsl.enable = true;
 wsl.defaultUser = "zell";
 wsl.wslConf.network.hostname = "zellwsl";
}