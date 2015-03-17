# Documentation https://github.com/Diokuz/baron

define (require, exports, module)->
  require "baron"
  _ = require "underscore"
  Backbone = require "backbone"
  MixinBackbone = require "backbone-mixin"

  SuperView = MixinBackbone(Backbone.View)

  class ScrollerWidget extends SuperView
    template: "#ScrollerComponent"
    className: "scroller_component"

    ui:
      scroller: ".scroller"
      content: ".scroller_content"

    bindings:
      "@ui.number": "text: number"

    initialize: (@opts)->

    reloadTemplate: ->
      @$wrappedEl = @$el.children().detach()
      super

    bindRegions:->
      super
      @ui.content.append @$wrappedEl

    refresh: ->
      @ui.scroller.trigger 'sizeChange'

    render: ->
      options = {
        bar: ".scroller__bar"
        track: ".scroller__track"
        barOnCls: "baron"
      }
      @ui.scroller.baron _.extend(options, @opts.baron)


