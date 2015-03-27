# Documentation https://github.com/Diokuz/baron

define (require, exports, module)->
  require "baron"
  _ = require "underscore"
  Backbone = require "backbone"
  MixinBackbone = require "backbone-mixin"

  SuperView = MixinBackbone(Backbone.View)

  class ScrollerWidget extends SuperView
    className: "scroller_component"
    templateFunc: ->
      """
      <div class='scroller'>
        <div class='scroller_content' data-js-content></div>
        <div class='scroller__track'>
          <div class='scroller__bar'></div>
        </div>
      </div>
      """

    ui:
      scroller: ".scroller"
      content: ".scroller_content"


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


