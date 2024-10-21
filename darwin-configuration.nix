{ config, lib, pkgs, ... }:

{
  # システム設定
  system.defaults = {
    NSGlobalDomain = {
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 12;
      KeyRepeat = 1;
      # "com.apple.mouse.scaling" = 3.0;
      # "com.apple.scrollwheel.scaling" = 1;
      # AppleEnableSwipeNavigateWithScrolls = true;
    };

    dock = {
      magnification = true;
      largesize = 128;
      tilesize = 40;
      autohide = true;
    };

    trackpad = {
      Clicking = true;
      TrackpadThreeFingerDrag = true;
    };
  };

  # シンボリックホットキーの設定
  system.activationScripts.extraActivation.text = ''
    /usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:27:enabled true" \
      -c "Set :AppleSymbolicHotKeys:27:value:parameters:0 65535" \
      -c "Set :AppleSymbolicHotKeys:27:value:parameters:1 48" \
      -c "Set :AppleSymbolicHotKeys:27:value:parameters:2 524288" \
      -c "Set :AppleSymbolicHotKeys:27:value:type standard" \
      ~/Library/Preferences/com.apple.symbolichotkeys.plist

    defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
    defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
  '';

  # 必要なシステムパッケージ
  environment.systemPackages = with pkgs; [
    # ここに必要なシステム全体のパッケージを追加
  ];

  # サービスの有効化
  services.nix-daemon.enable = true;


  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = 5;  # 数値として指定します
  # その他の設定
  # ...
}
