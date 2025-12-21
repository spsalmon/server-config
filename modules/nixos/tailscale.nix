{ lib, config, pkgs, ... }:
{
  services.tailscale = {
    enable = true;
  };

  networking.firewall.allowedUDPPorts = [ config.services.tailscale.port ];
}