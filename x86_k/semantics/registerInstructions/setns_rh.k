// Autogenerated using stratification.
requires "x86-configuration.k"

module SETNS-RH
  imports X86-CONFIGURATION

  rule <k>
    execinstr (setns R1:Rh,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R1) |-> concatenateMInt( concatenateMInt( extractMInt( getParentValue(R1, RSMap), 0, 48), (#ifMInt (notBool eqMInt(getFlag("SF", RSMap), mi(1,1))) #then mi(8, 1) #else mi(8, 0) #fi)), extractMInt( getParentValue(R1, RSMap), 56, 64))
)

    </regstate>
    
endmodule

module SETNS-RH-SEMANTICS
  imports SETNS-RH
endmodule
