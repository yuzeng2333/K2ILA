// Autogenerated using stratification.
requires "x86-configuration.k"

module CMOVPQ-R64-R64
  imports X86-CONFIGURATION

  rule <k>
    execinstr (cmovpq R1:R64, R2:R64,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> (#ifMInt eqMInt(getFlag("PF", RSMap), mi(1,1)) #then getParentValue(R1, RSMap) #else getParentValue(R2, RSMap) #fi)
)

    </regstate>
    
endmodule

module CMOVPQ-R64-R64-SEMANTICS
  imports CMOVPQ-R64-R64
endmodule
