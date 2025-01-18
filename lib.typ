#let resume(author: "", contacts: (), body) = {
  set document(author: author, title: author)
  set page(margin: (
    top: 1em,
    left: 3em,
    right: 3em,
    bottom: 1em,
  ))
  set text(font: "Linux Libertine", lang: "en")

  show link: underline

  show heading: heading => [
    #pad(bottom: -16pt, [#smallcaps(heading.body)])
    #line(length: 100%, stroke: 1pt)
  ]

  // Author
  align(center)[
    #block(text(weight: 700, 1.5em, author))
  ]

  // Contact information.
  pad(
    bottom: 100%,
    align(center)[
      #grid(
        columns: 4,
        gutter: 1em,
        ..contacts
      )
    ],
  )

  // Main body.
  set par(justify: true)

  body
}

#let icon(name, baseline: 1.5pt, height: 10pt) = {
  box(
    baseline: baseline,
    height: height,
    image(name),
  )
}

#let experience(organization, location, experiences) = {
  pad(
    bottom: 5pt,
    [
      #grid(
        columns: (auto, 1fr),
        rows: 0pt,
        align(left)[*#organization*], align(right)[#location],
      )
      #for (title, time, details) in experiences {
        grid(
          rows: 1pt,
          columns: (auto, 1fr),
          align(left)[#title], align(right)[#time],
        )
        if details != none {
          pad(bottom: -2.5pt, details)
        }
      }
    ],
  )
}

#let project(name, details) = {
  pad(
    bottom: 100%,
    grid(
      columns: (auto, 1fr),
      align(left)[
        *#name*
      ],
    ),
  )
  details
}

#let volunteering(organization, role, time, details) = {
  grid(
    columns: (auto, 1fr),
    align(left)[
      *#organization* \
      #role
    ],
    align(right)[
      #time
    ],
  )
  details
};

#let language(name, level) = {
  pad(
    bottom: 100%,
    grid(
      columns: (auto, 1fr),
      align(left)[
        *#name*
      ],
      align(right)[
        #level
      ],
    ),
  )
}
