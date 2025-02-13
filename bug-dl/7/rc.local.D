#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�2��`rc.local.D �MKQ���+NS��C�"Z�DX�A���銷�#�\�R��@�Bh]Q����M�Ъ�Ќ�ƺ�,B��8x���9�=3�C�6V�Aj���R�,��|_w+��ɑS�~�*�6���3g��Y������#��<�6*�΅sy#JӨ:W���|���+ǒ ��������#�dd��F?�D��wJ}IMkf �0�S��v�aN��Xt�_�$&#	>��aV�:ִ��7V�0-�¶n�6����vDda�yV;�K��l���eA a3��g����@�r��$*Q�L�~&�I4�4J�^ !�C��YB�L�`���F�����p�R�Ok�X0x�ԩRY�����tB �@1i�NL�;'(�40'��׉�u�7�����H�,,�<#S�M{��Y��Ӵ��W��(�
��F[%H4C-�ZHt�ψ۬Ri�M�ܵ]��X��=�WRU:-�LeL��t� �gܘ�  