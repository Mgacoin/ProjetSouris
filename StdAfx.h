// StdAfx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently

#pragma once

#include "TargetVer.h"

#include <StdIO.h>
#include <TChar.h>

#define _ATL_CSTRING_EXPLICIT_CONSTRUCTORS  // Some CString constructors will be explicit
#define _AFX_NO_MFC_CONTROLS_IN_DIALOGS     // Remove support for MFC controls in dialogs

#ifndef VC_EXTRALEAN
#define VC_EXTRALEAN                        // Exclude rarely-used stuff from Windows headers
#endif

#include <Afx.h>
#include <AfxWin.h>                         // MFC core and standard components
#include <AfxExt.h>                         // MFC extensions

#ifndef _AFX_NO_OLE_SUPPORT
  #include <AfxDTCtl.h>                     // MFC support for Internet Explorer 4 Common Controls
#endif

#ifndef _AFX_NO_AFXCMN_SUPPORT
  #include <AfxCmn.h>                       // MFC support for Windows Common Controls
#endif  // _AFX_NO_AFXCMN_SUPPORT

#include <IOStream>


// TODO: reference additional headers your program requires here
