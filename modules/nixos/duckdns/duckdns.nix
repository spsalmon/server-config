{ lib, config, pkgs, ... }:
let 
  config_path = "~/config/godns/godns_conf.json";
{
  environment.systemPackages = with pkgs; [
    godns
  ];
}