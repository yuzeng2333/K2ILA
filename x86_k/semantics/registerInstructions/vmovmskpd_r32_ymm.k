// Autogenerated using stratification.
requires "x86-configuration.k"

module VMOVMSKPD-R32-YMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vmovmskpd R1:Ymm, R2:R32,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> (concatenateMInt(mi(48, 0), extractMInt(addMInt(concatenateMInt(mi(9, 0), extractMInt(addMInt(concatenateMInt(mi(1, 0), extractMInt(addMInt(concatenateMInt(mi(7, 0), concatenateMInt(extractMInt(getParentValue(R1, RSMap), 0, 1), extractMInt(getParentValue(R1, RSMap), 64, 65))), concatenateMInt(mi(7, 0), concatenateMInt(extractMInt(getParentValue(R1, RSMap), 0, 1), extractMInt(getParentValue(R1, RSMap), 64, 65)))), 1, 9)), concatenateMInt(mi(7, 0), concatenateMInt(extractMInt(getParentValue(R1, RSMap), 128, 129), extractMInt(getParentValue(R1, RSMap), 192, 193)))), 1, 9)), concatenateMInt(mi(9, 0), extractMInt(addMInt(concatenateMInt(mi(7, 0), concatenateMInt(extractMInt(getParentValue(R1, RSMap), 0, 1), extractMInt(getParentValue(R1, RSMap), 64, 65))), concatenateMInt(mi(7, 0), concatenateMInt(extractMInt(getParentValue(R1, RSMap), 0, 1), extractMInt(getParentValue(R1, RSMap), 64, 65)))), 1, 9))), 1, 17)) )


)

    </regstate>
endmodule

module VMOVMSKPD-R32-YMM-SEMANTICS
  imports VMOVMSKPD-R32-YMM
endmodule
/*
TargetInstr:
vmovmskpd %ymm1, %ebx
RWSet:
maybe read:{ %ymm1 }
must read:{ %ymm1 }
maybe write:{ %rbx }
must write:{ %rbx }
maybe undef:{ }
must undef:{ }
required flags:{ avx }

Circuit:
circuit:movq $0x20, %rbx       #  1     0     10     OPC=movq_r64_imm64
circuit:vmovmskpd %ymm1, %r12  #  2     0xa   4      OPC=vmovmskpd_r64_ymm
circuit:xaddw %bx, %r12w       #  3     0xe   5      OPC=xaddw_r16_r16
BVF:
WARNING: No live out values provided, assuming { }
WARNING: No def in values provided; assuming { %mxcsr::rc[0] }
Target

vmovmskpd %ymm1, %ebx

  maybe read:      { %ymm1 }
  must read:       { %ymm1 }
  maybe write:     { %rbx }
  must write:      { %rbx }
  maybe undef:     { }
  must undef:      { }
  required flags:  { avx }

Circuits:

%rbx   : (concat <0x0|48> (plus (concat <0x0|1> (concat (plus (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[191:160]) (concat <0x0|1> <%ymm1|256>[191:160]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[191:160]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[191:160])) (concat <0x0|1> <%ymm1|256>[191:160]))[32:32] <0x1|1>) then (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x2|33> else <0x1|33>) else (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>)) (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>))[15:8] (plus (concat <0x0|1> (plus (concat <0x0|1> (plus (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[191:160]) (concat <0x0|1> <%ymm1|256>[191:160]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[191:160]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[191:160])) (concat <0x0|1> <%ymm1|256>[191:160]))[32:32] <0x1|1>) then (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x2|33> else <0x1|33>) else (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>)) (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>))[7:0]) (concat <0x0|1> (plus (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[191:160]) (concat <0x0|1> <%ymm1|256>[191:160]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[191:160]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[191:160])) (concat <0x0|1> <%ymm1|256>[191:160]))[32:32] <0x1|1>) then (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x2|33> else <0x1|33>) else (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>)) (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>))[7:0]))[7:0]) (concat <0x0|1> (plus (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[63:32]) (concat <0x0|1> <%ymm1|256>[63:32]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[63:32]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[63:32])) (concat <0x0|1> <%ymm1|256>[63:32]))[32:32] <0x1|1>) then (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[127:96]) (concat <0x0|1> <%ymm1|256>[127:96]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[127:96]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[127:96])) (concat <0x0|1> <%ymm1|256>[127:96]))[32:32] <0x1|1>) then <0x2|33> else <0x1|33>) else (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[127:96]) (concat <0x0|1> <%ymm1|256>[127:96]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[127:96]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[127:96])) (concat <0x0|1> <%ymm1|256>[127:96]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>)) (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[127:96]) (concat <0x0|1> <%ymm1|256>[127:96]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[127:96]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[127:96])) (concat <0x0|1> <%ymm1|256>[127:96]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>))[7:0]))[7:0])) (concat <0x0|1> (concat (plus (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[63:32]) (concat <0x0|1> <%ymm1|256>[63:32]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[63:32]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[63:32])) (concat <0x0|1> <%ymm1|256>[63:32]))[32:32] <0x1|1>) then (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[127:96]) (concat <0x0|1> <%ymm1|256>[127:96]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[127:96]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[127:96])) (concat <0x0|1> <%ymm1|256>[127:96]))[32:32] <0x1|1>) then <0x2|33> else <0x1|33>) else (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[127:96]) (concat <0x0|1> <%ymm1|256>[127:96]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[127:96]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[127:96])) (concat <0x0|1> <%ymm1|256>[127:96]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>)) (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[127:96]) (concat <0x0|1> <%ymm1|256>[127:96]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[127:96]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[127:96])) (concat <0x0|1> <%ymm1|256>[127:96]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>))[15:8] (plus (concat <0x0|1> (plus (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[191:160]) (concat <0x0|1> <%ymm1|256>[191:160]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[191:160]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[191:160])) (concat <0x0|1> <%ymm1|256>[191:160]))[32:32] <0x1|1>) then (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x2|33> else <0x1|33>) else (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>)) (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>))[7:0]) (concat <0x0|1> (plus (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[191:160]) (concat <0x0|1> <%ymm1|256>[191:160]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[191:160]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[191:160])) (concat <0x0|1> <%ymm1|256>[191:160]))[32:32] <0x1|1>) then (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x2|33> else <0x1|33>) else (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>)) (if (== (plus (if (== (plus (concat <0x0|1> <%ymm1|256>[255:224]) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then (plus (concat <0x0|1> <%ymm1|256>[255:224]) <0x1|33>) else (concat <0x0|1> <%ymm1|256>[255:224])) (concat <0x0|1> <%ymm1|256>[255:224]))[32:32] <0x1|1>) then <0x1|33> else <0x0|33>))[7:0]))[7:0])))[15:0])

sigfpe  : <sigfpe>
sigbus  : <sigbus>
sigsegv : <sigsegv>

*/