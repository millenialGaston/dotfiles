afaPapers () {
  open=xdg-open
  ag -U -g ".pdf$" \
    | fast-p \
    | fzf --read0 --reverse -e -d $'\t'  \
    --preview-window down:80% --preview '
      v=$(echo {q} | tr " " "|");
      echo -e {1}"\n"{2} | grep -E "^|$v" -i --color=always;
      ' \
        | cut -z -f 1 -d $'\t' | tr -d '\n' | xargs -r --null $open > /dev/null 2> /dev/null
      }

    afaPapers
