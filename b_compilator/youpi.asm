.intel_syntax noprefix
.text
.globl main
main:
    push ebp                    
    mov ebp, esp                

    sub esp, 4                  
    mov dword ptr [ebp - 4], 3
    mov eax, dword ptr [ebp - 4]
    push eax                    
    call f                      
    add esp, 4                  
    
    mov esp, ebp    
    pop ebp                    
    ret                         

f:
    mov eax, 0
    ret
