// Test704.cpp : Defines the entry point for the console application.
#define _AFXDLL
//#define  _tprintf mexPrintf
#include "StdAfx.h"
#include "704IO.h"
#include "Test704.h"
#include "mex.h"
#include "matrix.h"
#ifdef _DEBUG
  #define new DEBUG_NEW
#endif
/////////////////////////////////////////////////////////////////////////////

CWinApp theApp;  // The one and only application object

/////////////////////////////////////////////////////////////////////////////

using namespace std;

/////////////////////////////////////////////////////////////////////////////
//int _tmain(int argc, TCHAR *argv[], TCHAR *envp[])
int _tmain(double port[], double rack[], double offset[])
{
//HMODULE hModule(::GetModuleHandle(NULL));
double  valueRead;
//short port;
//short rack;
//short offset;

  //if (hModule != NULL)
  //{
  //  // Initialize MFC and print and error on failure
  //  if (!AfxWinInit(hModule, NULL, ::GetCommandLine(), 0))
  //  {
  //    _tprintf(_T("Fatal Error: MFC initialization failed\n"));
  //  }
  //  else
  //  {
  //    //while(true)
  //    //{
  //      valueRead = PortRead(1, 780, -1);
        valueRead = PortRead(port[0], rack[0], offset[0]);
        //mexPrintf("Value Read = %i\n",valueRead);
		mexPrintf("Value Read = %g\n",valueRead);
  //      //Sleep(1);  // Sleep for 1s so we can see the value on the screen
  //    //}
  //  }
  //}
  //else
  //{
  //  _tprintf(_T("Fatal Error: GetModuleHandle failed\n"));
  //}  
return valueRead;
}

///////////////////////////////////////////////////////////////////////////
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *port, *rack, *offset;
    // Creates a 1-by-1 real integer. 
    //plhs[0] = mxCreateNumericMatrix(1, 1, mxINT32_CLASS, mxREAL);
   //plhs[0] = mxCreateNumericMatrix(1, 1, mxINT32_CLASS, mxREAL);
	//plhs[0] = mxCreateDoubleScalar( _tmain(port,rack,offset) );

    //int* data = (int*) mxGetData(plhs[0]); 
    port = mxGetPr(prhs[0]);
    rack = mxGetPr(prhs[1]);
    offset = mxGetPr(prhs[2]);
    //valueRead = mxGetPr(plhs[0]);

    //data[0]=_tmain(0,0,0); 
    //return ;
	plhs[0] = mxCreateDoubleScalar( _tmain(port,rack,offset) );
	int* data = (int*) mxGetData(plhs[0]); 
	return;

}