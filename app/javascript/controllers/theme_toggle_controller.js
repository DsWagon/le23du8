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

    // Sauvegarder le thème dans localStorage
    localStorage.setItem('theme', newTheme);
  }

  initialize() {
    // Charger l'état du thème depuis localStorage lors de l'initialisation
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme) {
      document.documentElement.setAttribute('data-bs-theme', savedTheme);
      this.updateIcon(savedTheme);
    }
  }

  updateIcon(theme) {
    // Mettre à jour les icônes en utilisant les classes CSS
    this.btnSwitchTargets.forEach(target => {
      target.dataset.theme = theme;
    });
  }
}

