# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "@rails/request.js", to: "https://ga.jspm.io/npm:@rails/request.js@0.0.6/src/index.js"
pin "@checkbox", to: "https://unpkg.com/@material-tailwind/html@latest/scripts/ripple.js", preload: true
pin "@tooltip", to: "https://unpkg.com/@material-tailwind/html@latest/scripts/tooltip.js"
pin_all_from "app/javascript/controllers", under: "controllers"
