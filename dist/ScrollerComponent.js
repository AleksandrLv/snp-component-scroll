/*! snp-component-scroll 0.0.6 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

define(function(require, exports, module) {
  var Backbone, MixinBackbone, ScrollerWidget, SuperView, _;
  require("baron");
  _ = require("underscore");
  Backbone = require("backbone");
  MixinBackbone = require("backbone-mixin");
  SuperView = MixinBackbone(Backbone.View);
  return ScrollerWidget = (function(superClass) {
    extend(ScrollerWidget, superClass);

    function ScrollerWidget() {
      return ScrollerWidget.__super__.constructor.apply(this, arguments);
    }

    ScrollerWidget.prototype.className = "scroller_component";

    ScrollerWidget.prototype.templateFunc = function() {
      return "<div class='scroller'>\n  <div class='scroller_content' data-js-content></div>\n  <div class='scroller__track'>\n    <div class='scroller__bar'></div>\n  </div>\n</div>";
    };

    ScrollerWidget.prototype.ui = {
      scroller: ".scroller",
      content: ".scroller_content"
    };

    ScrollerWidget.prototype.initialize = function(opts) {
      this.opts = opts;
    };

    ScrollerWidget.prototype.reloadTemplate = function() {
      this.$wrappedEl = this.$el.children().detach();
      return ScrollerWidget.__super__.reloadTemplate.apply(this, arguments);
    };

    ScrollerWidget.prototype.bindRegions = function() {
      ScrollerWidget.__super__.bindRegions.apply(this, arguments);
      return this.ui.content.append(this.$wrappedEl);
    };

    ScrollerWidget.prototype.refresh = function() {
      return this.ui.scroller.trigger('sizeChange');
    };

    ScrollerWidget.prototype.render = function() {
      var options;
      options = {
        bar: ".scroller__bar",
        track: ".scroller__track",
        barOnCls: "baron"
      };
      return this.ui.scroller.baron(_.extend(options, this.opts.baron));
    };

    return ScrollerWidget;

  })(SuperView);
});
