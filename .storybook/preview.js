import { withScreenshot } from 'storycap'

export const decorators = [
  withScreenshot, // Registration the decorator is required
]

export const parameters = {
  actions: { argTypesRegex: '^on[A-Z].*' },
  controls: {
    matchers: {
      color: /(background|color)$/i,
      date: /Date$/,
    },
  },
  screenshot: {
    delay: 300,
    viewports: {
      small: {
        width: 350,
        height: 600,
      },
      medium: {
        width: 1025,
        height: 1000,
      },
    },
  },
  layout: 'fullscreen',
}
