#! /bin/sh -e
rm -rf autom4te.cache
aclocal -I m4
autoheader
if [ "$LIBTOOLIZE" = "" ] && [ "`uname`" = "Darwin" ]; then
  LIBTOOLIZE=glibtoolize --copy
else
  LIBTOOLIZE=libtoolize
fi
"$LIBTOOLIZE" --copy
automake --add-missing --copy
autoconf
