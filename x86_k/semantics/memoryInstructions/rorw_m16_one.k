// Autogenerated using stratification.
requires "x86-configuration.k"

module RORW-M16-ONE
  imports X86-CONFIGURATION

  context execinstr(rorw:Opcode $0x1, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (rorw:Opcode $0x1, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 16) ~>
      execinstr (rorw $0x1, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem16:MInt):MemLoadValue ~> execinstr (rorw:Opcode $0x1, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              ror( Mem16, mi(16, 1)),
              MemOff,
              16
            )
          
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
"CF" |-> extractMInt( ror( Mem16, mi(16, 1)), 0, 1)

"OF" |-> (#ifMInt (eqMInt( extractMInt( ror( Mem16, mi(16, 1)), 0, 1), mi(1, 1)) xorBool eqMInt( extractMInt( ror( Mem16, mi(16, 1)), 1, 2), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)
      )
    </regstate>
endmodule
