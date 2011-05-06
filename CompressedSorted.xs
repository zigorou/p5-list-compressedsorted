#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#ifndef INLINE
#define INLINE __inline
#endif

INLINE void compress_sorted_int_array(int *in, int *out, int size) {
  int i;
  *out = *in;
  for ( i = 1; i < size; i++ )
    *( out + i ) = *( in + i ) - *( in + i - 1 );
}

INLINE void decompress_sorted_int_array(int *in, int *out, int size) {
  int i;
  *out = *in;
  for ( i = 1; i < size; i++ )
    *( out + i ) = *( in + i ) + *( out + i - 1 );
}

MODULE = List::CompressedSorted    PACKAGE = List::CompressedSorted		

AV *compress_int_array(in)
  AV *in;
PREINIT:
CODE:
  AV *out = newAV();
  sv_2mortal((SV *) out);
  I32 length = av_len(in);

  if (length >= 0) {
    int *in_array, *out_array, i;
    New(0, in_array, sizeof(int) * ( length + 1 ), int);
    New(0, out_array, sizeof(int) * ( length + 1 ), int);

    for ( i = 0; i <= length; i++ ) {
      *(in_array + i) = (int) SvIVx(*av_fetch( in, i, 0 ));
    }

    compress_sorted_int_array(in_array, out_array, length + 1);

    for ( i = 0; i <= length; i++ ) {
      av_store(out, i, newSViv(*(out_array + i)));
    }

    Safefree(in_array);
    Safefree(out_array);
  }

  RETVAL = out;
OUTPUT:
  RETVAL
CLEANUP:

AV *decompress_int_array(in)
  AV *in;
PREINIT:
CODE:
  AV *out = newAV();
  sv_2mortal(out);
  I32 length = av_len(in);

  if ( length >= 0 ) {
    int *in_array, *out_array, i;
    New(0, in_array, sizeof(int) * ( length + 1 ), int);
    New(0, out_array, sizeof(int) * ( length + 1 ), int);

    for ( i = 0; i <= length; i++ ) {
      *(in_array + i) = (int) SvIVx(*av_fetch( in, i, 0 ));
    }

    decompress_sorted_int_array(in_array, out_array, length + 1);

    for ( i = 0; i <= length; i++ ) {
      av_store(out, i, newSViv(*(out_array + i)));
    }

    Safefree(in_array);
    Safefree(out_array);
  }

  RETVAL = out;
OUTPUT:
  RETVAL
CLEANUP:
