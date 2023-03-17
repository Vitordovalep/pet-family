import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-pets"
export default class extends Controller {
  static targets = ["card", "optionCard"]

  connect() {
    console.log("coneccted on dropdown");
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

  displayOptions(event) {
    event.preventDefault();
    this.optionCardTarget.classList.toggle('d-none')
  }

}
