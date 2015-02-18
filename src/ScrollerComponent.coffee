# Documentation https://github.com/Diokuz/baron

define (require, exports, module)->
  require "baron"
  _ = require "underscore"
  backbone = require 'backbone'
  MixinBackbone = require 'mixin-backbone'

  SuperView = MixinBackbone(Backbone.View)

  class ScrollerWidget extends SuperView
    template: "#ScrollerComponent"
    className: "scroller_component"

    ui:
      scroller: ".scroller"
      content: ".scroller_content"

    bindings:
      '@ui.number': 'text: number'

    initialize: (@opts)->
      @model = new Model

    reloadTemplate: ->
      @$wrappedEl = @$el.children().detach()
      super

    bindRegions:->
      super
      @ui.content.append @$wrappedEl


    render: ->
      options = {
        bar: '.scroller__bar'
        track: '.scroller__track'
        barOnCls: 'baron'
      }
      @ui.scroller.baron _.extend(options, @opt.baron)


