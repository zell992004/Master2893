{inputs, nixpkgs, self, nixos-hardware, ...}:
let system = "x86_63-linux";
pkgs = import nixpkgs {
  inherit system;
  config.allowUnfree = true;
};
lib = nixpkgs.lib;
in 
{
  P72 = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules =
         [ nixos-hardware.nixosModules.lenovo-thinkpad-p52]
      ++ [ (import ./hardware.nix) ]
      ++ [ (import ./steam.nix) ] 
      ++ [ (import ./pipewire.nix) ]
      ++ [ (import ./program.nix) ]
      ++ [ (import ./security.nix) ]
      ++ [ (import ./services.nix) ]
      ++ [ (import ./system.nix) ]
      ++ [ (import ./user.nix) ]
      ++ [ (import ./wayland.nix) ]
      #++ [ (import ./virtualisation.nix) ]
      ++ [ (import ./obsidian.nix)]
      ++ [ (import ./../../hosts/P72/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/P72/default.nix) ]
    ;
  };
      T480 = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules =
         [ nixos-hardware.nixosModules.lenovo-thinkpad-t480 ]
      ++ [ (import ./hardware.nix) ]
      ++ [ (import ./steam.nix) ] 
      ++ [ (import ./pipewire.nix) ]
      ++ [ (import ./program.nix) ]
      ++ [ (import ./../home/package/python.nix) ]
      ++ [ (import ./security.nix) ]
      ++ [ (import ./services.nix) ]
      ++ [ (import ./system.nix) ]
      ++ [ (import ./user.nix) ]
      ++ [ (import ./wayland.nix) ]
      #++ [ (import ./virtualisation.nix) ]
      ++ [ (import ./obsidian.nix)]
      ++ [ (import ./../../hosts/T480/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/T480/default.nix) ]
    ;
  };
}