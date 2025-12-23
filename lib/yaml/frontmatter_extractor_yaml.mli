type extracted = { attrs : Yaml.value option; body : string }
(** Result type of the extracting function. *)

val of_string : ?delimiter_char:char -> string -> extracted Yaml.res
(** [of_string ?delimiter_char string] extract (split) frontmatter section in
    YAML format from [string].

    @param delimiter_char by default has ['-'] value. *)

val of_string_exn : ?delimiter_char:char -> string -> extracted
(** [of_string ?delimiter_char string] extract (split) frontmatter section in
    YAML format from [string].

    @param delimiter_char by default has ['-'] value.

    @raise Invalid_argument [reason] if YAML parsing is failed. *)
