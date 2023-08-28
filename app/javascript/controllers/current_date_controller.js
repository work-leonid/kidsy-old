import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="current-date"
export default class extends Controller {
  static targets = ["date"]
  
  connect() {
    this.updateDate();
    this.startRefreshing();
  }
  
  disconnect() {
    this.stopRefreshing();
  }

  updateDate() {
    const date = new Date()
    this.dateTarget.textContent = `Today, ${date.toLocaleDateString('en-US', { month: 'long', day: 'numeric' })}`
  }

  startRefreshing() {
    this.refreshTimer = setInterval( () => {
      this.updateDate();
    }, 1000 * 60 * 60) // Update every hour
  }

  stopRefreshing() {
    if (this.refreshTimer) {
      clearInterval(this.refreshTimer);
    }
  }
}
