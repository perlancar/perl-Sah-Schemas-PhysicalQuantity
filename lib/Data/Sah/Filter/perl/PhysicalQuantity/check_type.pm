package Data::Sah::Filter::perl::PhysicalQuantity::check_type;

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
        summary => "Check that physical quantity if of certain type(s)",
        might_fail => 1,
        args => {
            is => {
                schema => 'str*',
            },
            in => {
                schema => ['array*', of=>'str*'],
            },
        },
    };
}

sub filter {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    my @check_exprs;
    if (defined $gen_args->{is}) {
        push @check_exprs, (@check_exprs ? "elsif" : "if") . " (\$pqtype eq ".dmp($gen_args->{is}).qq| {) ["Physical quantity type must be " . |.dmp($gen_args->{is}).qq|, \$tmp] } |;
    }
    if (defined $gen_args->{in}) {
        push @check_exprs, (@check_exprs ? "elsif" : "if") . " (grep { \$pqtype eq \$_ } @{ ".dmp($gen_args->{in}).qq| }) { ["Physical quantity type must be one of " . join(", ", @{|.dmp($gen_args->{iin}).qq|}), \$tmp] } |;
    }
    unless (@check_exprs) {
        push @check_exprs, qq(if (0) { } );
    }
    my $res = {};
    $res->{expr_filter} = join(
        "",
        "do {",
        "    my \$tmp = $dt; ",
        "    my \$pqtype = \$tmp->type; ",
        @check_exprs,
        "    else { [undef, \$tmp] } ",
        "}",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$
