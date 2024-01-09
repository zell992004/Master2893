{ pkgs
, inputs
, config
, lib
, ...
}:
{  
  
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.zell = {
      imports = [ (import ./../home/zell.nix) ];
      home.username = "zell";
      home.homeDirectory = "/home/zell";
      home.stateVersion = "23.11";
      programs.home-manager.enable = true;
    };
  };
  
  # only manage user groups here for simplicity
  users.users = {
    "zell" = {
    isNormalUser = true;
    description = "Pete";
    extraGroups = [ "networkmanager" "wheel" "mlocate" "libvirtd"];
    shell = pkgs.zsh;
    };
};
  nix.settings.allowed-users = [ "zell"];
}