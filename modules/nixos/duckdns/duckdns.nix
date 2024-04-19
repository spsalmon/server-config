{ lib, config, pkgs, ... }:
let 
  config_path = "./config.json";
in {
  environment.systemPackages = with pkgs; [
    godns
  ];


    systemd.services.godns = {
      description = "GoDNS";
      wantedBy = ["multi-user.target"];

      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.godns}/bin/godns -c ${config_path}";
      };
    };
}