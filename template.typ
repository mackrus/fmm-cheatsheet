// Template for dense Typst cheat sheets
#let example_counter = counter("example")

#let example(title, question, steps, result, accent: rgb("#004a99")) = {
  example_counter.step()
  context block(
    breakable: false,
    width: 100%,
    fill: rgb("#f8f9fa"),
    stroke: (left: 1.5pt + accent),
    inset: (x: 3pt, y: 2pt),
    outset: (x: 0pt, y: 1pt),
    radius: 1pt,
  )[
    #set text(size: 5.0pt)
    *Ex #example_counter.display(): #title* \
    #set text(size: 4.5pt)
    *Q:* #question \
    *S:* #steps \
    #block(
      fill: accent.lighten(90%),
      width: 100%,
      inset: 2pt,
      radius: 1pt,
      [*Res:* #result]
    )
  ]
}

#let key(body, accent: rgb("#fbc02d")) = {
  rect(
    fill: accent.lighten(95%),
    stroke: 0.5pt + accent,
    width: 100%,
    inset: 3pt,
    radius: 2pt,
    body
  )
}

#let cheatsheet(
  title: "Cheat Sheet",
  author: none,
  lang: "sv",
  columns: 3,
  body,
) = {
  if author != none {
    set document(title: title, author: author)
  } else {
    set document(title: title)
  }
  set page(
    columns: columns,
    margin: (x: 0.25cm, y: 0.25cm),
    flipped: true,
    numbering: "1",
  )
  set text(lang: lang, size: 5.2pt)
  set align(left)

  // Headers
  show heading.where(level: 1): it => block(sticky: true, width: 100%)[
    #set align(center)
    #set text(size: 8.5pt, weight: "bold", fill: rgb("#002b5c"))
    #smallcaps(it.body)
    #v(-0.2cm)
    #line(length: 100%, stroke: 1pt + rgb("#002b5c"))
    #v(0.05cm)
  ]

  show heading.where(level: 2): it => block(sticky: true, width: 100%)[
    #set text(size: 7.2pt, weight: "bold", fill: rgb("#004a99"))
    #it.body
    #v(-0.1cm)
    #line(length: 100%, stroke: 0.5pt + gray)
    #v(0.02cm)
  ]

  show heading.where(level: 3): it => block(sticky: true, width: 100%)[
    #set text(size: 6.2pt, weight: "bold", fill: rgb("#1a73e8"))
    #it.body
    #v(0.02cm)
  ]

  body
}
