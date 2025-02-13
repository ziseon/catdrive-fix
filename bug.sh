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
��abug.sh ��o�Tǟ�_q�M��ɲNL�"�Jc��&qg�f�v�T{�^`�+��6��!��N �F�������N���Ά�f?\����=��sm|b���O�Z����Y���+�UG��:��StY<W(��y�ۻ����g������~vn��m��~���㎳s�y�������/���b^Xr��Σ�ޟ�:{��/�g?�z��F�Ef������wq~.֛(u�w\O��07�	��ug�fgo�����`�=c	� T���7�Т�17����K���߽0�h	R���Q�H*v��'Z�E�6%��HW��:���Lx�1�&z6�j��4T��O@��LQ8U7�N�:�^AMް5��_�{��;t�@�+�m"ۦ���nY�6�x������?�Y���Vz���j�
G&N&�u��t����ś2�aYҸEFoB�zh&2��̠dɜ����Y�'-��ZΨ�ɲ�i(N�ñ-b��\/#W�AfS��61yM��8<�1�Wt�s�./���Q�Ph�f"rM�F�c������>���>ԩNH�Ϙ�o��5��ڔ���V�� G�!H��
�_�WW�哫�VXv�&VX�vjh�V�*���D�T�P�*eѷ�'�Ƙ|Ub7شʒm�r����B�Mp�R�O<�{dL�H���,i�ʒ�d��ؒV�O��*���rե���r3I4�M�ëV�D2n"�Iu�ʰ����gI�e�ވ�rc��{��Lɲ�H)��	��%Ӡ_�X��o�a����r���<ؿ�t�{��l����Mg�Q�?(a>�S����ļ��e�,ȵ\� ���"��(���n�k���]($��݅�n�J�Nt�!�W��w6�{�F"��� ���g�mw�~�����}��6m��н�ݻ�ѽ���z������e>��?s���-]0�+R�Q]Q"��]�B�R��z��ѻĜ�%�$��H}$���R_�H=#���3R�H=#���S�z�)d����KBu��bhݷ� ��<&�ڿ}Q��c��p쇼t�N�q�����@��Y<�]���	����'�����*�������x:������;"���Cw0Q<�O���@����>����\�'��p,�O
���aϠ;���ǁ�,V�>�$  