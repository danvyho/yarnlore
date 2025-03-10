// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"


document.addEventListener("turbo:load", function() {
  const forms = document.querySelectorAll('form[data-confirm]');

  forms.forEach(form => {
    form.addEventListener('submit', function(event) {
      const confirmationMessage = form.getAttribute('data-confirm');
      if (!confirm(confirmationMessage)) {
        event.preventDefault();
      }
    });
  });
});
