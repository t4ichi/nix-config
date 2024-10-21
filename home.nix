{ config, pkgs, lib, ... }:

{
  home.username = "taichi";
  home.homeDirectory = lib.mkForce "/Users/taichi";
  home.stateVersion = "22.11"; 

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # ここに必要なパッケージを追加
  ];

  # その他のホームマネージャー設定
}
