:: �汾�ţ�0.2
:: ���ߣ�HochenChong
:: ʱ�䣺2019-9-23
@echo off
echo ��ӭʹ�øýű����ϲ������Ƶ�ļ� v0.1 By HochenChong
:: ��ȡ��ǰĿ¼�� mp4 ��ʽ���ļ�����������Ϊ fileName.txt
dir /b *.mp4 > fileName.txt
:: �޸� fileName.txt �ı��еĸ�ʽΪ file '�ļ���'
setlocal enabledelayedexpansion
set startStr=file '
set endStr='
for /f "delims=" %%i in (fileName.txt) do (
echo !startStr!%%i!endStr! >> temp.txt)
type temp.txt>fileName.txt
del /f/q temp.txt
:: ʹ�� ffmpeg ����ϲ����µ� mp4 �ļ�Ϊ new.mp4
ffmpeg -f concat -safe 0 -i fileName.txt -c copy new.mp4
del /f/q fileName.txt
echo ----- �ϲ���ɣ��ļ���Ϊ��new.mp4 -----
pause