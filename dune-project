(lang dune 3.15)

(name frontmatter_extractor)

(generate_opam_files true)

(source
 (github dx3mod/frontmatter_extractor))

(authors "Mikhail Lopatin <dx3mod@bk.ru>")

(maintainers "Mikhail Lopatin <dx3mod@bk.ru>")

(license MIT)

(package
 (name frontmatter_extractor)
 (synopsis "Just frontmatter extractor")
 (depends ocaml)
 (depopts yaml))
