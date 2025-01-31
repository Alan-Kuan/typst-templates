#let project(
  lang: "en",
  font: "Noto Serif TC",
  size: 12pt,
  title: "",
  authors: (),
  numbering: none,
  body
) = {
  set document(author: authors.map(author => author.name), title: title)
  set text(font: font, size: size, lang: lang)
  set page(numbering: numbering)

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author =>
        align(
          center,
          stack(
            spacing: 0.5em,
            strong(author.name),
            author.id,
          ),
        ),
      ),
    ),
  )

  // Main body.
  set par(justify: true)
  set enum(numbering: "1.a.")

  show raw.where(block: false): it => box(
    fill: luma(240),
    outset: (y: 3pt),
    inset: (x: 2pt),
    radius: 3pt,
    it
  )

  body
}
