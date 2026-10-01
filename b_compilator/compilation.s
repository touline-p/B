.intel_syntax noprefix
.text
.global main
main:
push ebp
mov ebp, esp
sub esp, 4
push 1
push 1
pop ebx
pop eax
cmp eax, ebx
setne al

movzx eax, al
pop eax
cmp eax, 0
je else_main_0_start
push 1
pop eax
jmp end_main
jmp else_main_0_end
else_main_0_start:
else_main_0_end:
push 0
pop eax
jmp end_main
end_main:
mov esp, ebp
pop ebp
ret
