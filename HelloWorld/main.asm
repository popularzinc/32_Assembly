global  _main
extern _ExitProcess@4
extern _printf

section .text

.data:
  hw  db  "Hello World!", 10, 0

_main:
  push    hw
  call    _printf

  push 0
  call _ExitProcess@4
