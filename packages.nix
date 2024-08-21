{ config, pkgs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Special Packages
  programs.noisetorch.enable = true;
  programs.dconf.enable = true;

# nixpkgs unstable
nixpkgs.config = {
  packageOverrides = pkgs: {
    unstable = import <nixos-unstable> {};
  };
};

  # List of packages installed in system profile.
fonts.packages = with pkgs; [
nerdfonts
];
  environment.systemPackages = with pkgs; [
  #  wl-clipboard
    neovim
    gnome.gnome-tweaks
    beeper
    unstable.papers
    gnome.dconf-editor
    vimPlugins.packer-nvim
   # zathura
   # swaybg
    htop
#    ungoogled-chromium
 #   librewolf
 #  nheko
  #  dunst
   # mate.mate-polkit
   # libsForQt5.qtstyleplugin-kvantum
   # wdisplays
   # emote
#   libreoffice-fresh
    p7zip
    git
    wget
   # libnotify
    killall
   # wofi
   # grim
   # kitty
   # slurp
    pavucontrol
    at-spi2-core
    qpwgraph
    bleachbit
#    hyprland-share-picker
   # hyprland
   # mpv
    pfetch
    keepassxc
    brave
 #  veracrypt
#    ytfzf
  #  swayimg
#    gimp
   # qt5ct
 #  virt-manager
   # qtstyleplugin-kvantum-qt4
   # xfce.thunar
   ];

 # Virtualisation 
   virtualisation = {
       lxd.enable = false;
       waydroid.enable = false;
       vmware.host.enable = false;
      libvirtd.enable = false;
      docker.enable = false;
  };


  # zsh
  users.defaultUserShell = pkgs.bash;

}
