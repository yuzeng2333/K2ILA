// Autogenerated using stratification.
requires "x86-configuration.k"

module MOVAPS-M128-XMM
  imports X86-CONFIGURATION

  context execinstr(movaps:Opcode R1:Xmm, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (movaps:Opcode R1:Xmm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
            storeToMemory(
              extractMInt( getParentValue(R1, RSMap), 128, 256),
              MemOff,
              128
            )
          
  ...</k>
    <regstate> RSMap:Map </regstate>
endmodule
