package;

import bass.BASS;
import sys.io.File;

class Main {
    static function main() {
        var mixerSts:Bool = BASS.init(-1, 44100, 0);
        if (!mixerSts) {
            trace("Failed to load mixer");
            BASS.bfree();
        }

        var hndl:Int = BASS.mixer_streamcreate(44100, 2, 0);
        trace("mixer: " + hndl);

        var instBytes = File.getBytes("inst.ogg");
        var inst:Int = BASS.stream_createfile(BASS_FILE_MEM, hl.Bytes.fromBytes(instBytes), 0, instBytes.length, BASS_STREAM_DECODE);
        trace("inst: " + inst);

        var voicesBytes = File.getBytes("voices.ogg");
        var vocal:Int = BASS.stream_createfile(BASS_FILE_MEM, hl.Bytes.fromBytes(voicesBytes), 0, voicesBytes.length, BASS_STREAM_DECODE);
        trace("vocal: " + inst);

        BASS.mixer_addchannel(hndl, inst, 0);
        BASS.mixer_addchannel(hndl, vocal, 0);
        
        BASS.channel_play(hndl, true);
        trace("error: " + BASS.error_getcode());

        while (true)
        {
            var bytes = BASS.channel_getposition(hndl, 0);
            var scnds = BASS.channel_bytes2seconds(hndl, bytes);

            Sys.println(scnds);
        }
    }
}