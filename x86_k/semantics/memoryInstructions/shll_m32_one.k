// Autogenerated using stratification.
requires "x86-configuration.k"

module SHLL-M32-ONE
  imports X86-CONFIGURATION

  context execinstr(shll:Opcode $0x1, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (shll:Opcode $0x1, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 32) ~>
      execinstr (shll $0x1, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> execinstr (shll:Opcode $0x1, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 1, 33),
              MemOff,
              32
            )
          
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
"CF" |-> extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 0, 1)

"PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 32, 33), mi(1, 1)) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 31, 32), mi(1, 1))) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 30, 31), mi(1, 1))) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 29, 30), mi(1, 1))) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 28, 29), mi(1, 1))) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 27, 28), mi(1, 1))) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 26, 27), mi(1, 1))) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 25, 26), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"AF" |-> (undefMInt)

"ZF" |-> (#ifMInt eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 1, 33), mi(32, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 1, 2)

"OF" |-> (#ifMInt (eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 0, 1), mi(1, 1)) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), Mem32), uvalueMInt(mi(33, 1))), 1, 2), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)
      )
    </regstate>
endmodule
