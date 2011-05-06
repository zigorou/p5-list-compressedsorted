package List::CompressedSorted;

use strict;
use warnings;
use Exporter qw(import);
use XSLoader;

our $VERSION = '0.01';
our %EXPORT_TAGS = (
    all => [qw/compress_int_array decompress_int_array/],
);
our @EXPORT_OK = @{$EXPORT_TAGS{all}};
our @EXPORT    = ();

XSLoader::load(__PACKAGE__, $VERSION);

1;

__END__

=head1 NAME

List::CompressedSorted - write short description for List::CompressedSorted

=head1 SYNOPSIS

  use List::CompressedSorted;

=head1 DESCRIPTION

=head1 METHODS

=head1 AUTHOR

Toru Yamaguchi E<lt>zigorou@dena.jp<gt>

=head1 LICENSE

This module is licensed under the same terms as Perl itself.

=head1 SEE ALSO

=cut

# Local Variables:
# mode: perl
# perl-indent-level: 4
# indent-tabs-mode: nil
# coding: utf-8-unix
# End:
#
# vim: expandtab shiftwidth=4:
