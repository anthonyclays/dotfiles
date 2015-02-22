curl -s $1 | tr ' ' '\n' |
    grep '^href="https://media.*"$' |
    sed 's/href="\(.*\)"/\1/' |
    xargs wget
