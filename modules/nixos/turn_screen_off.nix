{ lib, config, pkgs, ... }:
{
    systemd.services.screenoff = {
      description = "ScreenOff";
      wantedBy = ["multi-user.target"];

      serviceConfig = {
        Type = "oneshot";
        Environment="TERM=linux";
        ExecStart = "setterm --blank 1";
      };
    };
}