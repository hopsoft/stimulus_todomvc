import Rails from '@rails/ujs';
import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['form', 'toggleAll', 'checkbox', 'hiddenField', 'selectAll', 'updateAllForm'];

  toggleAll(event) {
    event.preventDefault();
    console.log(this.checkboxTargets);
    this.checkboxTargets.forEach(el => {
      if (!el.checked) {
        el.checked = true;
      }
    });
    // this.selectAllTarget.value = this.hiddenFieldTargets.map(x => x.value);
    // Rails.handleRemote.call(this.updateAllFormTarget, event);
  }

  submit(event) {
    debugger;
    Rails.handleRemote.call(this.formTarget, event);
  }
}
// include_hidden: false;
