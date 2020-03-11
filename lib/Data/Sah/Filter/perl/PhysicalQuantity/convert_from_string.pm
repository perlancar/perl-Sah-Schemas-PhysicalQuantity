package Data::Sah::Filter::perl::PhysicalQuantity::convert_from_string;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 1,
        summary => 'Instantiate Physics::Unit object from string',
        # might_fail => 1, # we'll let Physics::Unit die
    };
}

sub filter {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{modules}{"Physics::Unit"} = 0;
    $res->{expr_filter} = join(
        "",
        "Physics::Unit->new($dt)",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$

=head1 SEE ALSO
