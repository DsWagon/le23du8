import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  toggleTheme(event) {
    const root = document.documentElement;
    const currentTheme = root.getAttribute('data-bs-theme');
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
    root.setAttribute('data-bs-theme', newTheme);
  }
}
