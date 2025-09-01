#let note-color = rgb("#FFFF99")
#let note(
  title: content,    // Exercise title
  content: content,  // Body content
  fill: note-color,
  inset: 16pt,         // Padding
  // inset: length = 16pt,         // Padding
  radius: 2pt         // Corner radius
  // radius: length = 2pt         // Corner radius
) = {
  box(
    fill: fill,
    inset: inset,
    radius: radius,
    stroke: 1pt + black,
    width: 100%,
    block[
      #align(center)[
      #text(size: 14pt, weight: "bold")[#title]
    ]
      #v(8pt)
      #content
    ]
  )
}


