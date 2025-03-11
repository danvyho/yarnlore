import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  toggle(event) {
    event.preventDefault();
    console.log("Reply toggle clicked!");
    this.formTarget.classList.toggle("d-none");
  }
}
