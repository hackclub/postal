{ pkgs, lib, ... }: {
  imports = [
    ./hardware-configuration.nix

    ./linode.nix # there are some networking config items in here
  ];

  boot.cleanTmpDir = true;

  networking.hostName = "postal";
  networking.firewall.allowPing = true;

  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEwQfzs4sQYgvcVKlWFbBKPmFH1yPFBGi4lJMrIlYm/5 zrl@lugia" 
  ];
}
