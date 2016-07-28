$ ->
  $('#masonry-container').masonry
    itemSelector: '.box',
    columnWidth: 100,
    isAnimated: !Modernizr.csstransitions,
    isFitWidth: true
