// Autogenerated using stratification.
requires "x86-configuration.k"

module XCHGB-RH-RH
  imports X86-CONFIGURATION

  rule <k>
    execinstr (xchgb R1:Rh, R2:Rh,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 48), extractMInt( getParentValue(R1, RSMap), 48, 56)), extractMInt( getParentValue(R2, RSMap), 56, 64))

convToRegKeys(R1) |-> concatenateMInt( concatenateMInt( extractMInt( getParentValue(R1, RSMap), 0, 48), extractMInt( getParentValue(R2, RSMap), 48, 56)), extractMInt( getParentValue(R1, RSMap), 56, 64))
)

    </regstate>
      requires notBool sameRegisters(R1, R2)

  rule <k>
    execinstr (xchgb R1:Rh, R2:Rh,  .Operands) => .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
        convToRegKeys(R2) |-> getParentValue(R2, RSMap)
      )
    </regstate>
      requires sameRegisters(R1, R2)
  
endmodule

module XCHGB-RH-RH-SEMANTICS
  imports XCHGB-RH-RH
endmodule
