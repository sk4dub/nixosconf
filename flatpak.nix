let
  # External let binding to fetch nix-flatpak without 
  # causing infinite recursion.
  pkgs = import <nixpkgs> {};
  
  nix-flatpak = pkgs.fetchFromGitHub {
    owner = "gmodena";
    repo = "nix-flatpak";
    rev = "v0.7.0";
    hash = "sha256-7ZCulYUD9RmJIDULTRkGLSW1faMpDlPKcbWJLYHoXcs";
  };
in

{ config, pkgs, ... }:

{ 
  imports = [
    # Import the nix-flatpak NixOS module and install applications system wide.
    # HomeManager users should import `${nix-flatpak}/modules/home-manager.nix`
    # where appropriate.
    "${nix-flatpak}/modules/nixos.nix"
  ];

  # Configurer nix-flatpak
  services.flatpak = {
    enable = true;
    packages = [
      "com.github.tchx84.Flatseal"
    ];
  };
}
