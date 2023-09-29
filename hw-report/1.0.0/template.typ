#let project(lang: "en", font: "Noto Serif TC", size: 12pt, title: "", authors: (), body) = {
  set document(author: authors.map(author => author.name), title: title)
  set text(font: font, size: size, lang: lang)

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

  body
}
