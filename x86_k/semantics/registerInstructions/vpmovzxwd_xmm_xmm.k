// Autogenerated using stratification.
requires "x86-configuration.k"

module VPMOVZXWD-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vpmovzxwd R1:Xmm, R2:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( mi(128, 0), concatenateMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R1, RSMap), 192, 208)), concatenateMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R1, RSMap), 208, 224)), concatenateMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R1, RSMap), 224, 240)), concatenateMInt( mi(16, 0), extractMInt( getParentValue(R1, RSMap), 240, 256))))))
)

    </regstate>
    
endmodule

module VPMOVZXWD-XMM-XMM-SEMANTICS
  imports VPMOVZXWD-XMM-XMM
endmodule
