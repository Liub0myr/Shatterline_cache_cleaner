@echo off
title Shatterline cache cleaner by Liub0myr
:: https://github.com/Liub0myr/Shatterline_cache_cleaner

:: check if game working 
color e
:game_check_loop
tasklist /FI "IMAGENAME eq Shatterline.exe" | findstr Shatterline.exe > nul
cls
if %errorlevel%==1 (
	color f
	goto game_check_loop_exit
)
echo Close game and press any key to continue...
pause > nul
goto game_check_loop

:game_check_loop_exit

:: Game cache
if exist "%userprofile%\Saved Games\Shatterline\LIVER7211G8K6M\user\cache" (
	echo Removind game cache...
	rd /s /q "%userprofile%\Saved Games\Shatterline\LIVER7211G8K6M\user\cache"
	if not %errorlevel%==0 (
		echo Failed to delete game cache :^(
	) else echo Game cache was removed
) else (
	echo Game cache not found
)
echo.
:: Graphics cache
for %%g in (AMD;NVIDIA) do (
	if exist "%localappdata%\%%g\DxCache\*a15f919d5ab57a19*" (
		echo Removind %%g graphics cache...
		del /q "%localappdata%\%%g\DxCache\*a15f919d5ab57a19*" > nul
		if exist "%localappdata%\%%g\DxCache\*a15f919d5ab57a19*" (
			echo Failed to delete %%g cache :^(
		) else echo %%g graphics cache was removed
	) else (
		echo %%g graphics cache not found
	)
	echo.
)

:: New NVIDIA's graphics cache location
if exist "%localappdata%\..\LocalLow\NVIDIA\PerDriverVersion\DxCache\*a15f919d5ab57a19*" (
	echo Removind NVIDIA graphics cache in new location...
	del /q "%localappdata%\..\LocalLow\NVIDIA\PerDriverVersion\DxCache\*a15f919d5ab57a19*" > nul
	if exist "%localappdata%\..\LocalLow\NVIDIA\PerDriverVersion\DxCache\*a15f919d5ab57a19*" (
		echo Failed to delete NVIDIA graphics cache in new location cache :^(
	) else echo NVIDIA graphics cache in new location was removed
) else (
	echo NVIDIA Graphics cache in new location not found
)
echo.

echo Press any key to exit...
pause > nul
