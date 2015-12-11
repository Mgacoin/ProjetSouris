# include "704IO.h"

void mexPortread ( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[] );

//****************************************************************************80

void mexPortread ( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[] )
	mex -setup:'\MATLAB\R2014a\bin\win64\mexopts\msvc2013.xml ' C -client MBUILD
	mcc
{


  return;
