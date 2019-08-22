import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import { Controller } from 'stimulus';

export default class extends Controller {
  filter(event) {
    Rails.stopEverything(event);
    Turbolinks.visit(this.element.href);
  }
}
