.intel_syntax noprefix
.text
.global main
main:
push ebp
mov ebp, esp
sub esp, 4
push 10
pop eax
mov dword ptr[ebp -4], eax
push eax
pop eax
while_main_0_start:
mov eax, dword ptr[ebp -4]
push eax
pop eax
cmp eax, 0
je while_main_0_end
mov eax, dword ptr[ebp -4]
push eax
push 1
pop ebx
pop eax
sub eax, ebx
push eax
pop eax
mov dword ptr[ebp -4], eax
push eax
pop eax
jmp while_main_0_start
while_main_0_end:
mov eax, dword ptr[ebp -4]
push eax
pop eax
jmp end_main
end_main:
mov esp, ebp
pop ebp
ret
