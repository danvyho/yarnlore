import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="message"
export default class extends Controller {
  static values = { userId: Number }
  connect() {
    // triggered when a new message is added to the page
    const currentUserId = parseInt(document.body.dataset.currentUserId, 10);

    if (this.userIdValue === currentUserId) {
      this.element.classList.add('reply');
      this.element.classList.remove('sender');
    } else {
      this.element.classList.add('sender');
      this.element.classList.remove('reply');
    }
    this.element.scrollIntoView({ behavior: 'smooth' }); // scroll to the bottom of the page
  }
}
