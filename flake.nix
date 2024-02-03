{
  description = "My flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland = {
    url = "github:hyprwm/Hyprland";
    inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     nixvim = {
    url = "github:nix-community/nixvim";
    # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
    # url = "github:nix-community/nixvim/nixos-23.05";

    inputs.nixpkgs.follows = "nixpkgs";
  };
  };
  

  outputs = { self, nixpkgs, nixos-hardware, ... } @ inputs: {

    nixosConfigurations = import ./modules/core/default.nix {
      inherit self nixpkgs inputs nixos-hardware ;
    };
  };
}
