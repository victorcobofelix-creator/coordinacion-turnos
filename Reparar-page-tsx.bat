@echo off
title Reparar archivo app\page.tsx
cd /d "%~dp0"

if not exist "app\page.tsx" (
  echo No se encontro app\page.tsx
  pause
  exit /b 1
)

echo Reescribiendo app\page.tsx con version limpia...

(
echo "use client";
echo.
echo import React, { useEffect, useState } from "react";
echo.
echo export default function Page() {
echo.  const [canInstall, setCanInstall] = useState(false);
echo.  const [deferredPrompt, setDeferredPrompt] = useState(null);
echo.
echo.  useEffect(() => {
echo.    if ("serviceWorker" in navigator) {
echo.      window.addEventListener("load", () => {
echo.        navigator.serviceWorker.register("/sw.js").catch(console.error);
echo.      });
echo.    }
echo.    const handler = (e) => {
echo.      e.preventDefault();
echo.      setDeferredPrompt(e);
echo.      setCanInstall(true);
echo.    };
echo.    window.addEventListener("beforeinstallprompt", handler);
echo.    return () => window.removeEventListener("beforeinstallprompt", handler);
echo.  }, []);
echo.
echo.  const onInstall = async () => {
echo.    if (!deferredPrompt) return;
echo.    deferredPrompt.prompt();
echo.    await deferredPrompt.userChoice;
echo.    setDeferredPrompt(null);
echo.    setCanInstall(false);
echo.  };
echo.
echo.  return ^(
echo.    ^<div style={{ fontFamily: "system-ui", color: "#e5e7eb", background: "#0b1220", minHeight: "100vh", padding: "2rem" }}^>
echo.      ^<h1^>Coordinación de Turnos^</h1^>
echo.      ^<p^>App y web para coordinar turnos, registrar incidencias y exportar reportes.^</p^>
echo.      ^<button
echo.        onClick={onInstall}
echo.        disabled={!canInstall}
echo.        style={{ background: "#0ea5e9", color: "white", padding: "10px 16px", border: "none", borderRadius: "8px", cursor: "pointer" }}
echo.      ^>
echo.        Instalar como App
echo.      ^</button^>
echo.    ^</div^>
echo.  ^);
echo }
) > app\page.tsx

echo.
echo Archivo reparado correctamente.
pause
