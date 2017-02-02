CXX     = g++
CFLAGS  = -g -O2 $(shell pkg-config --cflags MagickWand)
LIBS    = $(shell pkg-config --libs MagickWand) -lX11
TARGETS	= tty2gif

UNAME	= $(shell uname -s)
ifeq ($(UNAME), Darwin)
	CXX     = clang++
	CFLAGS += -I/opt/X11/include -L/opt/X11/lib
endif

tty2gif: tty2gif.cpp
	${CXX} ${CFLAGS} -o $@ $^ ${LIBS}

clean:
	rm -f ${TARGETS}
