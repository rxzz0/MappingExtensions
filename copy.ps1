& $PSScriptRoot/build.ps1
if ($?) {
    adb push libs/arm64-v8a/libmappingextensions.so /sdcard/Android/data/com.beatgames.beatsaber/files/mods/libmappingextensions.so
    if ($?) {
        & $PSScriptRoot/restart-game.ps1
        if ($args[0] -eq "--log") {
            if ($args[1] -eq "--self") {
                & $PSScriptRoot/start-logging.ps1 --self
            } elseif ($args[1] -eq "--file") {
                & $PSScriptRoot/start-logging.ps1 --file
            } elseif ($args[1] -eq "--custom") {
                & $PSScriptRoot/start-logging.ps1 --custom $args[2]
            } else  {
                & $PSScriptRoot/start-logging.ps1
            }
        }
    }
}