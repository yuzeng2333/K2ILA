// Autogenerated using stratification.
requires "x86-configuration.k"

module STOSQ
  imports X86-CONFIGURATION

  rule <k>
    execinstr (stosq M:Mem,  .Operands) =>
      storeToMemory(getRegisterValue(%rax, RSMap), getRegisterValue(%rdi, RSMap), 64) ~>
      setRegisterValue(addMInt(getRegisterValue(%rdi, RSMap), mi( 64, 8)), %rdi)
  ...</k>
    <regstate> RSMap:Map </regstate>
      requires eqMInt({RSMap["DF"]}:>MInt, mi(1, 0))

  rule <k>
    execinstr (stosq  .Operands) =>
      storeToMemory(getRegisterValue(%rax, RSMap), getRegisterValue(%rdi, RSMap), 64) ~>
      setRegisterValue(subMInt(getRegisterValue(%rdi, RSMap), mi( 64, 8)), %rdi)
  ...</k>
    <regstate> RSMap:Map </regstate>
      requires eqMInt({RSMap["DF"]}:>MInt, mi(1, 1))
endmodule
