// Autogenerated using stratification.
requires "x86-configuration.k"

module SETLE-R8
  imports X86-CONFIGURATION

  rule <k>
    execinstr (setle R1:R8,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R1) |-> concatenateMInt( extractMInt( getParentValue(R1, RSMap), 0, 56), (#ifMInt (eqMInt(getFlag("ZF", RSMap), mi(1,1)) orBool (notBool (eqMInt(getFlag("SF", RSMap), mi(1,1)) ==Bool eqMInt(getFlag("OF", RSMap), mi(1,1))))) #then mi(8, 1) #else mi(8, 0) #fi))
)

    </regstate>
    
endmodule

module SETLE-R8-SEMANTICS
  imports SETLE-R8
endmodule
