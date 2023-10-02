import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    // Fermez automatiquement l'alerte après 5 secondes
    setTimeout(() => {
      this.element.classList.remove('show');
    }, 5000); // 5000 millisecondes (5 secondes)
  }
}
