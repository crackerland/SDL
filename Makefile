# Makefile to build the SDL library
CC = arm-none-eabi-gcc
AS = arm-none-eabi-gcc
LD = arm-none-eabi-gcc
AR = arm-none-eabi-ar
INCLUDE = -I./include
CFLAGS  = -g -O2 $(INCLUDE) -fno-short-enums \
	-mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s \
	-D__BCM2835__ -DLACKS_SYS_MMAN_H -DHAVE_MALLOC

RANLIB	= ranlib

TARGET  = lib/libSDL2.a

SOURCES = \
	src/*.c \
	src/atomic/*.c \
	src/audio/*.c \
	src/audio/dummy/*.c \
	src/cpuinfo/*.c \
	src/events/*.c \
	src/file/*.c \
	src/haptic/*.c \
	src/haptic/dummy/*.c \
	src/hidapi/*.c \
	src/joystick/*.c \
	src/joystick/dummy/*.c \
	src/loadso/dummy/*.c \
	src/power/*.c \
	src/filesystem/dummy/*.c \
	src/locale/*.c \
	src/locale/dummy/*.c \
	src/misc/*.c \
	src/misc/dummy/*.c \
	src/render/*.c \
	src/render/software/*.c \
	src/sensor/*.c \
	src/sensor/dummy/*.c \
	src/stdlib/*.c \
	src/libm/*.c \
	src/thread/*.c \
	src/thread/generic/*.c \
	src/timer/*.c \
	src/timer/dummy/*.c \
	src/video/*.c \
	src/video/yuv2rgb/*.c \
	src/video/dummy/*.c

OBJECTS = $(shell echo $(SOURCES) | sed -e 's,\.c,\.o,g')

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(AR) crv $@ $^
	$(RANLIB) $@

clean:
	rm -f $(TARGET) $(OBJECTS)
