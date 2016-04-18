VER=            1.4e


# Path to the ssh binary, edit to fit your needs:
SSH=            /system/xbin/ssh

# Edit the compiler name to fit your needs
CC=             arm-linux-gnueabi-gcc

CFLAGS=         -g -O2 -Wall -DVER=\"$(VER)\" -DSSH_PATH=\"$(SSH)\" -static
CPPFLAGS=


LD=             @LD@
LDFLAGS=
# Dirty hack, feel free to improve (I'm a nulity doing makefiles):
LIBS=           -lnsl -static

SRCDIR=         .


OFILES=         autossh.o
TARGET=         autossh


all:		$(TARGET)

$(TARGET):	$(OFILES)
		$(CC) $(CPPFLAGS) -o $(TARGET) $(OFILES) $(LIBS)

clean:
	- /bin/rm -f *.o *.a *.core *~
	- /bin/rm -f $(TARGET)

allclean:	clean
distclean:	clean
mrproper:	clean
