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
      openFirewall = true;
      # These options set up a nginx HTTPS reverse proxy, so you can access
      # Jellyfin on your domain with HTTPS
      expose.https = {
        enable = true;
        domainName = "jellyfin.marenglen.org";
        acmeMail = "mail@marenglen.org"; # Required for ACME-bot
      };
    };

    transmission = {
      enable = true;
      vpn.enable = false;
      #peerPort = 50000; # Set this to the port forwarded by your VPN

      # Don't seed. The media disk filled to 100% once already, which
      # crash-looped Jellyfin (it refuses to start with <2GiB free).
      # Merged into services.transmission.settings by nixarr.
      # NOTE: transmission only *stops* torrents at the ratio limit, it
      # never deletes them. Actual removal comes from the *Arrs'
      # "Remove Completed" setting, which lives in their own state dirs.
      extraSettings = {
        ratio-limit-enabled = true;
        ratio-limit = 0.0;
        # Backstop in case the ratio check doesn't fire; minutes.
        idle-seeding-limit-enabled = true;
        idle-seeding-limit = 60;
      };
    };

    # It is possible for this module to run the *Arrs through a VPN, but it
    # is generally not recommended, as it can cause rate-limiting issues.
    bazarr.enable = true;
    lidarr.enable = true;
    prowlarr.enable = true;
    radarr.enable = true;
    sonarr.enable = true;
  };
}