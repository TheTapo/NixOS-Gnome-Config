{ config, pkgs, ... }:
{  # Network manager 

 # X11 Services
 services.libinput.enable = true;
 services.xserver.excludePackages = [ pkgs.xterm ];
  # X11 Coonfig
  services.xserver.xkb = {
    layout = "us";
   variant = "";
  };

services.xserver = {
  enable = true;
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
   };
  environment.gnome.excludePackages = (with pkgs; [
  gnome-tour
       ]) ++ (with pkgs.gnome; [
  epiphany # web browser
  geary # email reader
  evince
               ]);
  # Printing
  #services.printing.enable = false;

  # Bluetooth
  hardware.bluetooth = { enable = true; # enables support for Bluetooth
                         powerOnBoot = true; }; #powers up the default Bluetooth controller on boot
  # Tor
   services.tor.enable = false;

  # Flatpak
  services.flatpak.enable = true;
 #  xdg.portal.enable = true;
 #  xdg.portal.config.enable = true;
 #  xdg.portal.config.extraPortals = [ 
 #  pkgs.xdg-desktop-portal-gtk
 # ];   

  # gvfs
  services.gvfs.enable = true;

  # Enable NixOS to use fonts from ~/.local/share/fonts
  fonts.fontDir.enable = true;    

  # Enable polkit 
  security.polkit.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.startx.enableGnomeKeyring = true;

 users.extraUsers.tapabratabarick.extraGroups = [ "audio" ];
  # PipeWire

hardware.pulseaudio.enable = false;
#hardware.pulseaudio.support32Bit = true; 
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
  alsa.enable = true;
   alsa.support32Bit = true;
    pulse.enable = true;
  # jack.enable = true;
  # media-session.enable = true;

    };

  

}
