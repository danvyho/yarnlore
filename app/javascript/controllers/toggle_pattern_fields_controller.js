import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-pattern-fields"
export default class extends Controller {
  static targets = [ "patternFields" ]

  connect() {

  }

  toggle(event) {
    this.patternFieldsTarget.classList.toggle('visually-hidden');
    this.patternFieldsTarget.querySelector('button').click()
  }
}
