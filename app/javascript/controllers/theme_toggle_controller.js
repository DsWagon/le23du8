import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["btnSwitch"];

  toggleTheme(event) {
    const root = document.documentElement;
    const currentTheme = root.getAttribute('data-bs-theme');
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
    root.setAttribute('data-bs-theme', newTheme);

    // Basculer les icônes en utilisant les classes CSS
    this.btnSwitchTargets.forEach(target => {
      target.dataset.theme = newTheme;
    });
  }
}
