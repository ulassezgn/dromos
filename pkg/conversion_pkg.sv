package conversion_pkg;
    localparam ADDR_WIDTH = 32;
    
    function automatic logic [ADDR_WIDTH:0] bin2gray (input logic [ADDR_WIDTH:0] bin);
        bin2gray = bin ^ (bin >> 1);
    endfunction

    function automatic logic [ADDR_WIDTH:0] gray2bin (input logic [ADDR_WIDTH:0] gray);
        logic [ADDR_WIDTH:0] tmp;
        integer i;

        begin
            tmp[ADDR_WIDTH] = gray[ADDR_WIDTH];
            for (i = ADDR_WIDTH-1; i >= 0; i--)
                tmp[i] = tmp[i+1] ^ gray[i];
            gray2bin = tmp;
        end
    endfunction
endpackage