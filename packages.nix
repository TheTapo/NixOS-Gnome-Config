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
     neovim
     gnome-tweaks
     blackbox-terminal
     celluloid
     papers
     p7zip
     git
     htop
     wget
     killall
     at-spi2-core
     keepassxc
     brave
#    veracrypt
#    libnotify
#    ytfzf
#    swayimg
#    gimp
#    qt5ct
#    virt-manager
#    qtstyleplugin-kvantum-qt4
#    qpwgraph
#    bleachbit
#    hyprland-share-picker
#    hyprland
#    mpv
#    pfetch
#    xfce.thunar
#    wofi
#    grim
#    kitty
#    slurp
#    pavucontrol
#    dconf-editor
#    gnome-extension-manager
#    vimPlugins.packer-nvim
#    zathura
#    qutebrowser
#    torbrowser
#    swaybg
#    ungoogled-chromium
#    librewolf
#    nheko
#    dunst
#    mate.mate-polkit
#    wl-clipboard
#    libsForQt5.qtstyleplugin-kvantum
#    wdisplays
#    emote
#    libreoffice-fresh

  
   ];

 # Virtualisation 
   virtualisation = {
       vmware.host.enable = false;
       libvirtd.enable = false;
       docker.enable = false;
  };


  # bash
  users.defaultUserShell = pkgs.bash;

}
