// Autogenerated using stratification.
requires "x86-configuration.k"

module XCHGQ-R64-R64
  imports X86-CONFIGURATION

  rule <k>
    execinstr (xchgq R1:R64, R2:R64,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R1) |-> getParentValue(R2, RSMap)

convToRegKeys(R2) |-> getParentValue(R1, RSMap)
)

    </regstate>
      requires notBool sameRegisters(R1, R2)

  rule <k>
    execinstr (xchgq R1:R64, R2:R64,  .Operands) => .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
        convToRegKeys(R2) |-> getParentValue(R1, RSMap)
      )
    </regstate>
      requires sameRegisters(R1, R2)
  
endmodule

module XCHGQ-R64-R64-SEMANTICS
  imports XCHGQ-R64-R64
endmodule
