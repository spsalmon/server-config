{ lib, config, pkgs, ... }:
{
    systemd.services.screenoff = {
      description = "ScreenOff";
      wantedBy = ["multi-user.target"];

      serviceConfig = {
        Type = "oneshot";
        Environment="TERM=linux";
        ExecStart = "/run/current-system/sw/bin/setterm --blank 1";
      };
    };
}