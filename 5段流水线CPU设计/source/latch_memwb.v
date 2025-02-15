module latch_memwb (clrn,clk,enable,
                    in_wreg,
                    in_wn,in_res,
                    out_wreg,
                    out_wn,out_res
                    );

input           enable,clk,clrn;
input           in_wreg;
input   [4:0]   in_wn;
input   [31:0]  in_res;

output           out_wreg;
output   [4:0]   out_wn;
output   [31:0]  out_res;

reg           out_wreg;
reg   [4:0]   out_wn;
reg   [31:0]  out_res;



always @(posedge clk or negedge clrn)         
begin           
    if (clrn == 0)               
    begin
        out_wreg<=0;
        out_wn<=0;
        out_res<=0;               
    end else  begin                 
        if (enable == 1)
        begin                    
        out_wreg <= in_wreg;
        out_wn   <= in_wn;
        out_res <= in_res;
        end
    end        
end

endmodule