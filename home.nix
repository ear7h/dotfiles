{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "julio";
  home.homeDirectory = "/Users/julio";
  home.sessionPath = [
    "/usr/local/bin" # homebrew packages
    "/Users/julio/bin"
  ];

  nixpkgs.overlays = [
    (self: super: {
      vim = super.vim // { configureFlags = super.configureFlags ++ [
        "-xterm_clipboard"
        "-X11"
      ]; };
    })
  ];

  home.packages = [
    pkgs.go
    pkgs.ghc
    pkgs.rustup
    pkgs.ripgrep
    pkgs.vim
    pkgs.exiftool
  ];

  programs.zsh = {
    enable = true;
    initExtra = ''
      ${builtins.readFile ./profile}
      ${builtins.readFile ./zshrc}
      ${builtins.readFile ./zsh-completion}
    '';
  };

  programs.git = {
    enable = true;
    userName = "julio";
    userEmail = "julio.grillo98@gmail.com";
    extraConfig = {
      core.editor = "vim";
      credential.helper = "osxkeychain";
      init.defaultBranch = "main";
    };
  };

  home.file = {
    ".vimrc".source = ./vimrc;
    ".skhdrc".source = ./skhdrc;
    ".yabairc".source = ./yabairc;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}

