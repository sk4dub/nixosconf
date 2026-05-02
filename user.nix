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
    
    #### PERSONNALISATION DE GNOME  
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
     
     "org/gnome/shell" = {
       /* Activer des extensions */
       enabled-extensions = [
         "appindicatorsupport@rgcjonas.gmail.com"
         "arcmenu@arcmenu.com"
         "blur-my-shell@aunetx"
         "caffeine@patapon.info"
         "dash-to-dock@micxgx.gmail.com"
         "user-theme@gnome-shell-extensions.gcampax.github.com"
       ];
       /* Epingler des apps au dock */
       favorite-apps = [
         "net.nokyan.Resources.desktop"
         "org.gnome.Ptyxis.desktop"
         "org.gnome.Nautilus.desktop"
         "org.gnome.TextEditor.desktop"
         "ca.desrt.dconf-editor.desktop"
         "firefox.desktop"
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
    
    #### PERSONNALISATION DES DOT FILES
    # Alias BASH
    programs.bash = {
      enable = true;
      shellAliases = {
        /* ll = "ls -l";*/
        ".." = "cd ..";
      };
    };
    
    # Fichier de conf pour vim
    programs.vim = {
      enable = true;
      extraConfig = 
      ''
        " Affichage des numéros de ligne"
        set number
        " Si indentation dans le code, on garde l'indentation sur une nouvelle ligne"
        set autoindent
        " Activation de la coloration syntaxique"
        syntax on
        " Theme desert"
        color desert
        
        " Largeur visuelle d'une tabulation"
        set tabstop=4
        " Nb d'espaces pour l'indentation"
        set shiftwidth=4
        " Transformer les tabulations en espaces"
        set expandtab
        " Nb d'espaces qu'une tabulation insère en mode édition"
        set softtabstop=4
        
        " Voir les caractères spéciaux
        "set list
        
        " Désactivation de la sélection via la souris
        "set mouse=
      '';
    };
    
  }; /* END HOME MANAGER */
} /* END IN */
