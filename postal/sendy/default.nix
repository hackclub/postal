{ pkgs ? import <nixpkgs> {} }:

with pkgs;
{
  sendy = stdenv.mkDerivation {
    name = "sendy";

    src = fetchzip {
      url = "https://cloud-9l7dh6gf6-hack-club-bot.vercel.app/0sendy-5.2.4.zip";
      sha256 = "1xsf03l49fqhsd7vxzya0bwz34fsanr708kzv29zgj75vmvhwbx6";
    };

    patches = [ ./0001-read-secrets-from-env.patch ];

    installPhase = ''
      cp -r $src $out
    '';
  };
}
