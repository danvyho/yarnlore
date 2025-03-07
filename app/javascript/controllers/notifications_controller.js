import { Controller } from "@hotwired/stimulus";
import { Turbo } from "@hotwired/turbo-rails";

export default class extends Controller {
  static values = { url: String };

  connect() {
    this.refresh();
    this.interval = setInterval(() => this.refresh(), 10000); // Refresh every 10s
  }

  disconnect() {
    clearInterval(this.interval);
  }

  async refresh() {
    const response = await fetch(this.urlValue);
    if (response.ok) {
      const html = await response.text();
      this.element.innerHTML = html;
      Turbo.renderStreamMessage(html);
    }
  }
}
