{
  description = "A wallpaper flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      forAllSys = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.all;
    in
    {
      packages = forAllSys (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          my_wallpapers = pkgs.callPackage ./. {
            inherit (inputs) ;
          };
        in
        {
          default = my_wallpapers;
        }
      );
    };
}
