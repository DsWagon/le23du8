// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import "trix"
import "@rails/actiontext"


/// Prevents the user from dropping a file into the Trix editor important for security
document.addEventListener("trix-file-accept", (e) => {
  e.preventDefault();
  });
