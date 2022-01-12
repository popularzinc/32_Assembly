extern _CreateFileA@28                      ; CreateDirectoryA Windows API Function
extern _ExitProcess@4                       ; ExitProcess Windows API function

                                            ;  HANDLE CreateFileA(
                                            ;    [in]           LPCSTR                lpFileName,
                                            ;    [in]           DWORD                 dwDesiredAccess,
                                            ;    [in]           DWORD                 dwShareMode,
                                            ;    [in, optional] LPSECURITY_ATTRIBUTES lpSecurityAttributes,
                                            ;    [in]           DWORD                 dwCreationDisposition,
                                            ;    [in]           DWORD                 dwFlagsAndAttributes,
                                            ;    [in, optional] HANDLE                hTemplateFile
                                            ;  );

global _main

.data:
  file  db  "test.txt",0                    ; Declare file string

section .text:

_main:                                      ; main function

  push 0                                    ; hTemplateFile           Handler, NULL for no handler
  push 0                                    ; dwFlagsAndAttributes    NULL
  push 2                                    ; dwCreationDisposition   CREATE_ALWAYS
  push 0                                    ; lpSecurityAttributes    NULL
  push 0                                    ; dwShareMode             NULL
  push 0x40000000                           ; dwDesiredAccess         GENERIC_WRITE
  push file                                 ; lpFileName              Filename
  call _CreateFileA@28                      ; call CreateFileA Function

  push 0                                    ; close process cleanly
  call _ExitProcess@4                       ;
