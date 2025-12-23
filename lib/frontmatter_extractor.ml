type res = { matter : string option; body : string }

let of_string ?(delimiter_char = '-') str =
  let start_matter_index = ref 0
  and end_matter_index = ref 0
  and started = ref false
  and new_line = ref true
  and count_delimiter_char = ref 0 in

  let min_delimiter_chars = 3 in

  begin
    let exception Break in
    try
      for i = 0 to String.length str - 1 do
        if !new_line && str.[i] = delimiter_char then incr count_delimiter_char
        else if str.[i] = '\n' then begin
          new_line := true;

          if (not !started) && !count_delimiter_char >= min_delimiter_chars then begin
            started := true;
            start_matter_index := i
          end
          else if !count_delimiter_char >= min_delimiter_chars then begin
            end_matter_index := i;
            raise_notrace Break
          end;

          count_delimiter_char := 0
        end
        else if str.[i] <> delimiter_char then new_line := false
      done
    with Break -> ()
  end;

  if !end_matter_index <> 0 then
    let matter =
      String.sub str !start_matter_index
        (!end_matter_index - !start_matter_index - !count_delimiter_char)
    in
    let body =
      String.sub str !end_matter_index (String.length str - !end_matter_index)
    in

    { matter = Some matter; body }
  else { matter = None; body = str }
