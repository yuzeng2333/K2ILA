// Autogenerated using stratification.
requires "x86-configuration.k"

module MULQ-M64
  imports X86-CONFIGURATION

  context execinstr(mulq:Opcode HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (mulq:Opcode memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 64) ~>
      execinstr (mulq memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem64:MInt):MemLoadValue ~> execinstr (mulq:Opcode memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
"RAX" |-> extractMInt( mulMInt( concatenateMInt( mi(64, 0), Mem64), concatenateMInt( mi(64, 0), getParentValue(%rax, RSMap))), 64, 128)

"RDX" |-> extractMInt( mulMInt( concatenateMInt( mi(64, 0), Mem64), concatenateMInt( mi(64, 0), getParentValue(%rax, RSMap))), 0, 64)

"CF" |-> (#ifMInt (notBool eqMInt( extractMInt( mulMInt( concatenateMInt( mi(64, 0), Mem64), concatenateMInt( mi(64, 0), getParentValue(%rax, RSMap))), 0, 64), mi(64, 0))) #then mi(1, 1) #else mi(1, 0) #fi)

"PF" |-> (undefMInt)

"AF" |-> (undefMInt)

"ZF" |-> (undefMInt)

"SF" |-> (undefMInt)

"OF" |-> (#ifMInt (notBool eqMInt( extractMInt( mulMInt( concatenateMInt( mi(64, 0), Mem64), concatenateMInt( mi(64, 0), getParentValue(%rax, RSMap))), 0, 64), mi(64, 0))) #then mi(1, 1) #else mi(1, 0) #fi)
      )
    </regstate>
endmodule
