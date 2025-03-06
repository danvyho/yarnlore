import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reset-form"
export default class extends Controller {
  connect() {
    console.log('Form connected', this.element);
  }

  reset() {
    this.element.reset()
    console.log('Form reset', this.element);
  }
}
