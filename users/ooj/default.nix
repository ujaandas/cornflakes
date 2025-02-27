{ inputs, specialArgs, username, lib, ... }:

{
  # TODO: add options
  # MACOS SPECIFIC START >>
  users.users = {
    ${username} = {
      name = username;
      home = "/Users/${username}";
    };
  };

  services = {
    jankyborders = {
      enable = true;
      active_color = "0xFF89DCEB";
      inactive_color = "0x11B4BEFE";
      blur_radius = 5.0;
    };
    yabai = {
      enable = true;
      enableScriptingAddition = true; # TODO: automate
      config = {
        layout = "bsp";
        # external_bar = "all:32:0";
        top_padding = 8;
        bottom_padding = 24;
        left_padding = 8;
        right_padding = 8;
        window_gap = 8;
        auto_balance = "off";
        mouse_follows_focus = "on";
        focus_follows_focus = "on";
        mouse_modifier = "fn";
        mouse_action1 = "move";
        mouse_action2 = "resize";
        mouse_drop_action = "swap";
        window_topmost = "on";
        window_placement = "second_child";
        window_opacity = "on";
        window_shadow = "float";
        active_window_opacity = 1.0;
        normal_window_opacity = 0.90;
        split_ratio = 0.50;
        window_animation_easing = "ease_out_quint";
        window_animation_duration = 0.1;
        window_move_step = 10;
        window_resize_step = 10;
        window_opacity_step = 0.1;
        window_zoom_persist = "on";
        insert_feedback_color = "0xE02d74da";
      };
      extraConfig = ''
        yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
        sudo yabai --load-sa
        yabai -m rule --add app="^(LuLu|Calculator|Software Update|Dictionary|VLC|System Preferences|System Settings|zoom.us|Photo Booth|Archive Utility|Python|LibreOffice|App Store|Steam|Alfred|Activity Monitor)$" manage=off
        yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
        yabai -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance)$" manage=off
        yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
        yabai -m rule --add label="Select file to save to" app="^Inkscape$" title="Select file to save to" manage=off
      '';
    };
    skhd = {
      enable = true;
      # launchctl stop org.nixos.skhd
      skhdConfig = lib.strings.concatStringsSep "\n" [
        # moves focus between windows in the current focused display
        "alt - h : yabai -m window --focus west"
        "alt - j : yabai -m window --focus south"
        "alt - k : yabai -m window --focus north"
        "alt - l : yabai -m window --focus east"

        # restart skhd
        "cmd - escape: skhd --restart-service || launchctl stop org.nixos.skhd"

        # moves focus between spaces
        "alt - 1 : yabai -m space --focus 1"
        "alt - 2 : yabai -m space --focus 2"
        "alt - 3 : yabai -m space --focus 3"
        "alt - 4 : yabai -m space --focus 4"
        "alt - 5 : yabai -m space --focus 5"
        "alt - 6 : yabai -m space --focus 6"
        "alt - 7 : yabai -m space --focus 7"
        "alt - 8 : yabai -m space --focus 8"
        "alt - 9 : yabai -m space --focus 9"
        "alt - 0 : yabai -m space --focus 10"

        # delete focused space
        "alt - q : yabai -m space --destroy"

        # toggle window split type
        "alt - s : yabai -m window --toggle split"

        # close window
        "alt - w : yabai -m window --close"

        # minimize window
        "alt - m : yabai -m window --minimize"

        # rotate tree
        "alt - r : yabai -m space --rotate 90"

        # mirror tree y-axis
        "alt - y : yabai -m space --mirror y-axis"

        # toggle window parent zoom
        "alt - d : yabai -m window --focus mouse && \\"
        "        yabai -m window --toggle zoom-parent"

        # float / unfloat window and center on screen
        "alt - t : yabai -m window --toggle float; \\"
        "        yabai -m window --grid 4:4:1:1:2:2"

        # toggle window fullscreen zoom
        "alt - f : yabai -m window --focus mouse && \\"
        "        yabai -m window --toggle zoom-fullscreen"

        # toggle window native fullscreen
        "shift + alt - f : yabai -m window --toggle native-fullscreen"

        # create a new space and follow focus
        "alt - n : yabai -m space --create && \\"
        "        index=\"$(yabai -m query --displays --display | jq '.spaces[-1]')\" && \\"
        "        yabai -m space --focus \"\${index}\""

        # create a new space move window and follow focus
        "shift + alt - n : yabai -m space --create && \\"
        "        index=\"$(yabai -m query --displays --display | jq '.spaces[-1]')\" && \\"
        "        yabai -m window --space \"\${index}\" && \\"
        "        yabai -m space --focus \"\${index}\""

        # balance size of windows
        "shift + alt - 0 : yabai -m space --balance"

        # swap window
        "shift + alt - h : yabai -m window --swap west"
        "shift + alt - j : yabai -m window --swap south"
        "shift + alt - k : yabai -m window --swap north"
        "shift + alt - l : yabai -m window --swap east"

        # move window
        "shift + cmd - h : yabai -m window --warp west"
        "shift + cmd - j : yabai -m window --warp south"
        "shift + cmd - k : yabai -m window --warp north"
        "shift + cmd - l : yabai -m window --warp east"

        # send window to a space
        "shift + alt - 1 : yabai -m window --space 1"
        "shift + alt - 2 : yabai -m window --space 2"
        "shift + alt - 3 : yabai -m window --space 3"
        "shift + alt - 4 : yabai -m window --space 4"
        "shift + alt - 5 : yabai -m window --space 5"
        "shift + alt - 6 : yabai -m window --space 6"
        "shift + alt - 7 : yabai -m window --space 7"
        "shift + alt - 8 : yabai -m window --space 8"
        "shift + alt - 9 : yabai -m window --space 9"
        "shift + alt - 0 : yabai -m window --space 10"

        # change layout of desktop
        "ctrl + alt - b : yabai -m space --layout bsp"
        "ctrl + alt - f : yabai -m space --layout float"

        # increase window size
        "ctrl + alt - h : yabai -m window --resize left:-40:0"
        "ctrl + alt - j : yabai -m window --resize bottom:0:40"
        "ctrl + alt - k : yabai -m window --resize top:0:-40"
        "ctrl + alt - l : yabai -m window --resize right:40:0"

        # decrease window size
        "ctrl + alt + cmd - h : yabai -m window --resize left:40:0"
        "ctrl + alt + cmd - j : yabai -m window --resize bottom:0:-40"
        "ctrl + alt + cmd - k : yabai -m window --resize top:0:40"
        "ctrl + alt + cmd - l : yabai -m window --resize right:-40:0"

        # restart yabai
        "ctrl + alt + cmd - r : launchctl kickstart -k \"gui/\${UID}/homebrew.mxcl.yabai\""
      ];
    };
  };

  # << MACOS SPECIFIC END

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = inputs // specialArgs;
    users.${username} = import ./home.nix;
  };
}
