// Autogenerated using stratification.
requires "x86-configuration.k"

module VMOVUPS-M128-XMM
  imports X86-CONFIGURATION

  context execinstr(vmovups:Opcode R1:Xmm, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vmovups:Opcode R1:Xmm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vmovups R1:Xmm, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (vmovups:Opcode R1:Xmm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              extractMInt( getParentValue(R1, RSMap), 128, 256),
              MemOff,
              128
            )
          
  ...</k>
    <regstate> RSMap:Map </regstate>
endmodule
