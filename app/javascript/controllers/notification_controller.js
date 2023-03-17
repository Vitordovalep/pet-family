import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification"
export default class extends Controller {
static values = {id: Number}
static targets = ["message"]

  connect() {
    console.log("oie")
    console.log(this.messageTarget)
    console.log(this.idValue)
    this.channel= createConsumer().subscriptions.create(
      {
        channel: "NotificationsChannel",
        id: this.idValue
      },
      {
        received: data=> {
          console.log(data)
          alert(data.message)
        }
      }
    )
  }

  notify() {
    console.log("notify")

  }
}
