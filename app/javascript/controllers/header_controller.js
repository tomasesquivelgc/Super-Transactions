import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {
  static targets = [ "openMenu" ];
  connect() {
    this.openMenuTarget.addEventListener("click", () => {
      toggle(document.getElementById("mobile-menu"))
    })
  }
}
