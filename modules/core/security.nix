{ pkgs, inputs, config, ... }: {
  security.rtkit.enable = true;
  security.sudo.enable = true;
  security.pam.services.swaylock = { };
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/zell/.config/sops/age/keys.txt";
  };
}
