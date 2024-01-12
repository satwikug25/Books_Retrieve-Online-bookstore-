/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx}",
  ],
  theme: {
    extend: {
      colors: {
        'cozy-cream': '#f3e5cf',
        'cozy-peach': '#edcbb1',
        'cozy-latte': '#d1b099',
        'warm-brown': '#7D5A50',
        'button-yellow': '#eab308',
        'button-hover-yellow': '#ca8a04',
        'warm-brown-dark': '#634832', // Added for button hover state
      },
      backgroundImage: {
        'page-gradient': 'linear-gradient(to right, #f3e5cf, #edcbb1, #d1b099)',
        'card-gradient': 'linear-gradient(to bottom right, #edcbb1, #d1b099)', // New gradient for the card
      },
      boxShadow: {
        'custom': '0 4px 6px rgba(0, 0, 0, 0.1)',
      }
    },
  },
  plugins: [],
};
