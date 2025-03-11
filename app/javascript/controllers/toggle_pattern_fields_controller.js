import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-pattern-fields"
export default class extends Controller {
  static targets = [ "radio", "patternFields" ]

  connect() {
    this.radioTargets.forEach(radio => {
      if (radio.value == "pattern" && radio.checked) {
        this.patternFieldsTarget.classList.remove('visually-hidden');
        this.patternFieldsTarget.querySelector('button').click()
      }
    }
    );
  }

  toggle(event) {
    this.patternFieldsTarget.classList.toggle('visually-hidden');
    this.patternFieldsTarget.querySelector('button').click()
  }
}
