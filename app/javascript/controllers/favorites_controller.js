import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorites"
export default class extends Controller {
  static values = {
    id: Number
  }
  connect() {
  }
  toggleFavorite() {
    fetch(`/posts/${this.idValue}/favorites`,{
      method: "POST"
    } )

  }
}
