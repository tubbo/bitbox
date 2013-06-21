class Bitbox.ModalDialogView extends Ember.View
  showModalBinding: 'controller.showModal'

  + observes showModal
  showModalChanged: ->
    if @showModal
      @$('.reveal-modal').reveal()
      @showModal = false
