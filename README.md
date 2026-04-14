# hlBASS

Minimal hashlink native extension for BASS and BASS-MIX.

## Dependencies

### Compiler

You'll need MSYS2 + MinGW — grab them at https://www.msys2.org/

### BASS / BASS-MIX

Can't include these here (copyright), so download them manually from https://www.un4seen.com/ and drop them in `lib/`

You'll need:

**Headers:** `bass.h`, `bassmix.h`

**DLLs / Libs:** `bass.dll`, `bass.lib`, `bassmix.dll`, `bassmix.lib`

## Compiling

Open your MSYS2 terminal, run the makefile in this folder, and you'll get `hlbass.hdll` + `hlbass.lib`. Move both to your Hashlink folder and you're good to go