{ lib, config, pkgs, ... }:
let 
  config_path = "~/config/godns/godns_conf.json";
in {
  environment.systemPackages = with pkgs; [
    godns
  ];
}