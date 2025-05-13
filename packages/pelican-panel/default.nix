{
  php,
  fetchFromGitHub,
  fetchpatch,
  lib,
  yarnConfigHook,
  yarnBuildHook,
  fetchYarnDeps,
  nodejs,
}:
php.buildComposerProject2 ( rec {
    pname = "panel";
    version = "1.0.0-beta21";

    src = fetchFromGitHub {
        owner = "pelican-dev";
        repo = "panel";
#        rev = "v${version}";
        rev = "0d5b920fe5acbe73488ca6e0ba160ea3801f2089"; #Todo: WHY THE F**K won't patching the composer-files work?
        hash = "sha256-3Kg2LCmR3XQKAT6zFN2Z/N1AjN3J+W48jy6frqPE6Oc=";
    };

    #patches = [ (fetchpatch{
    #  url = "https://patch-diff.githubusercontent.com/raw/pelican-dev/panel/pull/1376.patch";
    #  #hash = "sha256-N5FlNpk28pZID6JB/sVK51RPZZSnYFmm6WgxPSRXbpc=";
    #}) ];

    vendorHash = "sha256-qmdOYXjQ9ccg2DOrfN5uJvmihwEi2wti4vYI/Nf2O6Q=";

    yarnOfflineCache = fetchYarnDeps {
        yarnLock = src + "/yarn.lock";
        hash = "sha256-WJfLj4eM7W9QhHMG1jK/cPg2hBrK+b7xS3WwjEhm1lc=";
    };

    nativeBuildInputs = [
        yarnBuildHook
        yarnConfigHook
        nodejs
    ];

    meta = {
        description = "Pelican Panel is an open-source, web-based application designed for easy management of game servers.";
        homepage = "https://github.com/pelican-dev/panel";
        license = lib.licenses.agpl3Only;
        maintainers = with lib.maintainers; [ ];
    };
})
