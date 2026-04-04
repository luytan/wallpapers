{
  lib,
  stdenv,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "my_wallpapers";
  version = "1.0.0";

  src = ./wallpapers;

  installPhase = ''
    mkdir -p $out/wallpapers
    cp ./* $out/wallpapers/
  '';

  meta = {
    description = "My wallpapers";
    homepage = "";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      "luytan@khora.me"
    ];
  };
})
