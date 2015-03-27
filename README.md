# Scroll component view for generator-sp

Usefull only with [generator-sp](https://github.com/snphq/generator-sp).

## Installation

Install it from bower.
```bash
bower install snp-component-scroll --save
```

Add styles reference in `main.scss`
```scss
@import "../bower_components/snp-component-scroll/lib/ScrollerComponent";
```

Add js requirements reference to `main.coffee`
```coffee
...
require.config
  paths:
  ...
  'baron': "#{VENDOR_PATH}/baron/baron"
  'ScrollerComponent': "#{VENDOR_PATH}/snp-component-scroll/dist/ScrollerComponent"

...
```

# Usage 

Add component region into view, where You want install scroller  
**coffee**
```coffee
define (require, exports, module)->
  _Page = require "../_Page"
  ScrollerComponent = require "ScrollerComponent"

  IndexPage = _Page.extend
    template:"#IndexPage"
    className:"index_page"

    regions:
      scroller:
        el: '[data-view-scroller]'
        view: ScrollerComponent
```

Add region selector to block You want to scroll.  
**jade**
```jade
.scroller(data-view-scroller)
  p Large content block U need to scroll
```

Set height for this block.  
**sass**  
```sass
.index_page
  .scroller
    height: 300px
```

Use `refresh()` to refresh scroller manualy
```coffee
  onDataChange: ->
    @r.scroller.refresh()
```
