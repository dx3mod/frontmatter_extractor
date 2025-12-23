type extracted = { matter : string option; body : string }
(** Result type of the extracting function. *)

val of_string : ?delimiter_char:char -> string -> extracted
(** [of_string ?delimiter_char string] extract (split) frontmatter section from
    [string].

    @param delimiter_char by default has ['-'] value. *)
