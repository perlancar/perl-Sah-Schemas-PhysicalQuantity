package Sah::Schema::physical::mass;

# AUTHORITY
# DATE
# DIST
# VERSION

use Physics::Unit; # for examples

our $schema = [obj => {
    summary => 'A physical mass quantity',
    isa => 'Physics::Unit',
    prefilters => ['PhysicalQuantity::convert_from_str', ['PhysicalQuantity::check_type', {is=>'Mass'}]],
    examples => [
        #{
        #    value   => '10 kg',
        #    valid   => 1,
        #    validated_value => Physics::Unit->new("10 kg"),
        #},
        {
            value   => '10 s',
            valid   => 0,
        },
        {
            value   => '10',
            valid   => 0,
        },
    ],
}, {}];

1;
# ABSTRACT:
