package bass;

import hl.Bytes;

enum abstract BassFileType(Int) from Int to Int
{
    var BASS_FILE_NAME = 0;
    var BASS_FILE_MEM = 1;
    // no compatibles
    var BASS_FILE_MEMCOPY = 2;
    var BASS_FILE_HANDLE = 3;
}
enum abstract BassFlag(Int) from Int to Int
{
    var BASS_SAMPLE_8BITS = 1;
    var BASS_SAMPLE_MONO = 2;
    var BASS_SAMPLE_LOOP = 4;
    var BASS_SAMPLE_3D = 8;
    var BASS_SAMPLE_SOFTWARE = 0x10;
    var BASS_SAMPLE_MUTEMAX = 0x20;
    var BASS_SAMPLE_NOREORDER = 0x40;
    var BASS_SAMPLE_FX = 0x80;
    var BASS_SAMPLE_FLOAT = 0x100;
    var BASS_SAMPLE_OVER_VOL = 0x10000;
    var BASS_SAMPLE_OVER_POS = 0x20000;
    var BASS_SAMPLE_OVER_DIST = 0x30000;

    var BASS_STREAM_PRESCAN = 0x20000;
    var BASS_STREAM_AUTOFREE = 0x40000;
    var BASS_STREAM_RESTRATE = 0x80000;
    var BASS_STREAM_BLOCK = 0x100000;
    var BASS_STREAM_DECODE = 0x200000;
    var BASS_STREAM_STATUS = 0x800000;

    var BASS_MP3_IGNOREDELAY = 0x200;
    var BASS_MP3_SETPOS = BASS_STREAM_PRESCAN;

    var BASS_MUSIC_FLOAT = BASS_SAMPLE_FLOAT;
    var BASS_MUSIC_MONO = BASS_SAMPLE_MONO;
    var BASS_MUSIC_LOOP = BASS_SAMPLE_LOOP;
    var BASS_MUSIC_3D = BASS_SAMPLE_3D;
    var BASS_MUSIC_FX = BASS_SAMPLE_FX;
    var BASS_MUSIC_AUTOFREE = BASS_STREAM_AUTOFREE;
    var BASS_MUSIC_DECODE = BASS_STREAM_DECODE;
    var BASS_MUSIC_PRESCAN = BASS_STREAM_PRESCAN;
    var BASS_MUSIC_CALCLEN = BASS_MUSIC_PRESCAN;
    var BASS_MUSIC_RAMP = 0x200;
    var BASS_MUSIC_RAMPS = 0x400;
    var BASS_MUSIC_SURROUND = 0x800;
    var BASS_MUSIC_SURROUND2 = 0x1000;
    var BASS_MUSIC_FT2PAN = 0x2000;
    var BASS_MUSIC_FT2MOD = 0x2000;
    var BASS_MUSIC_PT1MOD = 0x4000;
    var BASS_MUSIC_NONINTER = 0x10000;
    var BASS_MUSIC_SINCINTER = 0x800000;
    var BASS_MUSIC_POSRESET = 0x8000;
    var BASS_MUSIC_POSRESETEX = 0x400000;
    var BASS_MUSIC_STOPBACK = 0x80000;
    var BASS_MUSIC_NOSAMPLE = 0x100000;

    var BASS_SPEAKER_FRONT = 0x1000000;
    var BASS_SPEAKER_REAR = 0x2000000;
    var BASS_SPEAKER_CENLFE = 0x3000000;
    var BASS_SPEAKER_SIDE = 0x4000000;
    var BASS_SPEAKER_LEFT = 0x10000000;
    var BASS_SPEAKER_RIGHT = 0x20000000;
    var BASS_SPEAKER_FRONTLEFT = BASS_SPEAKER_FRONT | BASS_SPEAKER_LEFT;
    var BASS_SPEAKER_FRONTRIGHT = BASS_SPEAKER_FRONT | BASS_SPEAKER_RIGHT;
    var BASS_SPEAKER_REARLEFT = BASS_SPEAKER_REAR | BASS_SPEAKER_LEFT;
    var BASS_SPEAKER_REARRIGHT = BASS_SPEAKER_REAR | BASS_SPEAKER_RIGHT;
    var BASS_SPEAKER_CENTER = BASS_SPEAKER_CENLFE | BASS_SPEAKER_LEFT;
    var BASS_SPEAKER_LFE = BASS_SPEAKER_CENLFE | BASS_SPEAKER_RIGHT;
    var BASS_SPEAKER_SIDELEFT = BASS_SPEAKER_SIDE | BASS_SPEAKER_LEFT;
    var BASS_SPEAKER_SIDERIGHT = BASS_SPEAKER_SIDE | BASS_SPEAKER_RIGHT;
    var BASS_SPEAKER_REAR2 = BASS_SPEAKER_SIDE;
    var BASS_SPEAKER_REAR2LEFT = BASS_SPEAKER_SIDELEFT;
    var BASS_SPEAKER_REAR2RIGHT = BASS_SPEAKER_SIDERIGHT;

    var BASS_ASYNCFILE = 0x40000000;
    var BASS_UNICODE = 0x80000000;

    var BASS_RECORD_OPENSLES = 0x1000;
    var BASS_RECORD_PAUSE = 0x8000;
}

@:access(String)
@:publicFields
abstract NativeString(hl.Bytes) from hl.Bytes to hl.Bytes {
	@:from inline static function fromString(s:String):NativeString {
		return s.toUtf8();
	}

	@:to inline function toString():String {
		return String.fromUTF8(this);
	}
}

typedef BassHStream = Int;

@:hlNative("hlbass")
class BASS
{
    public static function init(device:Int, freq:Int, flags:BassFlag):Bool
        return false;

    public static function error_getcode():Int
        return 0;


    public static function bfree():Bool
        return false;

    public static function channel_play(handle:BassHStream, restart:Bool):Bool
        return false;

    public static function channel_pause(handle:BassHStream):Bool
        return false;

    public static function channel_stop(handle:BassHStream):Bool
        return false;

    public static function channel_setattribute(handle:BassHStream, attrib:Int, value:Single):Bool
        return false;

    public static function channel_getposition(handle:BassHStream, mode:Int):Single
        return 0;

    public static function channel_bytes2seconds(handle:BassHStream, pos:Single):Float
        return 0;

    public static function stream_createfile(filetype:BassFileType, file:Bytes, offset:Int, length:Int, flags:BassFlag):BassHStream
        return 0;

    public static function mixer_addchannel(handle:BassHStream, channel:Int, flags:BassFlag):Bool
        return false;

    public static function mixer_streamcreate(freq:Int, chans:Int, flags:BassFlag):BassHStream
        return 0;
}