
// MFCApplication1.h : fichier d'en-tête principal pour l'application MFCApplication1
//
#pragma once

#ifndef __AFXWIN_H__
	#error "incluez 'stdafx.h' avant d'inclure ce fichier pour PCH"
#endif

#include "resource.h"       // symboles principaux


// CMFCApplication1App:
// Consultez MFCApplication1.cpp pour l'implémentation de cette classe
//

class CMFCApplication1App : public CWinAppEx
{
public:
	CMFCApplication1App();


// Substitutions
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();

// Implémentation
	UINT  m_nAppLook;
	BOOL  m_bHiColorIcons;

	virtual void PreLoadState();
	virtual void LoadCustomState();
	virtual void SaveCustomState();

	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CMFCApplication1App theApp;
