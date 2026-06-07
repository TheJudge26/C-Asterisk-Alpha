; ModuleID = "cstar_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

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
  %".2" = call i32 @"mul"(i32 4)
  %"x" = alloca i32
  store i32 %".2", i32* %"x"
  %".4" = load i32, i32* %"x"
  %".5" = getelementptr [4 x i8], [4 x i8]* @"fmt_13", i32 0, i32 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %".4")
  ret i32 0
}

define i32 @"mul"(i32 %".1")
{
entry:
  %"num" = alloca i32
  store i32 %".1", i32* %"num"
  %".4" = load i32, i32* %"num"
  ret i32 %".4"
}

@"fmt_13" = constant [4 x i8] c"%d\0a\00"