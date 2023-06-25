@echo off
REM setlocal

cmd /c c:\wbadmin.bat

if %errorlevel%==255 (
  REM Control+C trap
  taskkill
  wbadmin stop job -quiet
  else (
    REM If this script finishes execution on its own, without
    REM signal trap
  )
)
