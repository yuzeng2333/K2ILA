// Autogenerated using stratification.
requires "x86-configuration.k"

module VPMOVZXWD-YMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vpmovzxwd R1:Xmm, R2:Ymm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R1, RSMap), 128, 144)), concatenateMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R1, RSMap), 144, 160)), concatenateMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R1, RSMap), 160, 176)), concatenateMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R1, RSMap), 176, 192)), concatenateMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R1, RSMap), 192, 208)), concatenateMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R1, RSMap), 208, 224)), concatenateMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R1, RSMap), 224, 240)), concatenateMInt( mi(16, 0), extractMInt( getParentValue(R1, RSMap), 240, 256)))))))))
)

    </regstate>
    
endmodule

module VPMOVZXWD-YMM-XMM-SEMANTICS
  imports VPMOVZXWD-YMM-XMM
endmodule
