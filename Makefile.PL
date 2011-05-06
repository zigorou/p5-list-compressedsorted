use inc::Module::Install;

name 'List-CompressedSorted';
all_from 'lib/List/CompressedSorted.pm';
can_cc or die "This module requires a C compiler";

makemaker_args(
    # OBJECT => '$(O_FILES)',
    clean => +{
        FILES => q{
            *.stackdump
            *.gcov *.gcda *.gcno
            *.out
            nytprof
            cover_db
        },
    },
);

requires 'Exporter';
requires 'XSLoader';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
test_requires 'Test::Requires';

auto_set_repository;
auto_include;
WriteAll;

__END__

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'List::CompressedSorted',
    VERSION_FROM      => 'lib/List/CompressedSorted.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/List/CompressedSorted.pm', # retrieve abstract from module
       AUTHOR         => 'yamaguchi.toru <yamaguchitoru@apple.com>') : ()),
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
);
