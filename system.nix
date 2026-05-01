{ config, pkgs, ... }:

{
  virtualisation.vmware.guest.enable = true;
  
  # Optimisation Nix
  nix.settings.auto-optimise-store = true;
  
  # Garbage Collection : nettoyage automatique
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };
  
  #SYSCTL
  boot.kernel.sysctl = {
    "vm.swappiness" = 2;
    #"kernel.sysrq" = 1;
  };
  
  #ZRAM
  zramSwap = {
    enable = true;
    algorithm = "lzo-rle";
    # Par dééfaut 50%
    #memoryPercent = 50;
  };
  
  # Variables d'environnement
  environment.variables = {
    ARNAUD = "valeur";
  };
  
  #programs.bash.shellAliases = {
  #  gzip = "pigz";
  #  bzip2 = "lbzip2";
  #};
}
