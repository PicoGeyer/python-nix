{
  description = "Sample project flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, poetry2nix }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    inherit (poetry2nix.lib.mkPoetry2Nix { inherit pkgs; }) mkPoetryEnv mkPoetryApplication defaultPoetryOverrides;
    sample_app = mkPoetryApplication {
      projectDir = ./.;
    };
  in
  {
    devShells.x86_64-linux.default = pkgs.mkShell {
       packages = [
         (mkPoetryEnv {
           projectDir = ./.;
         })
       ];
    };
    packages.x86_64-linux.sample = sample_app;
    packages.x86_64-linux.default = self.packages.x86_64-linux.sample;

  };
}
