// !main: main.typ
// Template for dense Typst cheat sheets
#let example_counter = counter("example")

#let infobox(title, body, accent: rgb("#4caf50")) = {
  context block(
    breakable: false,
    width: 100%,
    fill: rgb("#f8f9fa"),
    stroke: (left: 1.5pt + accent),
    inset: (x: 3pt, y: 2pt),
    outset: (x: 0pt, y: 1pt),
    radius: 1pt,
  )[
    #set text(size: 5.0pt, weight: "bold", fill: accent.darken(30%))
    #title \
    #set text(size: 4.5pt, weight: "regular", fill: black)
    #body
  ]
}

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
    numbering: none,
  )
  set heading(numbering: (..nums) => {
    let n = nums.pos()
    if n.len() == 1 {
      numbering("1.", n.at(0))
    } else if n.len() == 2 {
      if n.at(0) == 0 {
        numbering("1.", n.at(1))
      } else {
        numbering("1.1", ..n)
      }
    } else if n.len() == 3 {
      if n.at(0) == 0 {
        numbering("1.1", ..n.slice(1))
      } else {
        numbering("1.1.1", ..n)
      }
    }
  })
  set text(lang: lang, size: 5.2pt)
  set align(left)

  // Headers
  show heading: it => {
    if it.level == 1 {
      block(sticky: true, width: 100%)[
        #set align(center)
        #set text(size: 8.5pt, weight: "bold", fill: rgb("#002b5c"))
        #if it.numbering != none {
          counter(heading).display(it.numbering)
          h(0.5em)
        }
        #smallcaps(it.body)
        #v(-0.2cm)
        #line(length: 100%, stroke: 1pt + rgb("#002b5c"))
        #v(0.05cm)
      ]
    } else if it.level == 2 {
      block(sticky: true, width: 100%)[
        #set text(size: 7.2pt, weight: "bold", fill: rgb("#004a99"))
        #if it.numbering != none {
          counter(heading).display(it.numbering)
          h(0.3em)
        }
        #it.body
        #v(-0.1cm)
        #line(length: 100%, stroke: 0.5pt + gray)
        #v(0.02cm)
      ]
    } else if it.level == 3 {
      block(sticky: true, width: 100%)[
        #set text(size: 6.2pt, weight: "bold", fill: rgb("#1a73e8"))
        #if it.numbering != none {
          counter(heading).display(it.numbering)
          h(0.3em)
        }
        #it.body
        #v(0.02cm)
      ]
    } else {
      it
    }
  }

  body
}
