module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q );
    

    reg [15:0] grid[15:0];       
    reg [15:0] next_grid[15:0];  

    integer i, j, dx, dy;
    integer ni, nj;
    integer count;

    always @(*) begin
        
        for (i = 0; i < 16; i = i + 1)
            grid[i] = q[16*i +: 16];

        
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                count = 0;
               
                for (dx = -1; dx <= 1; dx++) begin
                    for (dy = -1; dy <= 1; dy++) begin
                        if (!(dx == 0 && dy == 0)) begin
                            ni = (i + dx + 16) % 16;
                            nj = (j + dy + 16) % 16;
                            count = count + grid[ni][nj];
                        end
                    end
                end

             
                case (count)
                    2: next_grid[i][j] = grid[i][j];  
                    3: next_grid[i][j] = 1'b1;      
                    default: next_grid[i][j] = 1'b0; 
                endcase
            end
        end
    end

    always @(posedge clk) begin
        if (load)
            q <= data;   
        else begin
            for (i = 0; i < 16; i = i + 1)
                q[16*i +: 16] <= next_grid[i];
        end
    end


endmodule
