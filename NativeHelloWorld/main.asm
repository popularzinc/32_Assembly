global _main

extern  _GetStdHandle@4           ; GetStdHandle Windows API Function
extern  _WriteFile@20             ; WriteFile Windows API Function
extern  _ExitProcess@4            ; ExitProcess Windows API Function

section .data
  msg  db  "Hello World!",10,0    ; define msg string
  msg_len  equ  $-msg             ; length of msg string

section .text                     ; text section
_main:                            ; main function

;    HANDLE WINAPI GetStdHandle(
;      _In_ DWORD nStdHandle
;    );

  push    -11                     ; push -11 to top of stack STD_OUTPUT_HANDLE
  call    _GetStdHandle@4         ; Call GetStdHandle function
  mov     ebx, eax                ; Output put in eax register, move to ebx register


;    BOOL WriteFile(
;      [in]                HANDLE       hFile,
;      [in]                LPCVOID      lpBuffer,
;      [in]                DWORD        nNumberOfBytesToWrite,
;      [out, optional]     LPDWORD      lpNumberOfBytesWritten,
;      [in, out, optional] LPOVERLAPPED lpOverlapped
;    );

  push    0                       ; lpOverlapped paramater, NULL to ignore
  push    0                       ; lpNumberOfBytesWritten, NULL to ignore
  push    msg_len                 ; nNumberOfBytesToWrite, give length of string to be printed
  push    msg                     ; msg string to be printed
  push    ebx                     ; ebx has the output of GetStdHandle function,
  call    _WriteFile@20           ; Call function

  push    0                       ; close process cleanly
  call    _ExitProcess@4          ;
