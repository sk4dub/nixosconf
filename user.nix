{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];
    
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.arnaud = { lib, ...}: {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "25.11";
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
      
    dconf.settings = {
      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":minimize,maximize,close"; /* Boutons min/max/close */
        audible-bell = false; /* Désactivation des sons systèmes (goutte d'eau, etc) */
      };
      
      "org/gnome/desktop/sound" = {
        allow-volume-above-100-percent = true; /* Suramplification */
      };
      
      "org/gnome/mutter" = {
      	attach-modal-dialogs = false; /* Détacher les popups */
      	check-alive-timeout = 60000; /* Timeout des apps à 60s */
      };
      
      # Horloge & Calendrier
      "org/gnome/desktop/calendar" = {
      	show-weekdate = true;
      };
      
      "org/gnome/desktop/interface" = {
      	clock-show-date = true;
      	clock-show-seconds = true;
      	clock-show-weekday = true;
      	clock-format = "24h";
      	# Thème sombre
      	color-scheme = "prefer-dark";
      	gtk-theme = "adw-gtk3-dark";
      	# Polices Red Hat
      	font-name = "Red Hat Text Medium 11";
      	monospace-font-name = "Red Hat Mono Medium 10";    	
      };
      
      # Mode nuit
      "org/gnome/settings-daemon/plugins/color" = {
      	night-light-enabled = true;
      };

      # Confidentialité & épuration des fichiers temporaires et de la corbeille de plus de 30 jours"
      "org/gnome/desktop/privacy" = {
        remove-old-temp-files = true;
        remove-old-trash-files = true;
        old-files-age = "30";
        report-technical-problems = false;
        send-software-usage-stats = false;
      };
      
      # Nautilus
      #default-zoom-level = "small"
      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "list-view";
        open-folder-on-dnd-hover = false;
        click-policy = "double" ;
      };
      
      "org/gnome/nautilus/list-view" = {
        use-tree-view = true;
        default-zoom-level = "small";
      };
      
      "org/gtk/settings/file-chooser" = {
        sort-directories-first = true;
      };
      
      "org/gtk/gtk4/settings/file-chooser" = {
        sort-directories-first = true;
      };  

      # GNOME Logiciels
     "org/gnome/software" = {
       download-updates = false;
       show-only-free-apps = false;
     };
     
     # GNOME Text Editor
     "org/gnome/TextEditor" = {
       custom-font = "Red Hat Mono Medium 11";
       highlight-current-line = false;
       /* restore-session = false; */
       show-line-numbers = true;
     };
     
     # GNOME Web
     "org.gnome.Epiphany" = {
       ask-for-default = false;
       homepage-url = "about:blank";
       /* start-in-incognito-mode = true; */
     };
     
     # Ptyxis
     "org/gnome/Ptyxis" = {
       use-system-font = false;
       font-name = "Red Hat Mono Regular 11";
       /*restore-session = false; */
     };
     
     # Activer des extensions
     "org/gnome/shell" = {
       enabled-extensions = [
         "appindicatorsupport@rgcjonas.gmail.com"
         "arcmenu@arcmenu.com"
         "blur-my-shell@aunetx"
         "caffeine@patapon.info"
         "dash-to-dock@micxgx.gmail.com"
         "user-theme@gnome-shell-extensions.gcampax.github.com"
       ];
     };
     
     # Dash-to-Dock
     "org/gnome/shell/extensions/dash-to-dock" = {
       dock-position = "BOTTOM";
       dock-fixed = false;
       autohide-in-fullscreen = true;
       disable-overview-on-startup = true;
     };
    };
  };
}
