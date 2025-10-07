@echo off
title Coordinacion de Turnos - Iniciar
setlocal ENABLEDELAYEDEXPANSION
cd /d "%~dp0"

echo.
echo === Verificando Node.js ===
where node >nul 2>nul
if errorlevel 1 (
  echo No se encontro Node.js en el PATH.
  echo Instala Node LTS desde https://nodejs.org y vuelve a ejecutar este archivo.
  pause
  exit /b 1
)

if not exist "package.json" (
  echo No se encontro package.json. Coloca este archivo dentro de la carpeta del proyecto.
  pause
  exit /b 1
)

echo.
echo === Instalando dependencias (primera vez) ===
if not exist "node_modules" (
  call npm install || (echo Error en npm install & pause & exit /b 1)
) else (
  echo Dependencias ya instaladas.
)

echo.
echo === Iniciando la app en http://localhost:3000 ===
start "" http://localhost:3000
call npm run dev
echo.
echo Servidor detenido.
pause
