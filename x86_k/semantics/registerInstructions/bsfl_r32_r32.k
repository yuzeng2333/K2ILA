// Autogenerated using stratification.
requires "x86-configuration.k"

module BSFL-R32-R32
  imports X86-CONFIGURATION

  rule <k>
    execinstr (bsfl R1:R32, R2:R32,  .Operands) =>  .
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
    requires eqMInt(getRegisterValue(R1, RSMap), mi(32, 0))


  rule <k>
    execinstr (bsfl R1:R32, R2:R32,  .Operands) =>  .
  ...</k>
   <regstate>
RSMap:Map => updateMap(RSMap,
  convToRegKeys(R2) |-> mi(32, scanForward(getRegisterValue(R1, RSMap), 31, 32))
  "ZF" |-> mi(1,0)
  "SF" |-> (undefMInt)
  "CF" |-> (undefMInt)
  "OF" |-> (undefMInt)
  "PF" |-> (undefMInt)
  "AF" |-> (undefMInt)
  )
   </regstate>
    requires notBool eqMInt(getRegisterValue(R1, RSMap), mi(32, 0))

    
endmodule
