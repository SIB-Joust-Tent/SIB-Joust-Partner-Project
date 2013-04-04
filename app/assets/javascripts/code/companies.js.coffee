jQuery ->
  createStoryJS({
    type:       'timeline',
    width:      '100%',
    height:     '400',
    source:     'http://docs.google.com/spreadsheet/pub?key=0ArNWRIA9E7UPdGt3SDJoYVU4LXgzMEh5T1NMdDRnLXc&output=html',
    embed_id:   'company-timeline',
    css:        '/assets/timeline.css',
    js:         '/assets/timeline-min.js'
  })