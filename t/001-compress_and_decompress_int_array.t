use blib;
use Test::More;
use List::CompressedSorted;

sub c { List::CompressedSorted::compress_int_array(shift) }
sub d { List::CompressedSorted::decompress_int_array(shift) }

subtest 'compress_int_array()' => sub {
    is_deeply(c([]), [], 'empty');
    is_deeply(c([100]), [100], 'int[1]');
    is_deeply(c([1, 10, 100, 1000]), [1, 9, 90, 900], '10**n');
    is_deeply(c([1, 3, 7, 13, 21, 31]), [ 1, 2, 4, 6, 8, 10], '2n + 1');
};

subtest 'decompress_int_array()' => sub {
    is_deeply(d([]), [], 'empty');
    is_deeply(d([100]), [100], 'int[1]');
    is_deeply(d([1, 9, 90, 900]), [1, 10, 100, 1000], '10**n');
    is_deeply(d([ 1, 2, 4, 6, 8, 10]), [1, 3, 7, 13, 21, 31], '2n + 1');
};

done_testing;
