import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-pets"
export default class extends Controller {
  static targets = ["card"]

  connect() {
  }

  filter(event) {
    event.preventDefault();
    const url = event.currentTarget.href;
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response=>response.text())
    .then((data) => {
      this.cardTarget.outerHTML = data
    })
  }

}
