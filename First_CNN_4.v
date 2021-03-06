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
                9'b000000001:Dout<=8'd41;
                9'b000111010:Dout<=8'd41;
                9'b001100101:Dout<=8'd41;
                9'b100001011:Dout<=8'd41;
                9'b101101111:Dout<=8'd41;
                9'b000000010:Dout<=8'd32;
                9'b001100110:Dout<=8'd32;
                9'b010110101:Dout<=8'd32;
                9'b110111111:Dout<=8'd32;
                9'b000000011:Dout<=8'd73;
                9'b001100111:Dout<=8'd73;
                9'b000000100:Dout<=8'd36;
                9'b000100001:Dout<=8'd36;
                9'b011001111:Dout<=8'd36;
                9'b100001110:Dout<=8'd36;
                9'b100101011:Dout<=8'd36;
                9'b000000101:Dout<=8'd77;
                9'b000111110:Dout<=8'd77;
                9'b100001111:Dout<=8'd77;
                9'b000000110:Dout<=8'd68;
                9'b000100011:Dout<=8'd68;
                9'b000000111:Dout<=8'd109;
                9'b000001000:Dout<=8'd6;
                9'b001101100:Dout<=8'd6;
                9'b011010101:Dout<=8'd6;
                9'b100010100:Dout<=8'd6;
                9'b100110001:Dout<=8'd6;
                9'b111011111:Dout<=8'd6;
                9'b000001001:Dout<=8'd47;
                9'b001101101:Dout<=8'd47;
                9'b100010101:Dout<=8'd47;
                9'b000001010:Dout<=8'd38;
                9'b001101110:Dout<=8'd38;
                9'b010111101:Dout<=8'd38;
                9'b011010111:Dout<=8'd38;
                9'b100010110:Dout<=8'd38;
                9'b100110011:Dout<=8'd38;
                9'b000001011:Dout<=8'd79;
                9'b001101111:Dout<=8'd79;
                9'b100010111:Dout<=8'd79;
                9'b000001100:Dout<=8'd42;
                9'b000101001:Dout<=8'd42;
                9'b001000011:Dout<=8'd42;
                9'b100110101:Dout<=8'd42;
                9'b000001101:Dout<=8'd83;
                9'b000001110:Dout<=8'd74;
                9'b000101011:Dout<=8'd74;
                9'b100110111:Dout<=8'd74;
                9'b000001111:Dout<=8'd114;
                9'b000010000:Dout<=8'd8;
                9'b001110100:Dout<=8'd8;
                9'b011011011:Dout<=8'd8;
                9'b100011010:Dout<=8'd8;
                9'b101000101:Dout<=8'd8;
                9'b101111110:Dout<=8'd8;
                9'b000010001:Dout<=8'd49;
                9'b001110101:Dout<=8'd49;
                9'b100011011:Dout<=8'd49;
                9'b101111111:Dout<=8'd49;
                9'b000010010:Dout<=8'd40;
                9'b001110110:Dout<=8'd40;
                9'b100101101:Dout<=8'd40;
                9'b101000111:Dout<=8'd40;
                9'b000010011:Dout<=8'd81;
                9'b001110111:Dout<=8'd81;
                9'b000010100:Dout<=8'd44;
                9'b000110001:Dout<=8'd44;
                9'b011011111:Dout<=8'd44;
                9'b100011110:Dout<=8'd44;
                9'b100111011:Dout<=8'd44;
                9'b000010101:Dout<=8'd85;
                9'b100011111:Dout<=8'd85;
                9'b000010110:Dout<=8'd76;
                9'b000110011:Dout<=8'd76;
                9'b000010111:Dout<=8'd117;
                9'b000011000:Dout<=8'd14;
                9'b001111100:Dout<=8'd14;
                9'b101001101:Dout<=8'd14;
                9'b000011001:Dout<=8'd55;
                9'b001111101:Dout<=8'd55;
                9'b000011010:Dout<=8'd46;
                9'b001000101:Dout<=8'd46;
                9'b001111110:Dout<=8'd46;
                9'b101001111:Dout<=8'd46;
                9'b000011011:Dout<=8'd87;
                9'b001111111:Dout<=8'd87;
                9'b000011100:Dout<=8'd50;
                9'b000111001:Dout<=8'd50;
                9'b001010011:Dout<=8'd50;
                9'b000011101:Dout<=8'd91;
                9'b000011110:Dout<=8'd82;
                9'b000111011:Dout<=8'd82;
                9'b000011111:Dout<=8'd123;
                9'b000100010:Dout<=8'd27;
                9'b000100100:Dout<=8'd31;
                9'b010001011:Dout<=8'd31;
                9'b011101111:Dout<=8'd31;
                9'b100101110:Dout<=8'd31;
                9'b110010111:Dout<=8'd31;
                9'b000100101:Dout<=8'd72;
                9'b100101111:Dout<=8'd72;
                9'b000100110:Dout<=8'd63;
                9'b000100111:Dout<=8'd104;
                9'b000101000:Dout<=8'd1;
                9'b001000010:Dout<=8'd1;
                9'b010010001:Dout<=8'd1;
                9'b011110101:Dout<=8'd1;
                9'b100110100:Dout<=8'd1;
                9'b110011011:Dout<=8'd1;
                9'b111111111:Dout<=8'd1;
                9'b000101010:Dout<=8'd33;
                9'b010010011:Dout<=8'd33;
                9'b011110111:Dout<=8'd33;
                9'b100110110:Dout<=8'd33;
                9'b000101100:Dout<=8'd37;
                9'b001000110:Dout<=8'd37;
                9'b001100011:Dout<=8'd37;
                9'b010010101:Dout<=8'd37;
                9'b110011111:Dout<=8'd37;
                9'b000101101:Dout<=8'd78;
                9'b001000111:Dout<=8'd78;
                9'b000101110:Dout<=8'd69;
                9'b010010111:Dout<=8'd69;
                9'b000101111:Dout<=8'd110;
                9'b000110000:Dout<=8'd3;
                9'b011011110:Dout<=8'd3;
                9'b011111011:Dout<=8'd3;
                9'b100000001:Dout<=8'd3;
                9'b100111010:Dout<=8'd3;
                9'b101100101:Dout<=8'd3;
                9'b000110010:Dout<=8'd35;
                9'b010001101:Dout<=8'd35;
                9'b100000011:Dout<=8'd35;
                9'b101100111:Dout<=8'd35;
                9'b000110100:Dout<=8'd39;
                9'b010011011:Dout<=8'd39;
                9'b011111111:Dout<=8'd39;
                9'b100000101:Dout<=8'd39;
                9'b100111110:Dout<=8'd39;
                9'b000110101:Dout<=8'd80;
                9'b100111111:Dout<=8'd80;
                9'b000110110:Dout<=8'd71;
                9'b100000111:Dout<=8'd71;
                9'b000110111:Dout<=8'd112;
                9'b000111000:Dout<=8'd9;
                9'b001010010:Dout<=8'd9;
                9'b100001001:Dout<=8'd9;
                9'b101101101:Dout<=8'd9;
                9'b000111100:Dout<=8'd45;
                9'b001010110:Dout<=8'd45;
                9'b001110011:Dout<=8'd45;
                9'b100001101:Dout<=8'd45;
                9'b000111101:Dout<=8'd86;
                9'b001010111:Dout<=8'd86;
                9'b000111111:Dout<=8'd118;
                9'b001000001:Dout<=8'd10;
                9'b001111010:Dout<=8'd10;
                9'b101001011:Dout<=8'd10;
                9'b001000100:Dout<=8'd5;
                9'b001100001:Dout<=8'd5;
                9'b101001110:Dout<=8'd5;
                9'b101101011:Dout<=8'd5;
                9'b110011101:Dout<=8'd5;
                9'b001001001:Dout<=8'd16;
                9'b101010101:Dout<=8'd16;
                9'b001001010:Dout<=8'd7;
                9'b010011001:Dout<=8'd7;
                9'b011111101:Dout<=8'd7;
                9'b100111100:Dout<=8'd7;
                9'b101010110:Dout<=8'd7;
                9'b101110011:Dout<=8'd7;
                9'b001001011:Dout<=8'd48;
                9'b100111101:Dout<=8'd48;
                9'b101010111:Dout<=8'd48;
                9'b001001100:Dout<=8'd11;
                9'b001101001:Dout<=8'd11;
                9'b100010001:Dout<=8'd11;
                9'b101110101:Dout<=8'd11;
                9'b001001101:Dout<=8'd52;
                9'b001001110:Dout<=8'd43;
                9'b001101011:Dout<=8'd43;
                9'b010011101:Dout<=8'd43;
                9'b100010011:Dout<=8'd43;
                9'b101110111:Dout<=8'd43;
                9'b001001111:Dout<=8'd84;
                9'b001010001:Dout<=8'd18;
                9'b101011011:Dout<=8'd18;
                9'b110100111:Dout<=8'd18;
                9'b001010100:Dout<=8'd13;
                9'b001110001:Dout<=8'd13;
                9'b101011110:Dout<=8'd13;
                9'b101111011:Dout<=8'd13;
                9'b001010101:Dout<=8'd54;
                9'b101011111:Dout<=8'd54;
                9'b001011001:Dout<=8'd24;
                9'b010100101:Dout<=8'd24;
                9'b110101111:Dout<=8'd24;
                9'b001011010:Dout<=8'd15;
                9'b010100110:Dout<=8'd15;
                9'b001011011:Dout<=8'd56;
                9'b010100111:Dout<=8'd56;
                9'b001011100:Dout<=8'd19;
                9'b001111001:Dout<=8'd19;
                9'b001011101:Dout<=8'd60;
                9'b001011110:Dout<=8'd51;
                9'b001111011:Dout<=8'd51;
                9'b001011111:Dout<=8'd92;
                9'b001101010:Dout<=8'd2;
                9'b010011100:Dout<=8'd2;
                9'b010111001:Dout<=8'd2;
                9'b011010011:Dout<=8'd2;
                9'b100010010:Dout<=8'd2;
                9'b101110110:Dout<=8'd2;
                9'b001110010:Dout<=8'd4;
                9'b011001101:Dout<=8'd4;
                9'b100001100:Dout<=8'd4;
                9'b100101001:Dout<=8'd4;
                9'b101000011:Dout<=8'd4;
                9'b010000011:Dout<=8'd25;
                9'b011100111:Dout<=8'd25;
                9'b100100110:Dout<=8'd25;
                9'b010000101:Dout<=8'd28;
                9'b010111110:Dout<=8'd28;
                9'b110001111:Dout<=8'd28;
                9'b010000110:Dout<=8'd20;
                9'b010100011:Dout<=8'd20;
                9'b010000111:Dout<=8'd61;
                9'b010001110:Dout<=8'd26;
                9'b010101011:Dout<=8'd26;
                9'b110110111:Dout<=8'd26;
                9'b010001111:Dout<=8'd67;
                9'b010010110:Dout<=8'd28;
                9'b010110011:Dout<=8'd28;
                9'b010011110:Dout<=8'd34;
                9'b010111011:Dout<=8'd34;
                9'b100100101:Dout<=8'd34;
                9'b010011111:Dout<=8'd75;
                9'b010101101:Dout<=8'd30;
                9'b011000111:Dout<=8'd30;
                9'b100000110:Dout<=8'd30;
                9'b100100011:Dout<=8'd30;
                9'b010101110:Dout<=8'd21;
                9'b010101111:Dout<=8'd62;
                9'b010110110:Dout<=8'd23;
                9'b110000111:Dout<=8'd23;
                9'b010110111:Dout<=8'd64;
                9'b010111111:Dout<=8'd70;
                9'b011011101:Dout<=8'd12;
                9'b100011100:Dout<=8'd12;
                9'b100111001:Dout<=8'd12;
                9'b101010011:Dout<=8'd12;
                9'b100011001:Dout<=8'd17;
                9'b101111101:Dout<=8'd17;
                9'b100011101:Dout<=8'd53;
                9'b100100111:Dout<=8'd66;
                9'b101011101:Dout<=8'd22; 
                default:     Dout<=8'd0;
            endcase
            end
            else
                Dout<=8'd0;
        end
    end
endmodule