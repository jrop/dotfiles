function bw_unlock
    set key (bw unlock --raw)
    export BW_SESSION=$key
end

