package arithm_pkg;

    function automatic int unsigned log2ceil(input int unsigned value);
    int unsigned i;
    begin
        if (value <= 1) return 0;
        value = value - 1;
        for (i = 0; value > 0; i++)
            value = value >> 1;
        return i;
    end
    endfunction

endpackage
