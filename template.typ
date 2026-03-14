// Template for dense Typst cheat sheets

#let example_counter = counter("example")

#let example(title, question, steps, result) = {
  example_counter.step()
  block(breakable: true, width: 100%, inset: (y: 2pt))[
    *Example #example_counter.display(): #title* \
    #set text(size: 4.5pt)
    *Question:* #question \
    *Steps:*
    #steps
    *Result:* #result
  ]
}

#let cheatsheet(
  title: "Cheat Sheet",
  author: none,
  lang: "sv",
  columns: 4,
  body,
) = {
  if author != none {
    set document(title: title, author: author)
  } else {
    set document(title: title)
  }
  set page(
    columns: columns,
    margin: (x: 0.2cm, y: 0.2cm),
    flipped: true,
    numbering: "1",
  )
  set text(lang: lang, size: 5pt)
  set align(center)

  // Headers
  show heading.where(level: 1): it => [
    #set align(center)
    #set text(size: 8pt, weight: "bold")
    #it.body
    #v(0.1cm)
  ]

  show heading.where(level: 2): it => [
    #set align(left)
    #set text(size: 7pt, weight: "bold")
    #it.body
    #v(0.1cm)
  ]

  show heading.where(level: 3): it => [
    #set align(left)
    #set text(size: 6pt, weight: "bold")
    #it.body
    #v(0.1cm)
  ]

  show heading.where(level: 4): it => [
    #set align(left)
    #set text(size: 5pt, weight: "bold", fill: gray.darken(20%))
    #it.body
    #v(0.1cm)
  ]

  body
}
