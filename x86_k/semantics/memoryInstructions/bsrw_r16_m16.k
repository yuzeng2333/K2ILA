// Autogenerated using stratification.
requires "x86-configuration.k"

module BSRW-R16-R16
  imports X86-CONFIGURATION

  context execinstr(bsrw:Opcode HOLE:Mem,  R2:R16, .Operands) [result(MemOffset)]

  rule <k>
    execinstr (bsrw memOffset( MemOff:MInt):MemOffset, R2:R16,  .Operands) =>
      loadFromMemory( MemOff, 16) ~>
      execinstr (bsrw memOffset( MemOff), R2,  .Operands)  
  ...</k>

  rule <k>
    memLoadValue(Mem16:MInt):MemLoadValue ~> 
      execinstr (bsrw memOffset( MemOff:MInt):MemOffset, R2:R16,  .Operands) => .
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
    requires eqMInt(Mem16, mi(16, 0))


  rule <k>
    memLoadValue(Mem16:MInt):MemLoadValue ~> 
      execinstr (bsrw memOffset( MemOff:MInt):MemOffset, R2:R16,  .Operands) => .
  ...</k>
   <regstate>
RSMap:Map => updateMap(RSMap,
  convToRegKeys(R2) |-> mi(16, scanReverse(Mem16, 0, 16))
  "ZF" |-> mi(1,0)
  "SF" |-> (undefMInt)
  "CF" |-> (undefMInt)
  "OF" |-> (undefMInt)
  "PF" |-> (undefMInt)
  "AF" |-> (undefMInt)
  )
   </regstate>
    requires notBool eqMInt(Mem16, mi(16, 0))

    
endmodule
