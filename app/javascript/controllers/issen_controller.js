import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="issen"
export default class extends Controller {
  connect() {
    console.log("Hello, I'm issen_controller.js!!!")
  }
}
