
import typography from '@tailwindcss/typography';
import containerQueries from '@tailwindcss/container-queries';

/** @type {import('tailwindcss').Config} */
export default {
	darkMode: 'class',
	content: ['./src/**/*.{html,js,svelte,ts}'],
	theme: {
		extend: {
			colors: {
				gray: {
					50: 'var(--color-gray-50, #f9f9f9)',
					100: 'var(--color-gray-100, #ececec)',
					200: 'var(--color-gray-200, #e3e3e3)',
					300: 'var(--color-gray-300, #cdcdcd)',
					400: 'var(--color-gray-400, #b4b4b4)',
					500: 'var(--color-gray-500, #9b9b9b)',
					600: 'var(--color-gray-600, #676767)',
					700: 'var(--color-gray-700, #4e4e4e)',
					800: 'var(--color-gray-800, #171717)',
					850: 'var(--color-gray-850, #121212)',
					900: 'var(--color-gray-900, #0a0a0a)',
					950: 'var(--color-gray-950, #050505)'
				}
			},
			typography: {
				DEFAULT: {
					css: {
						pre: false,
						code: false,
						'pre code': false,
						'code::before': false,
						'code::after': false
					}
				}
			},
			padding: {
				'safe-bottom': 'env(safe-area-inset-bottom)'
			},
			borderRadius: {
				DEFAULT: '0.25rem',
				'none': '0',
				'sm': '0.125rem',
				'md': '0.25rem',
				'lg': '0.25rem',
				'xl': '0.25rem',
				'2xl': '0.25rem',
				'3xl': '0.25rem',
				'full': '9999px',
			},
			transitionProperty: {
				width: 'width'
			}
		}
	},
	plugins: [typography, containerQueries]
};
