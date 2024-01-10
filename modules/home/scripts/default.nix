  { inputs, config, lib, pkgs, ... }: {
  imports =
      [ (import ./wall-change.nix) ]
    ++ [ (import ./toggle-animation.nix) ]
    ++ [ (import ./toggle-blur.nix) ]
    ++ [ (import ./toggle-opacity.nix )]
    ++ [ (import ./wallpaper-picker.nix )] 
    ;
  }