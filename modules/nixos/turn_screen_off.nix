{ lib, config, pkgs, ... }:
let 
  config_path = "/home/sacha/config/godns/config.json";
in {
  environment.systemPackages = with pkgs; [
    godns
  ];


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