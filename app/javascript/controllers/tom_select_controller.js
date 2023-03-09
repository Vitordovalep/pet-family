import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tom-select"
export default class extends Controller {
  static values = { options: Object }

  connect() {
    new TomSelect(this.element, this.optionsValue, {
      create: true,
      sortField: {
        field: "text",
        direction: "asc"
      }
    })
  }
}
