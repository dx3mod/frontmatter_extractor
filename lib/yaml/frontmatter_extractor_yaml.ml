type extracted = { attrs : Yaml.value option; body : string }

let of_string ?delimiter_char str =
  match Frontmatter_extractor.of_string ?delimiter_char str with
  | Frontmatter_extractor.{ matter = Some matter; body } ->
      Yaml.of_string matter
      |> Result.map (fun attrs -> { attrs = Some attrs; body })
  | Frontmatter_extractor.{ body; _ } -> Ok { attrs = None; body }

let of_string_exn ?delimiter_char str =
  match of_string ?delimiter_char str with
  | Error (`Msg reason) -> raise (Invalid_argument reason)
  | Ok value -> value
