if typeof window isnt 'undefined'
  Mousetrap = require 'mousetrap'

EventEmitter = require 'wolfy-eventemitter'

class Dispatcher extends EventEmitter.EventEmitter
  construct: ->

  replaceCells: (cellsArray) ->
    @emit 'replace-cells', cellsArray

  handleCellDoubleClicked: (coord) ->
    @emit 'cell-doubleClicked', coord # coord should be an array like [rowNumber, colNumber]

  handleCellClicked: (coord) ->
    @emit 'cell-clicked', coord

  handleCellEdited: (value) ->
    @emit 'new-cell-value', value

  initKeyboardShortcuts: ->
    shortcuts =
      'down': ['down', 'enter']
      'up': 'up'
      'left': 'left'
      'right': 'right'
      'all-down': 'ctrl+down'
      'all-up': 'ctrl+up'
      'all-left': 'ctrl+left'
      'all-right': 'ctrl+right'
      'del': 'del'
      'esc': 'esc'

    for eventChannel, shortcut of shortcuts
      (=>
        channel = eventChannel
        Mousetrap.bind shortcut, (e) =>
          @emit channel, e
      )()

dispatcher = new Dispatcher
dispatcher.initKeyboardShortcuts()

module.exports = dispatcher
