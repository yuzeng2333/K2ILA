// Autogenerated using stratification.
requires "x86-configuration.k"

module SHRW-M16-ONE
  imports X86-CONFIGURATION

  rule <k>
    execinstr (shrw  M:Mem,  .Operands) =>  execinstr (shrw $0x1, M,  .Operands)
  ...</k>
  context execinstr(shrw:Opcode $0x1, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (shrw:Opcode $0x1, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 16) ~>
      execinstr (shrw $0x1, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem16:MInt):MemLoadValue ~> execinstr (shrw:Opcode $0x1, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              extractMInt( lshrMInt( concatenateMInt( Mem16, mi(1, 0)), uvalueMInt(mi(17, 1))), 0, 16),
              MemOff,
              16
            )
          
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
"CF" |-> extractMInt( lshrMInt( concatenateMInt( Mem16, mi(1, 0)), uvalueMInt(mi(17, 1))), 16, 17)

"PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( lshrMInt( concatenateMInt( Mem16, mi(1, 0)), uvalueMInt(mi(17, 1))), 15, 16), mi(1, 1)) xorBool eqMInt( extractMInt( lshrMInt( concatenateMInt( Mem16, mi(1, 0)), uvalueMInt(mi(17, 1))), 14, 15), mi(1, 1))) xorBool eqMInt( extractMInt( lshrMInt( concatenateMInt( Mem16, mi(1, 0)), uvalueMInt(mi(17, 1))), 13, 14), mi(1, 1))) xorBool eqMInt( extractMInt( lshrMInt( concatenateMInt( Mem16, mi(1, 0)), uvalueMInt(mi(17, 1))), 12, 13), mi(1, 1))) xorBool eqMInt( extractMInt( lshrMInt( concatenateMInt( Mem16, mi(1, 0)), uvalueMInt(mi(17, 1))), 11, 12), mi(1, 1))) xorBool eqMInt( extractMInt( lshrMInt( concatenateMInt( Mem16, mi(1, 0)), uvalueMInt(mi(17, 1))), 10, 11), mi(1, 1))) xorBool eqMInt( extractMInt( lshrMInt( concatenateMInt( Mem16, mi(1, 0)), uvalueMInt(mi(17, 1))), 9, 10), mi(1, 1))) xorBool eqMInt( extractMInt( lshrMInt( concatenateMInt( Mem16, mi(1, 0)), uvalueMInt(mi(17, 1))), 8, 9), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"AF" |-> (undefMInt)

"ZF" |-> (#ifMInt eqMInt( extractMInt( lshrMInt( concatenateMInt( Mem16, mi(1, 0)), uvalueMInt(mi(17, 1))), 0, 16), mi(16, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> extractMInt( lshrMInt( concatenateMInt( Mem16, mi(1, 0)), uvalueMInt(mi(17, 1))), 0, 1)

"OF" |-> extractMInt( Mem16, 0, 1)
      )
    </regstate>
endmodule
