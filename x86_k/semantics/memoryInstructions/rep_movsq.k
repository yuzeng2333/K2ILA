// Autogenerated using stratification.
requires "x86-configuration.k"

module REPMOVSQ
  imports X86-CONFIGURATION

  rule <k>
    execinstr (rep movsq  .Operands) => .
    ...</k>
    <regstate> RSMap:Map </regstate>
      requires  eqMInt(getRegisterValue(%rcx, RSMap), mi(64, 0))

  rule <k>
    execinstr (rep movsq  .Operands) => 
      execinstr ( movsq  .Operands) ~>  setRegisterValue(subMInt(getRegisterValue(%rcx, RSMap), mi(64,1)), %rcx) ~> execinstr (rep movsq  .Operands)
    ...</k>
    <regstate> RSMap:Map </regstate>
      requires  notBool eqMInt(getRegisterValue(%rcx, RSMap), mi(64, 0))

  endmodule
