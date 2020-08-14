module First_CNN_0(
clk,
rst_n,
Din_Valid,
Cal_Valid,
Din,
Dout
);

input clk;
input rst_n;
input Din_Valid;
input Cal_Valid;
input Din; // 1-bit 输入图像；
output reg signed [7:0] Dout; // 卷积结果；

reg [70:0] line_buffer; // 34*34 特征图的行缓冲区；
reg [8:0] window_buffer; // 3*3 窗口的窗缓冲区；        

    // Data Buffer
    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n)
            begin
                line_buffer   <= 71'd0;
                window_buffer <= 4'b0000;
            end
        else begin
            if(Din_Valid) begin
                line_buffer      <= {line_buffer[69:0],Din};
                window_buffer[8] <= line_buffer[70];
                window_buffer[7] <= line_buffer[69];
                window_buffer[6] <= line_buffer[68];
                window_buffer[5] <= line_buffer[36];
                window_buffer[4] <= line_buffer[35];
                window_buffer[3] <= line_buffer[34];
                window_buffer[2] <= line_buffer[2];
                window_buffer[1] <= line_buffer[1];
                window_buffer[0] <= line_buffer[0];
            end
            else begin
            line_buffer   <= line_buffer;
            window_buffer <= window_buffer;
            end  
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            Dout <= 8'b00000000;
        else begin
            if(Cal_Valid) begin
            case(window_buffer)
                9'b000000000:Dout<=8'd3;
                9'b101001011:Dout<=8'd3;
                9'b000001000:Dout<=8'd11;
                9'b001000001:Dout<=8'd11;
                9'b000010000:Dout<=8'd30;
                9'b001001100:Dout<=8'd30;
                9'b001100000:Dout<=8'd30;
                9'b011000010:Dout<=8'd30;
                9'b101011011:Dout<=8'd30;
                9'b000011000:Dout<=8'd38;
                9'b001010001:Dout<=8'd38;
                9'b001101000:Dout<=8'd38;
                9'b011001010:Dout<=8'd38;
                9'b101000010:Dout<=8'd38;
                9'b000011100:Dout<=8'd6;
                9'b000110000:Dout<=8'd6;
                9'b001010101:Dout<=8'd6;
                9'b001101100:Dout<=8'd6;
                9'b010010010:Dout<=8'd6;
                9'b011001110:Dout<=8'd6;
                9'b011100010:Dout<=8'd6;
                9'b101000110:Dout<=8'd6;
                9'b101111011:Dout<=8'd6;
                9'b000111000:Dout<=8'd14;
                9'b001011101:Dout<=8'd14;
                9'b001110001:Dout<=8'd14;
                9'b010011010:Dout<=8'd14;
                9'b011010011:Dout<=8'd14;
                9'b011101010:Dout<=8'd14;
                9'b100010010:Dout<=8'd14;
                9'b101001110:Dout<=8'd14;
                9'b101100010:Dout<=8'd14;
                9'b001000000:Dout<=8'd54;
                9'b001000010:Dout<=8'd4;
                9'b110101001:Dout<=8'd4;
                9'b001000100:Dout<=8'd22;
                9'b001111001:Dout<=8'd22;
                9'b011011011:Dout<=8'd22;
                9'b100011010:Dout<=8'd22;
                9'b101010011:Dout<=8'd22;
                9'b101101010:Dout<=8'd22;
                9'b001001000:Dout<=8'd62;
                9'b001001001:Dout<=8'd19;
                9'b001001010:Dout<=8'd12;
                9'b001010000:Dout<=8'd81;
                9'b001010010:Dout<=8'd31;
                9'b110000100:Dout<=8'd31;
                9'b110111001:Dout<=8'd31;
                9'b001010100:Dout<=8'd49;
                9'b101111010:Dout<=8'd49;
                9'b001011000:Dout<=8'd89;
                9'b001011001:Dout<=8'd46;
                9'b101001010:Dout<=8'd46;
                9'b001011010:Dout<=8'd39;
                9'b110001100:Dout<=8'd39;
                9'b110100000:Dout<=8'd39;
                9'b111000101:Dout<=8'd39;
                9'b001011100:Dout<=8'd56;
                9'b001110000:Dout<=8'd56;
                9'b011010010:Dout<=8'd56;
                9'b001011110:Dout<=8'd7;
                9'b001110010:Dout<=8'd7;
                9'b110100100:Dout<=8'd7;
                9'b001110100:Dout<=8'd25;
                9'b011010110:Dout<=8'd25;
                9'b001111000:Dout<=8'd65;
                9'b011011010:Dout<=8'd65;
                9'b101010010:Dout<=8'd65;
                9'b001111010:Dout<=8'd15;
                9'b110010101:Dout<=8'd15;
                9'b110101100:Dout<=8'd15;
                9'b111100101:Dout<=8'd15;
                9'b001111100:Dout<=8'd33;
                9'b011011110:Dout<=8'd33;
                9'b011110010:Dout<=8'd33;
                9'b101010110:Dout<=8'd33;
                9'b010000000:Dout<=8'd28;
                9'b100011001:Dout<=8'd28;
                9'b101101001:Dout<=8'd28;
                9'b111001011:Dout<=8'd28;
                9'b010001000:Dout<=8'd37;
                9'b011000001:Dout<=8'd37;
                9'b100000000:Dout<=8'd37;
                9'b010001100:Dout<=8'd5;
                9'b010100000:Dout<=8'd5;
                9'b011000101:Dout<=8'd5;
                9'b100000100:Dout<=8'd5;
                9'b100111001:Dout<=8'd5;
                9'b110011011:Dout<=8'd5;
                9'b111101011:Dout<=8'd5;
                9'b010010000:Dout<=8'd56;
                9'b011001100:Dout<=8'd56;
                9'b011100000:Dout<=8'd56;
                9'b101000100:Dout<=8'd56;
                9'b101111001:Dout<=8'd56;
                9'b111011011:Dout<=8'd56;
                9'b010010001:Dout<=8'd13;
                9'b010101000:Dout<=8'd13;
                9'b011001101:Dout<=8'd13;
                9'b011100001:Dout<=8'd13;
                9'b100001100:Dout<=8'd13;
                9'b100100000:Dout<=8'd13;
                9'b101000101:Dout<=8'd13;
                9'b110000010:Dout<=8'd13;
                9'b010010100:Dout<=8'd24;
                9'b011100100:Dout<=8'd24;
                9'b101111101:Dout<=8'd24;
                9'b110111010:Dout<=8'd24;
                9'b111011111:Dout<=8'd24;
                9'b111110011:Dout<=8'd24;
                9'b010011000:Dout<=8'd64;
                9'b011010001:Dout<=8'd64;
                9'b011101000:Dout<=8'd64;
                9'b100010000:Dout<=8'd64;
                9'b101001100:Dout<=8'd64;
                9'b101100000:Dout<=8'd64;
                9'b111000010:Dout<=8'd64;
                9'b010011001:Dout<=8'd21;
                9'b011101001:Dout<=8'd21;
                9'b100010001:Dout<=8'd21;
                9'b100101000:Dout<=8'd21;
                9'b101001101:Dout<=8'd21;
                9'b101100001:Dout<=8'd21;
                9'b110001010:Dout<=8'd21;
                9'b111000011:Dout<=8'd21;
                9'b010011100:Dout<=8'd32;
                9'b010110000:Dout<=8'd32;
                9'b011010101:Dout<=8'd32;
                9'b011101100:Dout<=8'd32;
                9'b100010100:Dout<=8'd32;
                9'b101100100:Dout<=8'd32;
                9'b111000110:Dout<=8'd32;
                9'b111111011:Dout<=8'd32;
                9'b010111000:Dout<=8'd40;
                9'b011011101:Dout<=8'd40;
                9'b011110001:Dout<=8'd40;
                9'b100011100:Dout<=8'd40;
                9'b100110000:Dout<=8'd40;
                9'b101010101:Dout<=8'd40;
                9'b101101100:Dout<=8'd40;
                9'b110010010:Dout<=8'd40;
                9'b111001110:Dout<=8'd40;
                9'b111100010:Dout<=8'd40;
                9'b010111100:Dout<=8'd8;
                9'b011110101:Dout<=8'd8;
                9'b100110100:Dout<=8'd8;
                9'b110010110:Dout<=8'd8;
                9'b111100110:Dout<=8'd8;
                9'b011000000:Dout<=8'd80;
                9'b101011001:Dout<=8'd80;
                9'b011000100:Dout<=8'd48;
                9'b011111001:Dout<=8'd48;
                9'b100111000:Dout<=8'd48;
                9'b101011101:Dout<=8'd48;
                9'b101110001:Dout<=8'd48;
                9'b110011010:Dout<=8'd48;
                9'b111010011:Dout<=8'd48;
                9'b111101010:Dout<=8'd48;
                9'b011001000:Dout<=8'd88;
                9'b101000000:Dout<=8'd88;
                9'b011001001:Dout<=8'd45;
                9'b100001000:Dout<=8'd45;
                9'b101000001:Dout<=8'd45;
                9'b011010000:Dout<=8'd107;
                9'b011010100:Dout<=8'd75;
                9'b111111010:Dout<=8'd75;
                9'b011011000:Dout<=8'd114;
                9'b101010000:Dout<=8'd114;
                9'b011011001:Dout<=8'd72;
                9'b100011000:Dout<=8'd72;
                9'b101010001:Dout<=8'd72;
                9'b101101000:Dout<=8'd72;
                9'b111001010:Dout<=8'd72;
                9'b011011100:Dout<=8'd83;
                9'b011110000:Dout<=8'd83;
                9'b101010100:Dout<=8'd83;
                9'b011110100:Dout<=8'd51;
                9'b011110110:Dout<=8'd1;
                9'b011111000:Dout<=8'd91;
                9'b101011100:Dout<=8'd91;
                9'b101110000:Dout<=8'd91;
                9'b111010010:Dout<=8'd91;
                9'b011111010:Dout<=8'd41;
                9'b101011110:Dout<=8'd41;
                9'b101110010:Dout<=8'd41;
                9'b011111100:Dout<=8'd59;
                9'b101110100:Dout<=8'd59;
                9'b111010110:Dout<=8'd59;
                9'b011111101:Dout<=8'd16;
                9'b100111100:Dout<=8'd16;
                9'b101110101:Dout<=8'd16;
                9'b110011110:Dout<=8'd16;
                9'b110110010:Dout<=8'd16;
                9'b111010111:Dout<=8'd16;
                9'b111101110:Dout<=8'd16;
                9'b011111110:Dout<=8'd9;
                9'b101110110:Dout<=8'd9;
                9'b100001001:Dout<=8'd2;
                9'b101001000:Dout<=8'd96;
                9'b101001001:Dout<=8'd53;
                9'b101011000:Dout<=8'd123;
                9'b101011010:Dout<=8'd73;
                9'b101111000:Dout<=8'd99;
                9'b111011010:Dout<=8'd99;
                9'b101111100:Dout<=8'd67;
                9'b111011110:Dout<=8'd67;
                9'b111110010:Dout<=8'd67;
                9'b101111110:Dout<=8'd17;
                9'b110000000:Dout<=8'd63;
                9'b110000001:Dout<=8'd20;
                9'b110001000:Dout<=8'd71;
                9'b111000001:Dout<=8'd71;
                9'b110001001:Dout<=8'd28;
                9'b110010000:Dout<=8'd90;
                9'b111001100:Dout<=8'd90;
                9'b111100000:Dout<=8'd90;
                9'b110010001:Dout<=8'd47;
                9'b110101000:Dout<=8'd47;
                9'b111001101:Dout<=8'd47;
                9'b111100001:Dout<=8'd47;
                9'b110010100:Dout<=8'd57;
                9'b111100100:Dout<=8'd57;
                9'b110011000:Dout<=8'd98;
                9'b111010001:Dout<=8'd98;
                9'b111101000:Dout<=8'd98;
                9'b110011001:Dout<=8'd55;
                9'b111101001:Dout<=8'd55;
                9'b110011100:Dout<=8'd66;
                9'b110110000:Dout<=8'd66;
                9'b111010101:Dout<=8'd66;
                9'b111101100:Dout<=8'd66;
                9'b110011101:Dout<=8'd23;
                9'b110110001:Dout<=8'd23;
                9'b111101101:Dout<=8'd23;
                9'b110110100:Dout<=8'd34;
                9'b110111000:Dout<=8'd74;
                9'b111011101:Dout<=8'd74;
                9'b111110001:Dout<=8'd74;
                9'b110111100:Dout<=8'd42;
                9'b111110101:Dout<=8'd42;
                9'b111000000:Dout<=8'd113;
                9'b111000100:Dout<=8'd82;
                9'b111111001:Dout<=8'd82;
                9'b111001000:Dout<=8'd122;
                9'b111001001:Dout<=8'd79;
                9'b111010000:Dout<=8'd141;
                9'b111010100:Dout<=8'd109;
                9'b111011000:Dout<=8'd149;
                9'b111011001:Dout<=8'd106;
                9'b111011100:Dout<=8'd117;
                9'b111110000:Dout<=8'd117;
                9'b111110100:Dout<=8'd85;
                9'b111110110:Dout<=8'd35;
                9'b111111000:Dout<=8'd125;
                9'b111111100:Dout<=8'd93;
                9'b111111101:Dout<=8'd50;
                9'b111111110:Dout<=8'd43;
                default:     Dout<=8'd0;
            endcase
            end
            else
                Dout<=8'd0;
        end
    end
endmodule