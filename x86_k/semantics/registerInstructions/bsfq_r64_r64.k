// Autogenerated using stratification.
requires "x86-configuration.k"

module BSFQ-R64-R64
  imports X86-CONFIGURATION

  rule <k>
    execinstr (bsfq R1:R64, R2:R64,  .Operands) =>  .
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
    requires eqMInt(getRegisterValue(R1, RSMap), mi(64, 0))


  rule <k>
    execinstr (bsfq R1:R64, R2:R64,  .Operands) =>  .
  ...</k>
   <regstate>
RSMap:Map => updateMap(RSMap,
  convToRegKeys(R2) |-> mi(64, scanForward(getRegisterValue(R1, RSMap), 63, 64))
  "ZF" |-> mi(1,0)
  "SF" |-> (undefMInt)
  "CF" |-> (undefMInt)
  "OF" |-> (undefMInt)
  "PF" |-> (undefMInt)
  "AF" |-> (undefMInt)
  )
   </regstate>
    requires notBool eqMInt(getRegisterValue(R1, RSMap), mi(64, 0))

    
endmodule
