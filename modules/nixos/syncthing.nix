{ config, pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    user = "sacha";
    dataDir = "/home/sacha/Sync";
    configDir = "/home/sacha/.config/syncthing";
    openDefaultPorts = true;  # 22000/tcp, 22000/udp, 21027/udp
    settings.gui = {
      address = "0.0.0.0:8384";
      insecureAdminAccess = true;  # Tailscale is the security boundary
    };
  };
}
