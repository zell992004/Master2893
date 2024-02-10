{inputs, nixpkgs, self, nixos-hardware, ...}:
let system = "x86_64-linux";
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
      ++ [ (import ./vbox.nix)]
      ++ [ (import ./hardware.nix) ]
      ++ [ (import ./steam.nix) ] 
      ++ [ (import ./pipewire.nix) ]
      ++ [ (import ./program.nix) ]
      ++ [ (import ./security.nix) ]
      ++ [ (import ./services.nix) ]
      ++ [ (import ./system.nix) ]
      ++ [ (import ./user.nix) ]
      ++ [ (import ./wayland.nix) ]
      ++ [ (import ./virtualisation.nix) ]
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
      G14 = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules =
         [ nixos-hardware.nixosModules.asus-zephyrus-ga401]
      ++ [ (import ./hardware.nix) ]
      ++ [ (import ./steam.nix) ] 
      ++ [ (import ./pipewire.nix) ]
      ++ [ (import ./program.nix) ]
      ++ [ (import ./security.nix) ]
      ++ [ (import ./services.nix) ]
      ++ [ (import ./system.nix) ]
      ++ [ (import ./user.nix) ]
      ++ [ (import ./wayland.nix) ]
    #  ++ [ (import ./virtualisation.nix) ]
      ++ [ (import ./obsidian.nix)]
      ++ [ (import ./../../hosts/G14/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/G14/default.nix) ]
    ;
  };
  AIO3475 = nixpkgs.lib.nixosSystem {
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
      ++ [ (import ./obsidian.nix)]
      ++ [ (import ./../../hosts/AIO3475/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/AIO3475/default.nix) ]
    ;
  };
}
