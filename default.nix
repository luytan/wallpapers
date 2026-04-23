{
  lib,
  stdenv,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "my_wallpapers";
  version = "1.0.0";
  src = ./images;

  installPhase = ''
    mkdir -p $out/share/{wallpapers,pfp}
    install -Dm444 ./wallpapers/* $out/share/wallpapers/
    install -Dm444 ./pfp/* $out/share/pfp/
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
