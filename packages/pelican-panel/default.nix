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
        rev = "v${version}";
        hash = "sha256-nyqWq9BQ2Ne1IdG1IAHNy2qRlEp/WptmGmOkcRnNwuk=";
    };

    yarnOfflineCache = fetchYarnDeps {
        yarnLock = src + "/yarn.lock";
        hash = "sha256-WJfLj4eM7W9QhHMG1jK/cPg2hBrK+b7xS3WwjEhm1lc=";
    };

    composerStrictValidation = false;
    #Ideally composer.patch would be applied, but I couldn't get it to apply before compose vendoring
    #Or https://github.com/pelican-dev/panel/pull/1376 is merged
    vendorHash = "sha256-qmdOYXjQ9ccg2DOrfN5uJvmihwEi2wti4vYI/Nf2O6Q";

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
