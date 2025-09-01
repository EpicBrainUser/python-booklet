#let tip-color = rgb("#C6F4D6")
#let tip(
  title: content,    // Exercise title
  content: content,  // Body content
  fill: tip-color,
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


