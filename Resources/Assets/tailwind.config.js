const plugin = require('tailwindcss/plugin')

module.exports = {
    purge: [],
    darkMode: 'media', // or 'media' or 'class'
    theme: {
        fontSize: {
            'tiny': '.65rem',
            'xs': '.75rem',
            'sm': '.875rem',
            'base': '1rem',
            'lg': '1.125rem',
            'xl': '1.25rem',
            '2xl': '1.5rem',
            '3xl': '1.875rem',
            '4xl': '2.25rem',
            '5xl': '3rem',
            '6xl': '4rem',
            '7xl': '5rem',
        },
        fontFamily: {
            'sans': ['Open Sans', 'Helvetica', 'Arial', 'sans-serif'],
            'sans-body': ['Nunito', 'Helvetica', 'Arial', 'sans-serif'],
        },
        extend: {
            variants: {
                fill: ['hover', 'focus'],
            },
            typography(theme) {
                return {
                    DEFAULT: {
                        css: {
                            blockquote: {
                                borderLeft: '.25rem',
                                borderLeftColor: theme("colors.gray.100")
                            },
                            p: {
                                img: {
                                    marginLeft: 'auto',
                                    marginRight: 'auto',
                                    display: 'block',
                                }
                            }
                        }
                    },
                    '2xl': {
                        css: {
                            h1: { fontSize: '2.25rem' },
                            h2: { fontSize: '2rem' },
                            h3: { fontSize: '1.8rem' },
                            h4: { fontSize: '1.6rem' }
                        }
                    },
                    'xl': {
                        css: {
                            h1: { fontSize: '2.1rem' },
                            h2: { fontSize: '1.9rem' },
                            h3: { fontSize: '1.7rem' },
                            h4: { fontSize: '1.5rem' }
                        }
                    },
                    dark: {
                        css: {
                            color: theme("colors.gray.300"),
                            '[class~="lead"]': { color: theme("colors.gray.400") },
                            a: { color: theme("colors.gray.100") },
                            strong: { color: theme("colors.gray.100") },
                            "ul > li::before": { backgroundColor: theme("colors.gray.700") },
                            hr: { borderColor: theme("colors.gray.800") },
                            blockquote: {
                                color: theme("colors.gray.100"),
                                borderLeftColor: theme("colors.gray.800"),
                            },
                            h1: { color: theme("colors.gray.100") },
                            h2: { color: theme("colors.gray.100") },
                            h3: { color: theme("colors.gray.100") },
                            h4: { color: theme("colors.gray.100") },
                            thead: {
                                color: theme("colors.gray.100"),
                                borderBottomColor: theme("colors.gray.700"),
                            },
                            "tbody tr": { borderBottomColor: theme("colors.gray.800") },
                        },
                    },
                };
            },
        },
    },
    variants: {
        extend: {
            typography: ["dark"],
            display: ["dark"]
        }
    },
    plugins: [
        require('@tailwindcss/aspect-ratio'),
        require('@tailwindcss/forms'),
        require('@tailwindcss/typography'),
        plugin(function ({ addUtilities }) {
            const newUtilities = {
                '.safe-top': {
                    paddingTop: 'constant(safe-area-inset-top)',
                    paddingTop: 'env(safe-area-inset-top)'
                },
                '.safe-left': {
                    paddingLeft: 'constant(safe-area-inset-left)',
                    paddingLeft: 'env(safe-area-inset-left)'
                },
                '.safe-right': {
                    paddingRight: 'constant(safe-area-inset-right)',
                    paddingRight: 'env(safe-area-inset-right)'
                },
                '.safe-bottom': {
                    paddingBottom: 'constant(safe-area-inset-bottom)',
                    paddingBottom: 'env(safe-area-inset-bottom)'
                }
            }

            addUtilities(newUtilities);
        })
    ],
}
