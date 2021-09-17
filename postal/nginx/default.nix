{ config, pkgs, ... }:
let
  sendy = import ../sendy { inherit pkgs; };

  config = {
    appPath = "http://postal.hackclub.com";
    db = {
      host = "localhost";
      user = "sendy";
      password = "dinosaurs";
      db = "sendy";
    };
  };
in
{
  networking.firewall.allowedTCPPorts = [ 80 ];

  services.httpd = {
    enable = true;
    enablePHP = true;

    virtualHosts."postal.hackclub.com" = {
      adminAddr = "bank@hackclub.com";

      documentRoot = sendy.sendy;

      locations."/".index = "index.php";

      extraConfig = ''
        <Directory "${sendy.sendy}">
          AllowOverride All
        </Directory>

        SetEnv APP_PATH ${config.appPath}
        SetEnv MYSQL_HOST ${config.db.host}
        SetEnv MYSQL_USER ${config.db.user}
        SetEnv MYSQL_PASSWORD ${config.db.password}
        SetEnv MYSQL_DATABASE ${config.db.db}
      '';
    };
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;

    ensureDatabases = [ config.db.db ];

    ensureUsers = [
      {
        name = config.db.user;
        ensurePermissions = {
          "${config.db.db}.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
