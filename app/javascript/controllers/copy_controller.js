import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["url"]
  copy() {
    const url = this.urlTarget.textContent.trim().split(' ').pop()
    navigator.clipboard.writeText(url).then(() => {
      this.showNotification(`URL copied to clipboard ${url}`)
    }).catch(err => {
      console.error('Could not copy text: ', err)
    })
  }

  showNotification(message) {
      alert(message) // in case we need to change this to an actual notification
  }
}
