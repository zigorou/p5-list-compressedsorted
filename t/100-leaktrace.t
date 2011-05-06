use blib;
use Test::Requires { 'Test::LeakTrace' => 0.13 };
use Test::More;
use List::CompressedSorted;

no_leaks_ok {
    List::CompressedSorted::compress_int_array([1, 10, 100, 1000]);
} 'compress_int_array() is not leak';

no_leaks_ok {
    List::CompressedSorted::decompress_int_array([1, 9, 90, 900]);
} 'decompress_int_array() is not leak';

done_testing;
