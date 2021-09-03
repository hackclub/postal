{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    
    
  ];

  boot.cleanTmpDir = true;

  networking.hostName = "postal";
  networking.firewall.allowPing = true;

  networking.usePredictableInterfaceNames = false;
  networking.useDHCP = false;
  networking.interfaces.eth0.useDHCP = true;

  environment.systemPackages = with pkgs; [
      inetutils
      mtr
      sysstat
  ];

  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEwQfzs4sQYgvcVKlWFbBKPmFH1yPFBGi4lJMrIlYm/5 zrl@lugia" 
  ];
}
