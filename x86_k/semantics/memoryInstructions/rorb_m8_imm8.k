// Autogenerated using stratification.
requires "x86-configuration.k"

module RORB-M8-IMM8
  imports X86-CONFIGURATION

  context execinstr(rorb:Opcode Imm8:Imm, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (rorb:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 8) ~>
      execinstr (rorb Imm8, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem8:MInt):MemLoadValue ~> execinstr (rorb:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              ror( Mem8, andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31))),
              MemOff,
              8
            )
          
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
"CF" |-> (#ifMInt (((notBool eqMInt( andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31)), mi(8, 0))) andBool eqMInt( extractMInt( ror( Mem8, andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31))), 0, 1), mi(1, 1))) orBool ((notBool (notBool eqMInt( andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31)), mi(8, 0)))) andBool eqMInt(getFlag("CF", RSMap), mi(1,1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"OF" |-> (#ifMInt ((eqMInt( andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31)), mi(8, 1)) andBool (eqMInt( extractMInt( ror( Mem8, andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31))), 0, 1), mi(1, 1)) xorBool eqMInt( extractMInt( ror( Mem8, andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31))), 1, 2), mi(1, 1)))) orBool ((notBool eqMInt( andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31)), mi(8, 1))) andBool (((notBool eqMInt( andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31)), mi(8, 0))) andBool (undefBool)) orBool ((notBool (notBool eqMInt( andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31)), mi(8, 0)))) andBool eqMInt(getFlag("OF", RSMap), mi(1,1)))))) #then mi(1, 1) #else mi(1, 0) #fi)
      )
    </regstate>
endmodule
