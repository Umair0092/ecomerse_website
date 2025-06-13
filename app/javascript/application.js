// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"; // Provided by popper_js gem
import * as bootstrap from "bootstrap";
window.bootstrap = bootstrap; // Make Bootstrap available globally