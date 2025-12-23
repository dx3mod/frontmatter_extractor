# frontmatter_extractor

The small utility library for extracting frontmatter section from text in OCaml.

### Usage

```ocaml
# #require "frontmatter_extractor";;
```

```ocaml
let some_text = {|
---
title: "My First Blog Post"
data: 2025-12-1
---

Hello! It's just some text...
|};;
```
Extract frontmatter as plain text.
```ocaml
# Frontmatter_extractor.of_string some_text;;

- : Frontmatter_extractor.extracted =
{Frontmatter_extractor.matter =
  Some "\ntitle: \"My First Blog Post\"\ndata: 2025-12-1\n";
 body = "\n\nHello! It's just some text...\n"}
```
Extract the front matter as parsed YAML values. The `yaml` library needs to be installed.

```ocaml
# Frontmatter_extractor_yaml.of_string_exn some_text;;

- : Frontmatter_extractor_yaml.extracted =
{Frontmatter_extractor_yaml.attrs =
  Some
   (`O [("title", `String "My First Blog Post"); ("data", `String "2025-12-1")]);
 body = "\n\nHello! It's just some text...\n"}
```