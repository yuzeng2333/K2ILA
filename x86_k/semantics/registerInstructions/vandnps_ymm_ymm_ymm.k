// Autogenerated using stratification.
requires "x86-configuration.k"

module VANDNPS-YMM-YMM-YMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vandnps R1:Ymm, R2:Ymm, R3:Ymm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> andMInt( negMInt( getParentValue(R2, RSMap)), getParentValue(R1, RSMap))
)

    </regstate>
    
endmodule

module VANDNPS-YMM-YMM-YMM-SEMANTICS
  imports VANDNPS-YMM-YMM-YMM
endmodule
