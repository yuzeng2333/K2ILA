// Autogenerated using stratification.
requires "x86-configuration.k"

module SQRTPS-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (sqrtps R1:Xmm, R2:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( sqrt_single(extractMInt( getParentValue(R1, RSMap), 128, 160)), concatenateMInt( sqrt_single(extractMInt( getParentValue(R1, RSMap), 160, 192)), concatenateMInt( sqrt_single(extractMInt( getParentValue(R1, RSMap), 192, 224)), sqrt_single(extractMInt( getParentValue(R1, RSMap), 224, 256))))))
)

    </regstate>
    
endmodule

module SQRTPS-XMM-XMM-SEMANTICS
  imports SQRTPS-XMM-XMM
endmodule
