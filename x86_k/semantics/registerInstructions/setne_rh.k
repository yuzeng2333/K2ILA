// Autogenerated using stratification.
requires "x86-configuration.k"

module SETNE-RH
  imports X86-CONFIGURATION

  rule <k>
    execinstr (setne R1:Rh,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R1) |-> concatenateMInt( concatenateMInt( extractMInt( getParentValue(R1, RSMap), 0, 48), (#ifMInt (notBool eqMInt(getFlag("ZF", RSMap), mi(1,1))) #then mi(8, 1) #else mi(8, 0) #fi)), extractMInt( getParentValue(R1, RSMap), 56, 64))
)

    </regstate>
    
endmodule

module SETNE-RH-SEMANTICS
  imports SETNE-RH
endmodule
