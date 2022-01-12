extern _MessageBoxA@16                        ; External MessageBoxA Windows API function
                                              ; @16 for 4 variables times 4, 16 bytes

                                              ;  int MessageBoxA(
                                              ;    [in, optional] HWND    hWnd,
                                              ;    [in, optional] LPCTSTR lpText,
                                              ;    [in, optional] LPCTSTR lpCaption,
                                              ;    [in]           UINT    uType
                                              ;  );

global  _main                                 ;

.data:                                        ; data secion
  title         db  "This is the title",0     ; create string, title
  body          db  "This is the body",0      ; create string, body
                                              ; dont forget ,0 or null byte

section .text                                 ; text section

_main:                                        ; main function
  push 0                ;    uType            ; push 0 for MB_OK
  push body             ;    lpCaption        ; push body string
  push title            ;    lpText           ; push title string
  push 0                ;    hWnd             ; push 0, this is for handle, can be 0 and ignored
  call _MessageBoxA@16                        ; call _MessageBoxA function
