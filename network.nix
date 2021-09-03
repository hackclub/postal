{
  network.description = "postal deployment on Linode for Hack Club Bank";

  "postal" = { config, pkgs, lib, ... }:
  {
    deployment.targetUser = "root";
    deployment.targetHost = "198.74.57.62";

    imports = [ ./postal/configuration.nix ];
  };
}
