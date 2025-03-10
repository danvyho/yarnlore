import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["section"]

  toggle() {
    console.log("I'm working!");
    event.preventDefault();
    this.sectionTarget.classList.toggle("d-none")
  }
}
