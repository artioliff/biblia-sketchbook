/**
 * tailwind-config.js — Bíblia Sketchbook
 * Configuração centralizada do Tailwind CDN.
 *
 * Como usar em cada HTML (APÓS o CDN):
 *
 *   livros/*.html  →  <script src="../tailwind-config.js"></script>
 *   raiz/*.html    →  <script src="./tailwind-config.js"></script>
 */
tailwind.config = {
  theme: {
    extend: {
      fontFamily: {
        display: ['Cinzel', 'serif'],
        body:    ['Crimson Pro', 'serif'],
      },
      colors: {
        ink: {
          DEFAULT: '#1c1410',
          light:   '#3d2f25',
          muted:   '#7a6352',
          faint:   '#b8a898',
        },
        gold:    { DEFAULT: '#c8913a', light: '#e8c97a', dark: '#8a6020' },
        crimson: { DEFAULT: '#8b2020', light: '#c45050', pale: '#f5e8e8' },
        sapphire:{ DEFAULT: '#1e3a5f', light: '#3a6090', pale: '#e8f0f8' },
        forest:  { DEFAULT: '#1e4a2a', light: '#3a7a50', pale: '#e8f5ec' },
        earth:   { DEFAULT: '#5c3d1e', light: '#8c6030', pale: '#f5ede0' },
        fire:    { DEFAULT: '#b84a10', light: '#e07030', pale: '#fdf0e8' },
        violet:  { DEFAULT: '#4a1e6e', light: '#7a3aa8', pale: '#f0e8f8' },
        dusk:    { DEFAULT: '#3a2a5e', light: '#5a4a8e', pale: '#eeebf8' },
        sand:    { DEFAULT: '#a08040', light: '#c8a860', pale: '#faf3e0' },
        parch: {
          50:  '#fdf8ef',
          100: '#f7edda',
          200: '#eedcb8',
        },
      },
      animation: {
        'fade-up':  'fadeUp 0.7s ease both',
        'fade-in':  'fadeIn 0.6s ease both',
        'slide-in': 'slideIn 0.5s ease both',
      },
      keyframes: {
        fadeUp: {
          '0%':   { opacity: '0', transform: 'translateY(24px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        fadeIn: {
          '0%':   { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideIn: {
          '0%':   { opacity: '0', transform: 'translateX(-16px)' },
          '100%': { opacity: '1', transform: 'translateX(0)' },
        },
      },
    },
  },
}
