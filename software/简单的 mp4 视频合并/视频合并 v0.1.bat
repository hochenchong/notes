:: 版本号：0.2
:: 作者：HochenChong
:: 时间：2019-9-23
@echo off
echo 欢迎使用该脚本来合并多个视频文件 v0.1 By HochenChong
:: 获取当前目录下 mp4 格式的文件名，并导出为 fileName.txt
dir /b *.mp4 > fileName.txt
:: 修改 fileName.txt 文本中的格式为 file '文件名'
setlocal enabledelayedexpansion
set startStr=file '
set endStr='
for /f "delims=" %%i in (fileName.txt) do (
echo !startStr!%%i!endStr! >> temp.txt)
type temp.txt>fileName.txt
del /f/q temp.txt
:: 使用 ffmpeg 命令合并成新的 mp4 文件为 new.mp4
ffmpeg -f concat -safe 0 -i fileName.txt -c copy new.mp4
del /f/q fileName.txt
echo ----- 合并完成，文件名为：new.mp4 -----
pause