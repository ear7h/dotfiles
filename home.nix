{ config, pkgs, lib, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "julio";
  home.homeDirectory = "/Users/julio";
  home.sessionPath = [
    "/Users/julio/bin"
    "/Users/julio/.go/bin"
    "/Users/julio/.cargo/bin"
    "/usr/local/bin" # homebrew packages
  ];

  home.sessionVariables = {
    GOPATH = "$HOME/.go";
  };

  home.packages = [
    pkgs.vim
    pkgs.go
    pkgs.ghc
    pkgs.stack
    pkgs.rustup
    pkgs.ripgrep
    pkgs.exiftool
    pkgs.dhall
    pkgs.dhall-json
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
    ".vim/autoload/".source = ./vim/autoload;
    ".vim/after/ftplugin".source = ./vim/after/ftplugin;
    ".vimrc".source = ./vimrc;
    ".skhdrc".source = ./skhdrc;
    ".yabairc".source = ./yabairc;
  };

  home.activation = {
    vimRuntime = lib.hm.dag.entryAfter ["writeBoundary"] ''
      $DRY_RUN_CMD mkdir $VERBOSE_ARG -p $HOME/.vim/{backup,undo}
    '';
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

