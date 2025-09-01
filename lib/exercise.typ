#let exercise-color = rgb("#EAF2F5")
#let exercise(
  title: content,    // Exercise title
  content: content,  // Body content
  fill: exercise-color,
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
      #text(size: 16pt, weight: "bold")[#title]
      #v(8pt)
      #content
    ]
  )
}


