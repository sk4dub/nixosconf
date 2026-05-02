{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # POLICE DE CARACTERES
    redhat-official-fonts
    
    # ADMINISTRATION WEB INTERFACE
    cockpit
    
    # EXTENSIONS GNOME
    gnomeExtensions.appindicator
    gnomeExtensions.arcmenu
    gnomeExtensions.blur-my-shell
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes
    gnomeExtensions.quick-settings-audio-panel
        
    # THEMES GNOME
    adw-gtk3
    
    # APPLICATIONS GNOME
    gnome-tweaks
    gnome-extension-manager
        
    ptyxis
    file-roller
    dconf-editor
    resources
    guake
    
    # APPLICATIONS CONSOLE
    screen /* multiplexeur */
    
    wget
    
    gh
    git
    
    htop
    btop
    nmon
    glances
    fastfetch
    inxi
    #lm_sensors
    gdu
    nfs-utils
    
    pigz
    pbzip2
    
    nwipe
    sg3_utils
    
    netcat-gnu
    nmap
    iftop
    speedtest-cli
    sshfs
    
    # SAUVEGARDE
    borgbackup
    plakar
    
    # MULTIMEDIA
    sox
    vorbisgain
    mp3gain
    mediainfo
    mpv
    vlc
    
    # GRAPHISME
    gimp
    inkscape
    flameshot
    
    # INTERNET
    filezilla
    thunderbird
    
    firefox
    floorp-bin
    google-chrome
    vivaldi
    
    telegram-desktop
    discord
      
    # GESTIONNAIRE DE MOTS DE PASSE
    keepassxc
    
    # RESEAU
    wireshark
    
    # DEV
    vscode
    
    # BUREAUTIQUE
    libreoffice-fresh
    hunspell
    hunspellDicts.fr-any
  ];
  
  # Suppression de paquets inutiles
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    geary
    epiphany
    xterm
  ];
  
  # Programmes spécifiques
  programs.vim.enable = true;
  programs.vim.package = pkgs.vim-full;
  
  # Flatpak
  #services.flatpak.enable = true;
  
  # Ajout du dépôt flathub via un service systemd 
  #systemd.services.flatpak-repo = {
  #  wantedBy = [ "multi-user.target" ];
  #  path = [ pkgs.flatpak ];
  #  script = ''
  #    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  #  '';
  #};
}
