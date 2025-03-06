import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-loading"
import { Turbo } from "@hotwired/turbo-rails"

const application = Application.start()
application.debug = false
window.Stimulus = application

const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

// Re-initialize Stimulus controllers after Turbo updates the DOM
Turbo.on("frame:load", () => {
  application.start()
})
