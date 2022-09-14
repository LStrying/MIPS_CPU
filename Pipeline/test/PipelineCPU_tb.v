/*****************
//test instruction
0x00000000   addi  $1,$0,8                20010008
0x00000004    ori  $2,$0,2                34020002
0x00000008    add  $3,$2,$1               00411820
0x0000000C    sub  $5,$3,$2               00622823
0x00000010    and  $4,$5,$2               00A22024
0x00000014    or  $8,$4,$2                00824025
0x00000018    sll  $8,$8,1                00084040
0x0000001C    bne $8,$1,-2  (≠,转18)      1501FFFE
0x00000020    slt  $6,$2,$1               0041302A
0x00000024    slt  $7,$6,$0               00C0382A
0x00000028    addi $7,$7,8                20E70008
0x0000002C    beq $7,$1,-2  (≠,转28)      10E1FFFE
0x00000030    sw  $2,4($1)                AC220004
0x00000034    lw  $9,4($1)                8C290004
0x00000038    bgtz  $9,1 (>0,转40)        1D200001
0x0000003C    j  0x00000048               08000012
0x00000040    addi  $9,$0,-1              2009FFFF
0x00000044    j  0x00000038               0800000E
0x00000048    xor $10,$2,$1               00415026
0x0000004C    xori $10,$1,7               382A0007
0x00000050    lui  $11,15                 3C0B000F
0x00000054    slti $12,$10,22             294C0016
0x00000058    sllv $13,$2,$12             004C6804
0x0000005C    srlv $14,$2,$13             004D7006
0x00000060    srl $14,$10,2               000A7082
0x00000064    addi $15,$0,0x70            200F0070
0x00000068    jr $15                      01E00008
0x0000006C    j 0x00000074                0800001D
0x00000070    jal 0x0000006C              0C00001B
0x00000074    sb $2,5($1)                 A0220005
0x00000078    lb $16,5($1)                802A0005
0x0000007C    bgez $10,1(>=0,转84)        05410001
0x00000080    blez $10,2(<0,转8C)         19400002
0x00000084    sub $10,$2,$1               00415022
0x00000088    bltz $10,-2(<0,转80)        0540FFFD
0x0000008C    sra $10,$10,2               000A5083
0x00000090    srav $10,$2,$1              00415007
0x00000094     
0x00000098 
*****************/
`timescale 1ns/1ns
module PipelineCPU_tb();
reg clk = 0;
reg rst_n = 1;
always begin
    #5;
    clk = ~clk;
end
initial begin
    #0 rst_n = 1;
    #5;
    rst_n = 0;
    #5;
    rst_n = 1;
end
    PipelineCPU PipelineCPU(
        .clk(clk),
        .rst_n(rst_n)
    );
endmodule