import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["cardView", "tableView"]
  

  toggleCardView() {
    this.cardViewTargets.forEach((el) => {
      el.style.display = "block"
    })
    this.tableViewTarget.style.display = "none"
  }

  toggleTableView() {
    this.cardViewTargets.forEach((el) => {
      el.style.display = "none"
    })
    this.tableViewTarget.style.display = "block"
  }
}
