{ pkgs ? import <nixpkgs> {} }:

with pkgs;
{
  sendy = stdenv.mkDerivation {
    name = "sendy";

    src = ./src; # need to move this to a fetchurl

    phases = [ "installPhase" ];

    # TODO - Figure out patching so the Hack Club info is not hardcoded

    installPhase = ''
      cp -r $src $out
    '';
  };
}
