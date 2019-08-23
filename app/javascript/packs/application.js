import Rails from '@rails/ujs';
Rails.start();

import Turbolinks from 'turbolinks';
Turbolinks.start();

require('@rails/activestorage').start();
require('channels');

import 'todomvc-common/base.css';
import 'todomvc-app-css/index.css';
import 'stylesheets/application.scss';
import 'controllers';
