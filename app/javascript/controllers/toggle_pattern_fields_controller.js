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
    // empty the pattern fields if the user selects the "post" radio button
    if (event.target.value == "post") {
      this.patternFieldsTarget.querySelectorAll('input').forEach(input => {
        input.value = ''
      }
      );
      this.patternFieldsTarget.classList.add('visually-hidden');
    }
    if (event.target.value == "pattern") {
      this.patternFieldsTarget.classList.remove('visually-hidden');
      const accordionButton = this.patternFieldsTarget.querySelector('button')
      if (accordionButton.classList.contains('collapsed')) {
        accordionButton.click()
      }
    }
  }
}
