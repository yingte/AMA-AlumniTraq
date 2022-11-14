// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "controllers"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap/dist/js/bootstrap'
import "bootstrap/dist/css/bootstrap";
import "@fortawesome/fontawesome-free/css/all"

require("jquery")
require("jquery-ui")
import $ from 'jquery'
global.$ = jQuery
Rails.start()
Turbolinks.start()
ActiveStorage.start()