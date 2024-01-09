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
         [ (import ./hardware.nix) ]
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

}