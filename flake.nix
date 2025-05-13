{
  description = "Custom Packaged Software";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-compat = {
      url = github:edolstra/flake-compat;
      flake = true;
    };
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { utils, nixpkgs,... }:
    utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        #nixosModules = rec {
        #  pelican-wings = modules/pelican-wings;
        #};
        packages = rec {
          pelican-wings = pkgs.callPackage packages/pelican-wings/default.nix {};
          pelican-panel = pkgs.callPackage packages/pelican-panel/default.nix {};
        };
    });
}
