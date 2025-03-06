import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorites"
export default class extends Controller {
  static values = {
    id: Number
  }
  connect() {
  }
  toggleFavorite(event) {
    fetch(`/posts/${this.idValue}/favorites`,{
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      }
    } )
    event.currentTarget.classList.toggle("fa-solid")
    event.currentTarget.classList.toggle("fa-regular")

  }
}
