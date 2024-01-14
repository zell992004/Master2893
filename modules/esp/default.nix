{ config, lib, ... }:
{
{ inputs,   ... }: 
  {
  imports = [ (import ./esp32-toolchain.nix) ]
    ++ [ (import ./shell.nix) ]
  
}
}