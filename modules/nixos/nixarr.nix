{ config, pkgs, ... }:

{
  nixarr = {
    enable = true;
    # These two values are also the default, but you can set them to whatever
    # else you want
    # WARNING: Do _not_ set them to `/home/user/whatever`, it will not work!
    mediaDir = "/mnt/media";
    stateDir = "/mnt/media/.state/nixarr";

    ddns.njalla = {
      enable = true;
      keysFile = "/data/.secret/njalla/keys-file.json";
    };

    jellyfin = {
      enable = true;
      # These options set up a nginx HTTPS reverse proxy, so you can access
      # Jellyfin on your domain with HTTPS
      expose.https = {
        enable = false;
        domainName = "your.domain.com";
        acmeMail = "your@email.com"; # Required for ACME-bot
      };
    };

    transmission = {
      enable = true;
      vpn.enable = false;
      #peerPort = 50000; # Set this to the port forwarded by your VPN
    };

    # It is possible for this module to run the *Arrs through a VPN, but it
    # is generally not recommended, as it can cause rate-limiting issues.
    bazarr.enable = true;
    lidarr.enable = true;
    prowlarr.enable = true;
    radarr.enable = true;
    readarr.enable = true;
    sonarr.enable = true;
  };
}