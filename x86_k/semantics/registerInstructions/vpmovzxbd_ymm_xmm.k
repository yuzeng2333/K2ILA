// Autogenerated using stratification.
requires "x86-configuration.k"

module VPMOVZXBD-YMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vpmovzxbd R1:Xmm, R2:Ymm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( concatenateMInt( mi(24, 0), extractMInt( getParentValue(R1, RSMap), 192, 200)), concatenateMInt( concatenateMInt( mi(24, 0), extractMInt( getParentValue(R1, RSMap), 200, 208)), concatenateMInt( concatenateMInt( mi(24, 0), extractMInt( getParentValue(R1, RSMap), 208, 216)), concatenateMInt( concatenateMInt( mi(24, 0), extractMInt( getParentValue(R1, RSMap), 216, 224)), concatenateMInt( concatenateMInt( mi(24, 0), extractMInt( getParentValue(R1, RSMap), 224, 232)), concatenateMInt( concatenateMInt( mi(24, 0), extractMInt( getParentValue(R1, RSMap), 232, 240)), concatenateMInt( concatenateMInt( mi(24, 0), extractMInt( getParentValue(R1, RSMap), 240, 248)), concatenateMInt( mi(24, 0), extractMInt( getParentValue(R1, RSMap), 248, 256)))))))))
)

    </regstate>
    
endmodule

module VPMOVZXBD-YMM-XMM-SEMANTICS
  imports VPMOVZXBD-YMM-XMM
endmodule
