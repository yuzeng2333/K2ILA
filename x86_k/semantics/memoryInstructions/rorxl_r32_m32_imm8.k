// Autogenerated using stratification.
requires "x86-configuration.k"

module RORXL-R32-M32-IMM8
  imports X86-CONFIGURATION

  rule <k>
    execinstr (rorx:Opcode Imm8:Imm, M:Mem, R3:R32,  .Operands) => execinstr (rorxl:Opcode Imm8:Imm, M:Mem, R3:R32,  .Operands) 
  ...</k>
  context execinstr(rorxl:Opcode Imm8:Imm, HOLE:Mem, R3:R32,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (rorxl:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset, R3:R32,  .Operands) =>
      loadFromMemory( MemOff, 32) ~>
      execinstr (rorxl Imm8, memOffset( MemOff), R3,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> execinstr (rorxl:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset, R3:R32,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(32, 0), orMInt( lshrMInt( Mem32, uvalueMInt(andMInt( concatenateMInt( mi(24, 0), handleImmediateWithSignExtend(Imm8, 8, 8)), mi(32, 31)))), shiftLeftMInt( Mem32, uvalueMInt(subMInt( mi(32, 32), andMInt( concatenateMInt( mi(24, 0), handleImmediateWithSignExtend(Imm8, 8, 8)), mi(32, 31)))))))
      )
    </regstate>
endmodule
