#define HL_NAME(n) hlbass_ ##n

#include <hl.h>
#include <bass.h>
#include <bassmix.h>

#define HL_HSTREAM _ABSTRACT(HSTREAM)

// bass
HL_PRIM bool HL_NAME(init)(int device, int freq, int flags)
{
    return BASS_Init(device, freq, flags, NULL, NULL);
}

HL_PRIM int HL_NAME(error_getcode)()
{
    return BASS_ErrorGetCode();
}

HL_PRIM bool HL_NAME(bfree)()
{
    return BASS_Free();
}

// channel
HL_PRIM bool HL_NAME(channel_play)(int handle, bool restart)
{
    return BASS_ChannelPlay(handle, restart);
}

HL_PRIM bool HL_NAME(channel_pause)(int handle)
{
    return BASS_ChannelPause(handle);
}

HL_PRIM bool HL_NAME(channel_stop)(int handle)
{
    return BASS_ChannelStop(handle);
}

HL_PRIM float HL_NAME(channel_getposition)(int handle, int mode)
{
    return BASS_ChannelGetPosition(handle, mode);
}

HL_PRIM double HL_NAME(channel_bytes2seconds)(int handle, float pos)
{
    return BASS_ChannelBytes2Seconds(handle, pos);
}

HL_PRIM bool HL_NAME(channel_setattribute)(int handle, int attrib, float value) 
{
    return BASS_ChannelSetAttribute(handle, attrib, value);
}

// stream
HL_PRIM int HL_NAME(stream_createfile)(int filetype, vbyte* file, int offset, int length, int flags)
{
    return BASS_StreamCreateFile((DWORD)filetype, (void*)file, (QWORD)offset, (QWORD)length, (DWORD)flags);
}
// mixer
HL_PRIM bool HL_NAME(mixer_addchannel)(int handle, int channel, int flags)
{
    return BASS_Mixer_StreamAddChannel(handle, channel, flags);
}

HL_PRIM int HL_NAME(mixer_streamcreate)(int freq, int chans, int flags)
{
    return BASS_Mixer_StreamCreate(freq, chans, flags);
}

DEFINE_PRIM(_BOOL, init, _I32 _I32 _I32);
DEFINE_PRIM(_I32, error_getcode, _NO_ARG);

DEFINE_PRIM(_BOOL, bfree, _NO_ARG);

DEFINE_PRIM(_BOOL, channel_play, _I32 _BOOL);
DEFINE_PRIM(_BOOL, channel_pause, _I32);
DEFINE_PRIM(_BOOL, channel_stop, _I32);

DEFINE_PRIM(_BOOL, channel_setattribute, _I32 _I32 _F32);

DEFINE_PRIM(_F32, channel_getposition, _I32 _I32);

DEFINE_PRIM(_F64, channel_bytes2seconds, _I32 _F32);

DEFINE_PRIM(_I32, stream_createfile, _I32 _BYTES _I32 _I32 _I32);

DEFINE_PRIM(_BOOL, mixer_addchannel, _I32 _I32 _I32);
DEFINE_PRIM(_I32, mixer_streamcreate, _I32 _I32 _I32);