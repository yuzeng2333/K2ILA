// Autogenerated using stratification.
requires "x86-configuration.k"

module XCHGQ-RAX-R64
  imports X86-CONFIGURATION

  rule <k>
    execinstr (xchgq R1:R64, %rax,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
"RAX" |-> getParentValue(R1, RSMap)

convToRegKeys(R1) |-> getParentValue(%rax, RSMap)
)

    </regstate>
      requires notBool sameRegisters(%rax, R1)

rule <k>
    execinstr (xchgq R1:R64, %rax,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R1) |-> getParentValue(%rax, RSMap)
)

    </regstate>
      requires sameRegisters(%rax, R1)


endmodule

module XCHGQ-RAX-R64-SEMANTICS
  imports XCHGQ-RAX-R64
endmodule
