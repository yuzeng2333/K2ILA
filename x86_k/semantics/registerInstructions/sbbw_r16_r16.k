// Autogenerated using stratification.
requires "x86-configuration.k"

module SBBW-R16-R16
  imports X86-CONFIGURATION

  rule <k>
    execinstr (sbbw R1:R16, R2:R16,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 48), extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 1, 17))

"CF" |-> (#ifMInt (notBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 0, 1), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)

"PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 16, 17), mi(1, 1)) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 15, 16), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 14, 15), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 13, 14), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 12, 13), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 11, 12), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 10, 11), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 9, 10), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"AF" |-> xorMInt( xorMInt( extractMInt( getParentValue(R1, RSMap), 59, 60), extractMInt( getParentValue(R2, RSMap), 59, 60)), extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 12, 13))

"ZF" |-> (#ifMInt eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 1, 17), mi(16, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 1, 2)

"OF" |-> (#ifMInt ((eqMInt( negMInt( extractMInt( getParentValue(R1, RSMap), 48, 49)), mi(1, 1)) ==Bool eqMInt( extractMInt( getParentValue(R2, RSMap), 48, 49), mi(1, 1))) andBool (notBool (eqMInt( negMInt( extractMInt( getParentValue(R1, RSMap), 48, 49)), mi(1, 1)) ==Bool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)) #fi), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 64))), 1, 2), mi(1, 1))))) #then mi(1, 1) #else mi(1, 0) #fi)
)

    </regstate>
    
endmodule

module SBBW-R16-R16-SEMANTICS
  imports SBBW-R16-R16
endmodule
