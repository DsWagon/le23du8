import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggleButton"];

  toggleMeeting(event) {
    const currentView = this.toggleButtonTarget.dataset.currentView;

    if (currentView === "list") {
      this.toggleTableView();
    } else {
      this.toggleCardView();
    }
  }

  toggleCardView() {
    this.toggleButtonTarget.dataset.currentView = "list";
    // Ajoutez ici le code pour basculer vers la vue de liste
  }

  toggleTableView() {
    this.toggleButtonTarget.dataset.currentView = "table";
    // Ajoutez ici le code pour basculer vers la vue de table
  }
}
