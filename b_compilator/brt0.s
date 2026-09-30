    # brt0.s - runtime B minimal (x86-32, Linux, ELF, syscalls via int 0x80)
    # Assemblage: gcc -m32 -c -x assembler brt0.s -o brt0.o
    # Linkage:    ld -m elf_i386 <objets B...> brt0.o -o <programme>

    .text
    .globl _start
    .globl syscall

_start:
    xor     %ebp, %ebp          # marque la fin de la chaine de frames pour gdb/backtrace
    mov     (%esp), %ecx        # ecx = argc  (le noyau depose argc au sommet de la pile)
    lea     4(%esp), %edx       # edx = &argv[0]

    push    %edx                # arg2 (argv) - convention cdecl : push droite -> gauche
    push    %ecx                # arg1 (argc)
    call    main
    add     $8, %esp            # cdecl : l'appelant nettoie la pile

    mov     %eax, %ebx          # code de retour de main() -> code de sortie
    mov     $1, %eax            # sys_exit
    int     $0x80
    hlt                         # jamais atteint

    # word syscall(nb, a, b, c, d, e, f);
    # Appel bas niveau générique vers le noyau Linux (jusqu'a 6 arguments).
    # Le résultat brut du noyau est renvoyé tel quel (peut être négatif = -errno).
syscall:
    push    %ebx
    push    %esi
    push    %edi
    push    %ebp
    # apres ces 4 push : [esp+16]=retour, [esp+20]=nb, [esp+24]=a, ...
    mov     20(%esp), %eax      # nb
    mov     24(%esp), %ebx      # a
    mov     28(%esp), %ecx      # b
    mov     32(%esp), %edx      # c
    mov     36(%esp), %esi      # d
    mov     40(%esp), %edi      # e
    mov     44(%esp), %ebp      # f
    int     $0x80
    pop     %ebp
    pop     %edi
    pop     %esi
    pop     %ebx
    ret
