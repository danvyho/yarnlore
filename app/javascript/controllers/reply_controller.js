import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  toggle(event) {
    event.preventDefault();
    this.containerTarget.classList.toggle("d-none");
  }
}
