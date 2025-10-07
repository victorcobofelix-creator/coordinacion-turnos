@echo off
title Coordinacion de Turnos - Produccion
setlocal
cd /d "%~dp0"

where node >nul 2>nul || (
  echo No se encontro Node.js en el PATH. Instala Node LTS desde https://nodejs.org
  pause
  exit /b 1
)

if not exist "package.json" (
  echo Este archivo debe estar dentro de la carpeta del proyecto.
  pause
  exit /b 1
)

if not exist "node_modules" (
  echo Instalando dependencias...
  call npm install || (echo Error instalando dependencias & pause & exit /b 1)
)

echo Compilando para produccion...
call npm run build || (echo Error en el build & pause & exit /b 1)

echo Iniciando en http://localhost:3000
start "" http://localhost:3000
call npm start -p 3000
pause
