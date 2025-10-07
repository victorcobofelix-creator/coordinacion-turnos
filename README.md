# Coordinación de Turnos — MVP (Next.js)

Proyecto mínimo listo para ejecutar.

## Requisitos
- Node.js 20+
- npm, pnpm o yarn

## Instalar y ejecutar
```bash
npm install
npm run dev
# abre http://localhost:3000
```

## Build producción
```bash
npm run build
npm start
```

## Personalización de marca
Edita `styles/globals.css` y cambia las variables CSS (ej. `--acc`, `--bg`).

## PWA
- `public/manifest.json` enlazado en `app/layout.tsx`
- `public/sw.js` con estrategia básica de caché
