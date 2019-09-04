import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['toggleAll', 'checkbox'];

  toggleAll() {
    this.checkboxTargets.forEach(function(element) {
      element.click();
    });
  }
}
