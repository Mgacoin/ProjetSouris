// 704IO.h : export header file for the 704IO DLL
//

#pragma once

extern "C" short WINAPI EXPORT PortRead(short Rack, short Port, short Offset);
extern "C" void WINAPI EXPORT PortWrite(short Rack, short Port, short Offset, short Value);