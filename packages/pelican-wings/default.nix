{
  buildGoModule,
  fetchFromGitHub,
  lib
}:
buildGoModule ( rec {
    pname = "wings";
    version = "1.0.0-beta13";

    src = fetchFromGitHub {
        owner = "pelican-dev";
        repo = "wings";
        rev = "v${version}";
        hash = "sha256-c28cJwFff/UuD6cp5s9vACj8MtN9ysfNKEtjXOFMY+k=";
    };

    vendorHash = "sha256-pxPZZeJpocFzeD0n+KreV+oI2BhL8eZOWFtZDFYOe00=";

    meta = {
        description = "Wings provides an HTTP API allowing you to interface directly with running server instances, fetch server logs, generate backups, and control all aspects of the server lifecycle.";
        homepage = "https://github.com/pelican-dev/wings";
        mainProgram = "wings";
        license = lib.licenses.mit;
        maintainers = with lib.maintainers; [ ];
    };
})
