// Autogenerated using stratification.
requires "x86-configuration.k"

module CMPSS-XMM-M32-IMM8
  imports X86-CONFIGURATION

  context execinstr(cmpss:Opcode Imm8:Imm, HOLE:Mem, R3:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (cmpss:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset, R3:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 32) ~>
      execinstr (cmpss Imm8, memOffset( MemOff), R3:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> execinstr (cmpss:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset, R3:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( extractMInt( getParentValue(R3, RSMap), 0, 224), (#ifMInt eqMInt( cmp_single_pred(extractMInt( getParentValue(R3, RSMap), 224, 256), Mem32, handleImmediateWithSignExtend(Imm8, 8, 8)), mi(1, 1)) #then mi(32, 4294967295) #else mi(32, 0) #fi))
      )
    </regstate>
endmodule
