{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    redhat-official-fonts
    
    cockpit
    
    gnomeExtensions.appindicator
    gnomeExtensions.arcmenu
    gnomeExtensions.blur-my-shell
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes
    gnomeExtensions.quick-settings-audio-panel
    
    gnome-tweaks
    gnome-extension-manager
    
    ptyxis
    file-roller
    dconf-editor
    resources
    
    screen
    
    wget
    
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
    
    borgbackup
    plakar
    
    sox
    vorbisgain
    mp3gain
    mediainfo
    mpv
    vlc
    
    gimp
    inkscape
    flameshot
    
    floorp-bin
    firefox
    thunderbird
    vivaldi
    google-chrome
    telegram-desktop
    discord
    
    guake
    
    keepassxc
    
    wireshark
    
    vscode
    
    libreoffice-fresh
    hunspell
    hunspellDicts.fr-any
  ];
  
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    geary
    epiphany
  ];
  
  programs.vim.enable = true;
  programs.vim.package = pkgs.vim-full;
}
