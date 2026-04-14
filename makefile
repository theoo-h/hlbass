HL_DIR      = $(HASHLINK)
LIB_DIR     = $(CURDIR)/lib

INCLUDES    = -I$(HL_DIR)/include -I$(LIB_DIR)
LIBS        = -L$(HL_DIR) -L$(LIB_DIR) -lhl -lbass -lbassmix

hlbass.hdll: hlbass.cpp
	gcc -shared -o $@ $< $(INCLUDES) $(LIBS) -Wl,--out-implib,hlbass.lib