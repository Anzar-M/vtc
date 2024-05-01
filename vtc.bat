@echo off
setlocal enabledelayedexpansion

set "total_seconds=0"

for /r %%i in (*.mp4 *.mkv *.avi *.mov *.wmv *.flv *.webm *.mpeg *.mpg *.m4v *.ts *.3gp *.m2ts *.mts *.vob *.ogv *.rmvb *.mxf *.asf *.divx *.rm *.dat *.iso *.wma *.mp3 *.wav *.ogg *.flac *.ape *.aac *.ac3 *.dts *.mka *.opus *.m4a *.cue *.ts *.pls *.xspf) do (
    for /f "tokens=*" %%a in ('ffprobe -v error -show_entries format^=duration -of default^=noprint_wrappers^=1:nokey^=1 "%%i" 2^>^&1') do (
        set "duration=%%a"
        set /a "total_seconds+=duration"
    )
)

set /a "hours=total_seconds / 3600"
set /a "minutes=(total_seconds %% 3600) / 60"
set /a "seconds=total_seconds %% 60"

echo Total Playtime: %hours%:%minutes%:%seconds%

pause

