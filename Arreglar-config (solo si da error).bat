@echo off
title Arreglar next.config.js y next-env.d.ts
setlocal
cd /d "%~dp0"

> next.config.js echo /** @type {import('next').NextConfig} */
>> next.config.js echo const nextConfig = {};
>> next.config.js echo module.exports = nextConfig;

> next-env.d.ts echo /// ^<reference types="next" />
>> next-env.d.ts echo /// ^<reference types="next/image-types/global" />
>> next-env.d.ts echo
>> next-env.d.ts echo // NOTE: This file should not be edited
>> next-env.d.ts echo // see https://nextjs.org/docs/basic-features/typescript for more information.

echo Configuracion corregida. Iniciando en modo desarrollo...
call npm run dev
