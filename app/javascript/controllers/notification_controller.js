import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="notification"
export default class extends Controller {


  connect() {
    console.log("conectado")
  }

  clear() {
    this.element.remove()
  }
}
