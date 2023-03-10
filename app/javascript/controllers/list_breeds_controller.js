import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="list-breeds"
export default class extends Controller {
  static targets = ["species", "breeds"]

  connect() {
    console.log("ouvindo")
  }

  listContent() {
    // console.log(this.speciesTarget.options[this.speciesTarget.selectedIndex].value);
    const id = this.speciesTarget.options[this.speciesTarget.selectedIndex].value
    const url = `/species/${id}/breeds`
    fetch(url)
    .then(response => response.json())
    .then((data) => {

      this.breedsTarget.innerHTML = ""

      data.forEach((breed) => {
        const option = document.createElement("option");
        option.value = breed[0];
        option.text = breed[1];

        this.breedsTarget.add(option, null);
      })
    })
 }

}
