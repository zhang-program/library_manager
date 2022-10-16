; 该脚本使用 HM VNISEdit 脚本编辑器向导产生

!include "LogicLib.nsh"

; 安装程序初始定义常量
!define PRODUCT_NAME "图书管理系统"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\search_ui.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

SetCompressor lzma

; ------ MUI 现代界面定义 (1.67 版本以上兼容) ------
!include "MUI.nsh"

; MUI 预定义常量
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; 语言选择窗口常量设置
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; 欢迎页面
!insertmacro MUI_PAGE_WELCOME
; 许可协议页面
!insertmacro MUI_PAGE_LICENSE "..\test.txt"
; 安装目录选择页面
!insertmacro MUI_PAGE_DIRECTORY
; 安装过程页面
!insertmacro MUI_PAGE_INSTFILES
; 安装完成页面
!define MUI_FINISHPAGE_RUN "$INSTDIR\search_ui.exe"
!insertmacro MUI_PAGE_FINISH

; 安装卸载过程页面
!insertmacro MUI_UNPAGE_INSTFILES

; 安装界面包含的语言设置
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"

; 安装预释放文件
!insertmacro MUI_RESERVEFILE_LANGDLL
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
; ------ MUI 现代界面定义结束 ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Setup.exe"
InstallDir "$PROGRAMFILES\图书管理系统"
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString"
ShowInstDetails show
ShowUnInstDetails show

; 激活安装日志记录，该日志文件将会作为卸载文件的依据(注意，本区段必须放置在所有区段之前)
Section "-LogSetOn"
  LogSet on
SectionEnd

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "dist\search_ui\search_ui.exe"
  CreateDirectory "$SMPROGRAMS\图书管理系统"
  CreateShortCut "$SMPROGRAMS\图书管理系统\图书管理系统.lnk" "$INSTDIR\search_ui.exe"
  CreateShortCut "$DESKTOP\图书管理系统.lnk" "$INSTDIR\search_ui.exe"
  File /r "dist\search_ui\*.*"
  File /r "dist\search_ui\cryptography\*.*"
  File /r "dist\search_ui\cryptography-3.3.1-py3.7.egg-info\*.*"
  File /r "dist\search_ui\Include\*.*"
  File "dist\search_ui\api-ms-win-core-console-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-datetime-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-debug-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-errorhandling-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-file-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-file-l1-2-0.dll"
  File "dist\search_ui\api-ms-win-core-file-l2-1-0.dll"
  File "dist\search_ui\api-ms-win-core-handle-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-heap-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-interlocked-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-libraryloader-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-localization-l1-2-0.dll"
  File "dist\search_ui\api-ms-win-core-memory-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-namedpipe-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-processenvironment-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-processthreads-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-processthreads-l1-1-1.dll"
  File "dist\search_ui\api-ms-win-core-profile-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-rtlsupport-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-string-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-synch-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-synch-l1-2-0.dll"
  File "dist\search_ui\api-ms-win-core-sysinfo-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-timezone-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-core-util-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-crt-conio-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-crt-convert-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-crt-environment-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-crt-filesystem-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-crt-heap-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-crt-locale-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-crt-math-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-crt-process-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-crt-runtime-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-crt-stdio-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-crt-string-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-crt-time-l1-1-0.dll"
  File "dist\search_ui\api-ms-win-crt-utility-l1-1-0.dll"
  File "dist\search_ui\base_library.zip"
  File "dist\search_ui\icudt58.dll"
  File "dist\search_ui\icuin58.dll"
  File "dist\search_ui\icuuc58.dll"
  File "dist\search_ui\libcrypto-1_1-x64.dll"
  File "dist\search_ui\libjpeg.dll"
  File "dist\search_ui\libpng16.dll"
  File "dist\search_ui\libssl-1_1-x64.dll"
  File "dist\search_ui\MSVCP140.dll"
  File "dist\search_ui\opengl32sw.dll"
  File "dist\search_ui\pyexpat.pyd"
  File "dist\search_ui\python3.dll"
  File "dist\search_ui\python37.dll"
  File "dist\search_ui\Qt5Core.dll"
  File "dist\search_ui\Qt5Gui.dll"
  File "dist\search_ui\Qt5Network.dll"
  File "dist\search_ui\Qt5Qml.dll"
  File "dist\search_ui\Qt5Quick.dll"
  File "dist\search_ui\Qt5Svg.dll"
  File "dist\search_ui\Qt5Widgets.dll"
  File "dist\search_ui\search_ui.exe.manifest"
  File "dist\search_ui\select.pyd"
  File "dist\search_ui\sip.pyd"
  File "dist\search_ui\ucrtbase.dll"
  File "dist\search_ui\unicodedata.pyd"
  File "dist\search_ui\VCRUNTIME140.dll"
  File "dist\search_ui\VCRUNTIME140_1.dll"
  File "dist\search_ui\zlib.dll"
  File "dist\search_ui\_bz2.pyd"
  File "dist\search_ui\_cffi_backend.cp37-win_amd64.pyd"
  File "dist\search_ui\_decimal.pyd"
  File "dist\search_ui\_hashlib.pyd"
  File "dist\search_ui\_lzma.pyd"
  File "dist\search_ui\_socket.pyd"
  File "dist\search_ui\_ssl.pyd"
  File /r "dist\search_ui\PyQt5\*.*"
SectionEnd

Section -AdditionalIcons
  CreateShortCut "$SMPROGRAMS\图书管理系统\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\search_ui.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\search_ui.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
SectionEnd

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

/******************************
 *  以下是安装程序的卸载部分  *
 ******************************/

; 根据安装日志卸载文件的调用宏
!macro DelFileByLog LogFile
  ifFileExists `${LogFile}` 0 +4
    Push `${LogFile}`
    Call un.DelFileByLog
    Delete `${LogFile}`
!macroend

Section Uninstall

  ; 调用宏只根据安装日志卸载安装程序自己安装过的文件
  !insertmacro DelFileByLog "$INSTDIR\install.log"

  ; 清除安装程序创建的且在卸载时可能为空的子目录，对于递归添加的文件目录，请由最内层的子目录开始清除(注意，不要带 /r 参数，否则会失去 DelFileByLog 的意义)
  RMDir "$SMPROGRAMS\图书管理系统"
  RMDir "$INSTDIR\Qt\translations"
  RMDir "$INSTDIR\Qt\plugins"
  RMDir "$INSTDIR\Qt"
  RMDir "$INSTDIR\PyQt5\Qt"
  RMDir "$INSTDIR\PyQt5\Library"
  RMDir "$INSTDIR\PyQt5"
  RMDir "$INSTDIR\Library\bin"
  RMDir "$INSTDIR\Library"
  RMDir "$INSTDIR\Include"
  RMDir "$INSTDIR\hazmat\bindings"
  RMDir "$INSTDIR\hazmat"
  RMDir "$INSTDIR\cryptography-3.3.1-py3.7.egg-info"
  RMDir "$INSTDIR\cryptography\hazmat"
  RMDir "$INSTDIR\cryptography"

  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#

Function un.onInit
!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "您确实要完全移除 $(^Name) ，及其所有的组件？" IDYES +2
  Abort
FunctionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) 已成功地从您的计算机移除。"
FunctionEnd

; 以下是卸载程序通过安装日志卸载文件的专用函数，请不要随意修改
Function un.DelFileByLog
  Exch $R0
  Push $R1
  Push $R2
  Push $R3
  FileOpen $R0 $R0 r
  ${Do}
    FileRead $R0 $R1
    ${IfThen} $R1 == `` ${|} ${ExitDo} ${|}
    StrCpy $R1 $R1 -2
    StrCpy $R2 $R1 11
    StrCpy $R3 $R1 20
    ${If} $R2 == "File: wrote"
    ${OrIf} $R2 == "File: skipp"
    ${OrIf} $R3 == "CreateShortCut: out:"
    ${OrIf} $R3 == "created uninstaller:"
      Push $R1
      Push `"`
      Call un.DelFileByLog.StrLoc
      Pop $R2
      ${If} $R2 != ""
        IntOp $R2 $R2 + 1
        StrCpy $R3 $R1 "" $R2
        Push $R3
        Push `"`
        Call un.DelFileByLog.StrLoc
        Pop $R2
        ${If} $R2 != ""
          StrCpy $R3 $R3 $R2
          Delete /REBOOTOK $R3
        ${EndIf}
      ${EndIf}
    ${EndIf}
    StrCpy $R2 $R1 7
    ${If} $R2 == "Rename:"
      Push $R1
      Push "->"
      Call un.DelFileByLog.StrLoc
      Pop $R2
      ${If} $R2 != ""
        IntOp $R2 $R2 + 2
        StrCpy $R3 $R1 "" $R2
        Delete /REBOOTOK $R3
      ${EndIf}
    ${EndIf}
  ${Loop}
  FileClose $R0
  Pop $R3
  Pop $R2
  Pop $R1
  Pop $R0
FunctionEnd

Function un.DelFileByLog.StrLoc
  Exch $R0
  Exch
  Exch $R1
  Push $R2
  Push $R3
  Push $R4
  Push $R5
  StrLen $R2 $R0
  StrLen $R3 $R1
  StrCpy $R4 0
  ${Do}
    StrCpy $R5 $R1 $R2 $R4
    ${If} $R5 == $R0
    ${OrIf} $R4 = $R3
      ${ExitDo}
    ${EndIf}
    IntOp $R4 $R4 + 1
  ${Loop}
  ${If} $R4 = $R3
    StrCpy $R0 ""
  ${Else}
    StrCpy $R0 $R4
  ${EndIf}
  Pop $R5
  Pop $R4
  Pop $R3
  Pop $R2
  Pop $R1
  Exch $R0
FunctionEnd
