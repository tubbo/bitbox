class Bitbox.ModalDialogView extends Ember.View
  showModalBinding: 'controller.showModal'

  +observer showModal
  showModalChanged: ->
    if @showModal
      @$('.reveal-modal').reveal()
      @showModal = false
