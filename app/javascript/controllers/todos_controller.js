import Rails from '@rails/ujs';
import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['toggleAll', 'checkbox', 'hiddenField', 'selectAll', 'updateAllForm'];

  toggleAll(event) {
    this.selectAllTarget.value = this.hiddenFieldTargets.map(x => x.value);
    Rails.handleRemote.call(this.updateAllFormTarget, event)
  }
}
