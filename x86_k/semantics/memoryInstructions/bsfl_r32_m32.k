// Autogenerated using stratification.
requires "x86-configuration.k"

module BSFL-R32-R32
  imports X86-CONFIGURATION

  context execinstr(bsfl:Opcode HOLE:Mem,  R2:R32, .Operands) [result(MemOffset)]

  rule <k>
    execinstr (bsfl memOffset( MemOff:MInt):MemOffset, R2:R32,  .Operands) =>
      loadFromMemory( MemOff, 32) ~>
      execinstr (bsfl memOffset( MemOff), R2,  .Operands)  
  ...</k>

  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> 
      execinstr (bsfl memOffset( MemOff:MInt):MemOffset, R2:R32,  .Operands) => .
  ...</k>
   <regstate>
RSMap:Map => updateMap(RSMap,
  convToRegKeys(R2) |-> (undefMInt)
  "ZF" |-> mi(1,1)
  "SF" |-> (undefMInt)
  "CF" |-> (undefMInt)
  "OF" |-> (undefMInt)
  "PF" |-> (undefMInt)
  "AF" |-> (undefMInt)
  )
   </regstate>
    requires eqMInt(Mem32, mi(32, 0))


  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> 
      execinstr (bsfl memOffset( MemOff:MInt):MemOffset, R2:R32,  .Operands) => .
  ...</k>
   <regstate>
RSMap:Map => updateMap(RSMap,
  convToRegKeys(R2) |-> mi(32, scanForward(Mem32, 31, 32))
  "ZF" |-> mi(1,0)
  "SF" |-> (undefMInt)
  "CF" |-> (undefMInt)
  "OF" |-> (undefMInt)
  "PF" |-> (undefMInt)
  "AF" |-> (undefMInt)
  )
   </regstate>
    requires notBool eqMInt(Mem32, mi(32, 0))

    
endmodule
