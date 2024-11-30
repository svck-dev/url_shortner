import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["url"]
  copy() {
    const url = this.urlTarget.textContent.trim().split(' ').pop()
    navigator.clipboard.writeText(url).then(() => {
      alert('URL copied to clipboard ' + url )
    }).catch(err => {
      console.error('Could not copy text: ', err)
    })
  }
}
