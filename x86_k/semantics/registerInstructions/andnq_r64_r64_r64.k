// Autogenerated using stratification.
requires "x86-configuration.k"

module ANDNQ-R64-R64-R64
  imports X86-CONFIGURATION

  rule <k>
    execinstr (andnq R1:R64, R2:R64, R3:R64,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> andMInt( negMInt( getParentValue(R2, RSMap)), getParentValue(R1, RSMap))

"CF" |-> mi(1, 0)

"PF" |-> (undefMInt)

"AF" |-> (undefMInt)

"ZF" |-> (#ifMInt eqMInt( andMInt( negMInt( getParentValue(R2, RSMap)), getParentValue(R1, RSMap)), mi(64, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> andMInt( negMInt( extractMInt( getParentValue(R2, RSMap), 0, 1)), extractMInt( getParentValue(R1, RSMap), 0, 1))

"OF" |-> mi(1, 0)
)

    </regstate>
    
endmodule

module ANDNQ-R64-R64-R64-SEMANTICS
  imports ANDNQ-R64-R64-R64
endmodule
