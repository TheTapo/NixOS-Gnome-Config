{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.tapabratabarick = {

    /* The home.stateVersion option does not have a default and must be set */

    home.stateVersion = "24.05";
    home.packages = [ ];

    gtk.enable = true; 
    gtk.font.name = "Noto Sans";
    gtk.font.package = pkgs.noto-fonts;
    gtk.theme.name = "gruvbox-dark-gtk";
    gtk.theme.package = pkgs.gruvbox-dark-gtk;
    gtk.iconTheme.name = "Gruvbox-Plus-Dark"; 
    # Candy and Tela also look good
    gtk.iconTheme.package = pkgs.gruvbox-plus-icons; 
    gtk.gtk3.extraConfig = { 
    	gtk-application-prefer-dark-theme = true;
   # 	gtk-key-theme-name = "Emacs";
    	gtk-icon-theme-name = "Gruvbox-Plus-Dark";
    	gtk-cursor-theme-name = "capitaine-cursors";
   };
    dconf.settings = { 
    	"org/gnome/desktop/interface" = 
    {	 # gtk-key-theme = "Emacs";
    	cursor-theme = "Capitaine Cursors";
    };
 };
    xdg.systemDirs.data = 

    [ 
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}" 
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}" 
    ];
    

  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or  []) ++ [ "-Dexperimental=true" ];
    patches = (oa.patches or []) ++ [
      (pkgs.fetchpatch {
        name = "fix waybar hyprctl";
        url = "https://aur.archlinux.org/cgit/aur.git/plain/hyprctl.patch?h=waybar-hyprland-git";
        sha256 = "sha256-pY3+9Dhi61Jo2cPnBdmn3NUTSA8bAbtgsk2ooj4y7aQ=";
      })
    ];
  });

	programs.waybar.enable = true;
    
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */

  };
}

