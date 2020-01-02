function brew_versions
    echo brew info --json "$argv[1]" \| jq -r \'.[].versioned_formulae[]\'
    brew info --json "$argv[1]" | jq -r '.[].versioned_formulae[]'
end

