extern _CreateDirectoryA@8                                ; CreateDirectoryA Windows API Function
extern _ExitProcess@4                                     ; ExitProcess Windows API function

                                    ;  BOOL CreateDirectoryA(
                                    ;    [in]           LPCSTR                lpPathName,
                                    ;    [in, optional] LPSECURITY_ATTRIBUTES lpSecurityAttributes
                                    ;  );

global _main                                              ;

.data:                                                    ; data section
  Folder  db  "Test",0                                    ; define Folder string

section .text:                                            ; Text section

_main:                                                    ; Main function
  push 0                     ; lpSecurityAttributes       ; Push NULL to ignore Security Attributes
  push Folder                ; lpPathName                 ; Push Folder string
  call _CreateDirectoryA@8                                ; Call CreateDirectoryA Funciton

  push 0                                                  ; Push NULL
  call _ExitProcess@4                                     ; Close process
