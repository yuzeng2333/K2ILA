// Autogenerated using stratification.
requires "x86-configuration.k"

module NOPL-R32
  imports X86-CONFIGURATION

  rule <k>
    execinstr (nopl R1:R32,  .Operands) => .
  ...</k>
endmodule

module NOPL-R32-SEMANTICS
  imports NOPL-R32
endmodule
