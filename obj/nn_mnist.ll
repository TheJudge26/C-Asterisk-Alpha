; ModuleID = "cstar_module"
target triple = "x86_64-pc-windows-msvc"
target datalayout = ""

%"NeuralNet" = type {double*, double*, double*, double*, double*, double*, double*, double}
declare i32 @"printf"(i8* %".1", ...)

declare double @"exp"(double %".1")

declare double* @"load_csv_native"(i8* %".1", i32 %".2")

declare i8* @"malloc"(i32 %".1")

declare double @"sqrt"(double %".1")

declare double @"log"(double %".1")

declare double @"pow"(double %".1", double %".2")

declare i32 @"strlen"(i8* %".1")

declare i8* @"strcpy"(i8* %".1", i8* %".2")

declare i8* @"strcat"(i8* %".1", i8* %".2")

declare i32 @"strcmp"(i8* %".1", i8* %".2")

define i32 @"main"()
{
entry:
  %".2" = getelementptr [4 x i8], [4 x i8]* @"fmt_17", i32 0, i32 0
  %".3" = call i32 (i8*, ...) @"printf"(i8* %".2", double 0x40c3878000000000)
  %"new_NeuralNet" = alloca %"NeuralNet"
  %".4" = getelementptr [54 x i8], [54 x i8]* @"str_18", i32 0, i32 0
  %".5" = call double* @"load_csv_native"(i8* %".4", i32 401000)
  %".6" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %"new_NeuralNet", i32 0, i32 0
  store double* %".5", double** %".6"
  %".8" = getelementptr [26 x i8], [26 x i8]* @"str_19", i32 0, i32 0
  %".9" = call double* @"load_csv_native"(i8* %".8", i32 25600)
  %".10" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %"new_NeuralNet", i32 0, i32 1
  store double* %".9", double** %".10"
  %".12" = getelementptr [26 x i8], [26 x i8]* @"str_20", i32 0, i32 0
  %".13" = call double* @"load_csv_native"(i8* %".12", i32 64)
  %".14" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %"new_NeuralNet", i32 0, i32 2
  store double* %".13", double** %".14"
  %".16" = getelementptr [26 x i8], [26 x i8]* @"str_21", i32 0, i32 0
  %".17" = call double* @"load_csv_native"(i8* %".16", i32 64)
  %".18" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %"new_NeuralNet", i32 0, i32 3
  store double* %".17", double** %".18"
  %".20" = getelementptr [26 x i8], [26 x i8]* @"str_22", i32 0, i32 0
  %".21" = call double* @"load_csv_native"(i8* %".20", i32 1)
  %".22" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %"new_NeuralNet", i32 0, i32 4
  store double* %".21", double** %".22"
  %".24" = getelementptr [26 x i8], [26 x i8]* @"str_23", i32 0, i32 0
  %".25" = call double* @"load_csv_native"(i8* %".24", i32 64)
  %".26" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %"new_NeuralNet", i32 0, i32 5
  store double* %".25", double** %".26"
  %".28" = getelementptr [26 x i8], [26 x i8]* @"str_24", i32 0, i32 0
  %".29" = call double* @"load_csv_native"(i8* %".28", i32 64)
  %".30" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %"new_NeuralNet", i32 0, i32 6
  store double* %".29", double** %".30"
  %".32" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %"new_NeuralNet", i32 0, i32 7
  store double 0x3f847ae147ae147b, double* %".32"
  %".34" = load %"NeuralNet", %"NeuralNet"* %"new_NeuralNet"
  %"net" = alloca %"NeuralNet"
  store %"NeuralNet" %".34", %"NeuralNet"* %"net"
  %".36" = call i32 @"NeuralNet_train"(%"NeuralNet"* %"net")
  %".37" = call i32 @"NeuralNet_test"(%"NeuralNet"* %"net")
  %"accuracy" = alloca i32
  store i32 %".37", i32* %"accuracy"
  %".39" = load i32, i32* %"accuracy"
  %".40" = getelementptr [4 x i8], [4 x i8]* @"fmt_25", i32 0, i32 0
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %".39")
  %".42" = getelementptr [4 x i8], [4 x i8]* @"fmt_26", i32 0, i32 0
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".42", double 0x40915c0000000000)
  ret i32 0
}

define double @"NeuralNet_forward_one"(%"NeuralNet"* %".1", i32 %".2")
{
entry:
  %"i" = alloca i32
  store i32 %".2", i32* %"i"
  %".5" = load i32, i32* %"i"
  %".6" = mul i32 %".5", 401
  %"base" = alloca i32
  store i32 %".6", i32* %"base"
  %"h" = alloca i32
  %"h_idx" = alloca i32
  store i32 0, i32* %"h_idx"
  br label %"for.cond"
for.cond:
  %".10" = load i32, i32* %"h_idx"
  %".11" = icmp slt i32 %".10", 64
  br i1 %".11", label %"for.body", label %"for.end"
for.body:
  store i32 %".10", i32* %"h"
  %".14" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %"h"
  %".16" = load double*, double** %".14"
  %".17" = getelementptr inbounds double, double* %".16", i32 %".15"
  %".18" = load double, double* %".17"
  %"z1_h" = alloca double
  store double %".18", double* %"z1_h"
  %"p" = alloca i32
  %"p_idx" = alloca i32
  store i32 0, i32* %"p_idx"
  br label %"for.cond.1"
for.end:
  %".77" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 4
  %".78" = load double*, double** %".77"
  %".79" = getelementptr inbounds double, double* %".78", i32 0
  %".80" = load double, double* %".79"
  %"z2" = alloca double
  store double %".80", double* %"z2"
  %"h.1" = alloca i32
  %"h_idx.1" = alloca i32
  store i32 0, i32* %"h_idx.1"
  br label %"for.cond.2"
for.cond.1:
  %".22" = load i32, i32* %"p_idx"
  %".23" = icmp slt i32 %".22", 400
  br i1 %".23", label %"for.body.1", label %"for.end.1"
for.body.1:
  store i32 %".22", i32* %"p"
  %".26" = load i32, i32* %"p"
  %".27" = mul i32 %".26", 64
  %".28" = load i32, i32* %"h"
  %".29" = add i32 %".27", %".28"
  %"w1_idx" = alloca i32
  store i32 %".29", i32* %"w1_idx"
  %".31" = load i32, i32* %"base"
  %".32" = load i32, i32* %"p"
  %".33" = add i32 %".31", %".32"
  %"d_idx" = alloca i32
  store i32 %".33", i32* %"d_idx"
  %".35" = load double, double* %"z1_h"
  %".36" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 0
  %".37" = load i32, i32* %"d_idx"
  %".38" = load double*, double** %".36"
  %".39" = getelementptr inbounds double, double* %".38", i32 %".37"
  %".40" = load double, double* %".39"
  %".41" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 1
  %".42" = load i32, i32* %"w1_idx"
  %".43" = load double*, double** %".41"
  %".44" = getelementptr inbounds double, double* %".43", i32 %".42"
  %".45" = load double, double* %".44"
  %".46" = fmul fast double %".40", %".45"
  %".47" = fadd fast double %".35", %".46"
  store double %".47", double* %"z1_h"
  %".49" = load i32, i32* %"p_idx"
  %".50" = add i32 %".49", 1
  store i32 %".50", i32* %"p_idx"
  br label %"for.cond.1"
for.end.1:
  %".53" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 5
  %".54" = load i32, i32* %"h"
  %".55" = load double*, double** %".53"
  %".56" = getelementptr inbounds double, double* %".55", i32 %".54"
  %".57" = load double, double* %"z1_h"
  store double %".57", double* %".56"
  %"a1_h" = alloca double
  store double              0x0, double* %"a1_h"
  %".60" = load double, double* %"z1_h"
  %".61" = fcmp fast ogt double %".60",              0x0
  %".62" = icmp ne i1 %".61", 0
  br i1 %".62", label %"then", label %"end"
then:
  %".64" = load double, double* %"z1_h"
  store double %".64", double* %"a1_h"
  br label %"end"
end:
  %".67" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 6
  %".68" = load i32, i32* %"h"
  %".69" = load double*, double** %".67"
  %".70" = getelementptr inbounds double, double* %".69", i32 %".68"
  %".71" = load double, double* %"a1_h"
  store double %".71", double* %".70"
  %".73" = load i32, i32* %"h_idx"
  %".74" = add i32 %".73", 1
  store i32 %".74", i32* %"h_idx"
  br label %"for.cond"
for.cond.2:
  %".84" = load i32, i32* %"h_idx.1"
  %".85" = icmp slt i32 %".84", 64
  br i1 %".85", label %"for.body.2", label %"for.end.2"
for.body.2:
  store i32 %".84", i32* %"h.1"
  %".88" = load double, double* %"z2"
  %".89" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 6
  %".90" = load i32, i32* %"h.1"
  %".91" = load double*, double** %".89"
  %".92" = getelementptr inbounds double, double* %".91", i32 %".90"
  %".93" = load double, double* %".92"
  %".94" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 3
  %".95" = load i32, i32* %"h.1"
  %".96" = load double*, double** %".94"
  %".97" = getelementptr inbounds double, double* %".96", i32 %".95"
  %".98" = load double, double* %".97"
  %".99" = fmul fast double %".93", %".98"
  %".100" = fadd fast double %".88", %".99"
  store double %".100", double* %"z2"
  %".102" = load i32, i32* %"h_idx.1"
  %".103" = add i32 %".102", 1
  store i32 %".103", i32* %"h_idx.1"
  br label %"for.cond.2"
for.end.2:
  %".106" = load double, double* %"z2"
  %".107" = fsub fast double              0x0, %".106"
  %"neg_z2" = alloca double
  store double %".107", double* %"neg_z2"
  %".109" = load double, double* %"neg_z2"
  %".110" = call double @"exp"(double %".109")
  %".111" = fadd fast double 0x3ff0000000000000, %".110"
  %".112" = fdiv fast double 0x3ff0000000000000, %".111"
  %"a2" = alloca double
  store double %".112", double* %"a2"
  %".114" = load double, double* %"a2"
  ret double %".114"
}

define i32 @"NeuralNet_backward_one"(%"NeuralNet"* %".1", i32 %".2", double %".3", double %".4")
{
entry:
  %"i" = alloca i32
  store i32 %".2", i32* %"i"
  %"a2" = alloca double
  store double %".3", double* %"a2"
  %"label" = alloca double
  store double %".4", double* %"label"
  %".9" = load i32, i32* %"i"
  %".10" = mul i32 %".9", 401
  %"base" = alloca i32
  store i32 %".10", i32* %"base"
  %".12" = load double, double* %"a2"
  %".13" = load double, double* %"label"
  %".14" = fsub fast double %".12", %".13"
  %"d_a2" = alloca double
  store double %".14", double* %"d_a2"
  %"h" = alloca i32
  %"h_idx" = alloca i32
  store i32 0, i32* %"h_idx"
  br label %"for.cond"
for.cond:
  %".18" = load i32, i32* %"h_idx"
  %".19" = icmp slt i32 %".18", 64
  br i1 %".19", label %"for.body", label %"for.end"
for.body:
  store i32 %".18", i32* %"h"
  %".22" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 3
  %".23" = load i32, i32* %"h"
  %".24" = load double*, double** %".22"
  %".25" = getelementptr inbounds double, double* %".24", i32 %".23"
  %".26" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 3
  %".27" = load i32, i32* %"h"
  %".28" = load double*, double** %".26"
  %".29" = getelementptr inbounds double, double* %".28", i32 %".27"
  %".30" = load double, double* %".29"
  %".31" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 7
  %".32" = load double, double* %".31"
  %".33" = load double, double* %"d_a2"
  %".34" = fmul fast double %".32", %".33"
  %".35" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 6
  %".36" = load i32, i32* %"h"
  %".37" = load double*, double** %".35"
  %".38" = getelementptr inbounds double, double* %".37", i32 %".36"
  %".39" = load double, double* %".38"
  %".40" = fmul fast double %".34", %".39"
  %".41" = fsub fast double %".30", %".40"
  store double %".41", double* %".25"
  %".43" = load i32, i32* %"h_idx"
  %".44" = add i32 %".43", 1
  store i32 %".44", i32* %"h_idx"
  br label %"for.cond"
for.end:
  %".47" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 4
  %".48" = load double*, double** %".47"
  %".49" = getelementptr inbounds double, double* %".48", i32 0
  %".50" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 4
  %".51" = load double*, double** %".50"
  %".52" = getelementptr inbounds double, double* %".51", i32 0
  %".53" = load double, double* %".52"
  %".54" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 7
  %".55" = load double, double* %".54"
  %".56" = load double, double* %"d_a2"
  %".57" = fmul fast double %".55", %".56"
  %".58" = fsub fast double %".53", %".57"
  store double %".58", double* %".49"
  %"h.1" = alloca i32
  %"h_idx.1" = alloca i32
  store i32 0, i32* %"h_idx.1"
  br label %"for.cond.1"
for.cond.1:
  %".62" = load i32, i32* %"h_idx.1"
  %".63" = icmp slt i32 %".62", 64
  br i1 %".63", label %"for.body.1", label %"for.end.1"
for.body.1:
  store i32 %".62", i32* %"h.1"
  %"relu_d" = alloca double
  store double              0x0, double* %"relu_d"
  %".67" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 5
  %".68" = load i32, i32* %"h.1"
  %".69" = load double*, double** %".67"
  %".70" = getelementptr inbounds double, double* %".69", i32 %".68"
  %".71" = load double, double* %".70"
  %".72" = fcmp fast ogt double %".71",              0x0
  %".73" = icmp ne i1 %".72", 0
  br i1 %".73", label %"then", label %"end"
for.end.1:
  ret i32 1
then:
  store double 0x3ff0000000000000, double* %"relu_d"
  br label %"end"
end:
  %".77" = load double, double* %"d_a2"
  %".78" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 3
  %".79" = load i32, i32* %"h.1"
  %".80" = load double*, double** %".78"
  %".81" = getelementptr inbounds double, double* %".80", i32 %".79"
  %".82" = load double, double* %".81"
  %".83" = fmul fast double %".77", %".82"
  %".84" = load double, double* %"relu_d"
  %".85" = fmul fast double %".83", %".84"
  %"d_a1_h" = alloca double
  store double %".85", double* %"d_a1_h"
  %"p" = alloca i32
  %"p_idx" = alloca i32
  store i32 0, i32* %"p_idx"
  br label %"for.cond.2"
for.cond.2:
  %".89" = load i32, i32* %"p_idx"
  %".90" = icmp slt i32 %".89", 400
  br i1 %".90", label %"for.body.2", label %"for.end.2"
for.body.2:
  store i32 %".89", i32* %"p"
  %".93" = load i32, i32* %"p"
  %".94" = mul i32 %".93", 64
  %".95" = load i32, i32* %"h.1"
  %".96" = add i32 %".94", %".95"
  %"w1_idx" = alloca i32
  store i32 %".96", i32* %"w1_idx"
  %".98" = load i32, i32* %"base"
  %".99" = load i32, i32* %"p"
  %".100" = add i32 %".98", %".99"
  %"d_idx" = alloca i32
  store i32 %".100", i32* %"d_idx"
  %".102" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 1
  %".103" = load i32, i32* %"w1_idx"
  %".104" = load double*, double** %".102"
  %".105" = getelementptr inbounds double, double* %".104", i32 %".103"
  %".106" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 1
  %".107" = load i32, i32* %"w1_idx"
  %".108" = load double*, double** %".106"
  %".109" = getelementptr inbounds double, double* %".108", i32 %".107"
  %".110" = load double, double* %".109"
  %".111" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 7
  %".112" = load double, double* %".111"
  %".113" = load double, double* %"d_a1_h"
  %".114" = fmul fast double %".112", %".113"
  %".115" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 0
  %".116" = load i32, i32* %"d_idx"
  %".117" = load double*, double** %".115"
  %".118" = getelementptr inbounds double, double* %".117", i32 %".116"
  %".119" = load double, double* %".118"
  %".120" = fmul fast double %".114", %".119"
  %".121" = fsub fast double %".110", %".120"
  store double %".121", double* %".105"
  %".123" = load i32, i32* %"p_idx"
  %".124" = add i32 %".123", 1
  store i32 %".124", i32* %"p_idx"
  br label %"for.cond.2"
for.end.2:
  %".127" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 2
  %".128" = load i32, i32* %"h.1"
  %".129" = load double*, double** %".127"
  %".130" = getelementptr inbounds double, double* %".129", i32 %".128"
  %".131" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 2
  %".132" = load i32, i32* %"h.1"
  %".133" = load double*, double** %".131"
  %".134" = getelementptr inbounds double, double* %".133", i32 %".132"
  %".135" = load double, double* %".134"
  %".136" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 7
  %".137" = load double, double* %".136"
  %".138" = load double, double* %"d_a1_h"
  %".139" = fmul fast double %".137", %".138"
  %".140" = fsub fast double %".135", %".139"
  store double %".140", double* %".130"
  %".142" = load i32, i32* %"h_idx.1"
  %".143" = add i32 %".142", 1
  store i32 %".143", i32* %"h_idx.1"
  br label %"for.cond.1"
}

define double @"NeuralNet_train_one"(%"NeuralNet"* %".1", i32 %".2")
{
entry:
  %"i" = alloca i32
  store i32 %".2", i32* %"i"
  %".5" = load i32, i32* %"i"
  %".6" = call double @"NeuralNet_forward_one"(%"NeuralNet"* %".1", i32 %".5")
  %"a2" = alloca double
  store double %".6", double* %"a2"
  %".8" = load i32, i32* %"i"
  %".9" = mul i32 %".8", 401
  %".10" = add i32 %".9", 400
  %"label_idx" = alloca i32
  store i32 %".10", i32* %"label_idx"
  %".12" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 0
  %".13" = load i32, i32* %"label_idx"
  %".14" = load double*, double** %".12"
  %".15" = getelementptr inbounds double, double* %".14", i32 %".13"
  %".16" = load double, double* %".15"
  %"label" = alloca double
  store double %".16", double* %"label"
  %".18" = load i32, i32* %"i"
  %".19" = load double, double* %"a2"
  %".20" = load double, double* %"label"
  %".21" = call i32 @"NeuralNet_backward_one"(%"NeuralNet"* %".1", i32 %".18", double %".19", double %".20")
  %".22" = load double, double* %"a2"
  ret double %".22"
}

define i32 @"NeuralNet_train"(%"NeuralNet"* %".1")
{
entry:
  %"epoch" = alloca i32
  %"epoch_idx" = alloca i32
  store i32 0, i32* %"epoch_idx"
  br label %"for.cond"
for.cond:
  %".5" = load i32, i32* %"epoch_idx"
  %".6" = icmp slt i32 %".5", 10
  br i1 %".6", label %"for.body", label %"for.end"
for.body:
  store i32 %".5", i32* %"epoch"
  %"i" = alloca i32
  %"i_idx" = alloca i32
  store i32 0, i32* %"i_idx"
  br label %"for.cond.1"
for.end:
  ret i32 1
for.cond.1:
  %".11" = load i32, i32* %"i_idx"
  %".12" = icmp slt i32 %".11", 1000
  br i1 %".12", label %"for.body.1", label %"for.end.1"
for.body.1:
  store i32 %".11", i32* %"i"
  %".15" = load i32, i32* %"i"
  %".16" = call double @"NeuralNet_train_one"(%"NeuralNet"* %".1", i32 %".15")
  %".17" = load i32, i32* %"i_idx"
  %".18" = add i32 %".17", 1
  store i32 %".18", i32* %"i_idx"
  br label %"for.cond.1"
for.end.1:
  %".21" = load i32, i32* %"epoch_idx"
  %".22" = add i32 %".21", 1
  store i32 %".22", i32* %"epoch_idx"
  br label %"for.cond"
}

define i32 @"NeuralNet_test"(%"NeuralNet"* %".1")
{
entry:
  %"correct" = alloca i32
  store i32 0, i32* %"correct"
  %"i" = alloca i32
  %"i_idx" = alloca i32
  store i32 0, i32* %"i_idx"
  br label %"for.cond"
for.cond:
  %".6" = load i32, i32* %"i_idx"
  %".7" = icmp slt i32 %".6", 1000
  br i1 %".7", label %"for.body", label %"for.end"
for.body:
  store i32 %".6", i32* %"i"
  %".10" = load i32, i32* %"i"
  %".11" = call double @"NeuralNet_forward_one"(%"NeuralNet"* %".1", i32 %".10")
  %"a2" = alloca double
  store double %".11", double* %"a2"
  %"pred" = alloca double
  store double              0x0, double* %"pred"
  %".14" = load double, double* %"a2"
  %".15" = fcmp fast ogt double %".14", 0x3fe0000000000000
  %".16" = icmp ne i1 %".15", 0
  br i1 %".16", label %"then", label %"end"
for.end:
  %".43" = load i32, i32* %"correct"
  ret i32 %".43"
then:
  store double 0x3ff0000000000000, double* %"pred"
  br label %"end"
end:
  %".20" = load i32, i32* %"i"
  %".21" = mul i32 %".20", 401
  %".22" = add i32 %".21", 400
  %"label_idx" = alloca i32
  store i32 %".22", i32* %"label_idx"
  %".24" = getelementptr inbounds %"NeuralNet", %"NeuralNet"* %".1", i32 0, i32 0
  %".25" = load i32, i32* %"label_idx"
  %".26" = load double*, double** %".24"
  %".27" = getelementptr inbounds double, double* %".26", i32 %".25"
  %".28" = load double, double* %".27"
  %"label" = alloca double
  store double %".28", double* %"label"
  %".30" = load double, double* %"pred"
  %".31" = load double, double* %"label"
  %".32" = fcmp fast oeq double %".30", %".31"
  %".33" = icmp ne i1 %".32", 0
  br i1 %".33", label %"then.1", label %"end.1"
then.1:
  %".35" = load i32, i32* %"correct"
  %".36" = add i32 %".35", 1
  store i32 %".36", i32* %"correct"
  br label %"end.1"
end.1:
  %".39" = load i32, i32* %"i_idx"
  %".40" = add i32 %".39", 1
  store i32 %".40", i32* %"i_idx"
  br label %"for.cond"
}

@"fmt_17" = constant [4 x i8] c"%f\0a\00"
@"str_18" = constant [54 x i8] c"mnist_project/data/Mnist_Binary_0_vs_1_1000_20x20.csv\00"
@"str_19" = constant [26 x i8] c"mnist_project/data/W1.csv\00"
@"str_20" = constant [26 x i8] c"mnist_project/data/b1.csv\00"
@"str_21" = constant [26 x i8] c"mnist_project/data/W2.csv\00"
@"str_22" = constant [26 x i8] c"mnist_project/data/b2.csv\00"
@"str_23" = constant [26 x i8] c"mnist_project/data/b1.csv\00"
@"str_24" = constant [26 x i8] c"mnist_project/data/b1.csv\00"
@"fmt_25" = constant [4 x i8] c"%d\0a\00"
@"fmt_26" = constant [4 x i8] c"%f\0a\00"