module rom(data, addr, read, ena);
input read, ena;
input [7:0] addr;
output [7:0] data;
reg [7:0] memory[255:0];

initial begin
memory[0] = 8'b000_00000; //NOP
memory[1] = 8'b001_00001; //LDO s1
memory[2] = 8'b010_00001; //rom(65) //end, reg[1]<-rom[65]
memory[3] = 8'b001_00010; //LDO s2
memory[4] = 8'b010_00010; //rom(66) //end, reg[2]<-rom[66]
memory[5] = 8'b001_00011; //LDO s3
memory[6] = 8'b010_00011; //rom(67) //end, reg[3]<-rom[67]
memory[7] = 8'b100_00001; //PRE s1
memory[8] = 8'b101_00010; //ADD s2
memory[9] = 8'b110_00001; //LDM s1 // REG[1] <- REG[1]+REG[2]
memory[10] = 8'b011_00001; //STO s1
memory[11] = 8'b000_00001; //ram(1) // RAM[1] <- REG[1]
memory[12] = 8'b010_00010; //LDA s2
memory[13] = 8'b000_00001; //ram(1) // REG[2] <- RAM[1]
memory[14] = 8'b100_00011; //PRE s3
memory[15] = 8'b101_00010; //ADD s2
memory[16] = 8'b110_00011; //LDM s3 // REG[3] <- REG[2]+REG[3]
memory[17] = 8'b011_00011; //STO s3
memory[18] = 8'b000_00010; //ram(2) //REG[3] -> ram[2]
memory[19] = 8'b111_00000; //HLT
memory[65] = 8'b001_00101; //37
memory[66] = 8'b010_11001; //89
memory[67] = 8'b001_10101; //53
end
  //为验证8位RISC_CPU功能，预存指令，旨在将rom中65、66、67位中的三个数进行加法计算，存储到ram[2]中，ram[1]中寄放前两个数加法计算结果。
assign data = (read&&ena)? memory[addr]:8'hzz;
endmodule
