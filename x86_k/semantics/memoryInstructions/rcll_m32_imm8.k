// Autogenerated using stratification.
requires "x86-configuration.k"

module RCLL-M32-IMM8
  imports X86-CONFIGURATION

  context execinstr(rcll:Opcode Imm8:Imm, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (rcll:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 32) ~>
      execinstr (rcll Imm8, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> execinstr (rcll:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              extractMInt( rol( concatenateMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then mi(1, 1) #else mi(1, 0) #fi), Mem32), uremMInt( concatenateMInt( mi(25, 0), andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31))), mi(33, 33))), 1, 33),
              MemOff,
              32
            )
          
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
"CF" |-> extractMInt( rol( concatenateMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then mi(1, 1) #else mi(1, 0) #fi), Mem32), uremMInt( concatenateMInt( mi(25, 0), andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31))), mi(33, 33))), 0, 1)

"OF" |-> (#ifMInt ((eqMInt( extractMInt( uremMInt( concatenateMInt( mi(25, 0), andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31))), mi(33, 33)), 25, 33), mi(8, 1)) andBool (eqMInt( extractMInt( rol( concatenateMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then mi(1, 1) #else mi(1, 0) #fi), Mem32), uremMInt( concatenateMInt( mi(25, 0), andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31))), mi(33, 33))), 0, 1), mi(1, 1)) xorBool eqMInt( extractMInt( rol( concatenateMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then mi(1, 1) #else mi(1, 0) #fi), Mem32), uremMInt( concatenateMInt( mi(25, 0), andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31))), mi(33, 33))), 1, 2), mi(1, 1)))) orBool ((notBool eqMInt( extractMInt( uremMInt( concatenateMInt( mi(25, 0), andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31))), mi(33, 33)), 25, 33), mi(8, 1))) andBool (((notBool eqMInt( extractMInt( uremMInt( concatenateMInt( mi(25, 0), andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31))), mi(33, 33)), 25, 33), mi(8, 0))) andBool (undefBool)) orBool ((notBool (notBool eqMInt( extractMInt( uremMInt( concatenateMInt( mi(25, 0), andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 31))), mi(33, 33)), 25, 33), mi(8, 0)))) andBool eqMInt(getFlag("OF", RSMap), mi(1,1)))))) #then mi(1, 1) #else mi(1, 0) #fi)
      )
    </regstate>
endmodule
