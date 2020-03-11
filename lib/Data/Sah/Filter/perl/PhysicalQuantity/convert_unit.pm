package Data::Sah::Filter::perl::PhysicalQuantity::convert_unit;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

use Data::Dmp;

sub meta {
    +{
        v => 1,
        summary => 'Convert quantity to another unit',
        # might_fail => 1, # we'll let Physics::Unit die on its own
        args => {
            to => {
                schema => 'str*', # XXX physical::unit
                req => 1,
            },
        },
    };
}

sub filter {
    my %args = @_;

    my $dt = $args{data_term};
    my $gen_args = $args{args} // {};

    my $res = {};

    $res->{modules}{"Physics::Unit"} = 0;
    $res->{expr_filter} = join(
        "",
        "Physics::Unit->new( $dt->convert(".dmp($gen_args->{to}).") . ' ' . ".dmp($gen_args->{to})." )",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$

=head1 SEE ALSO
