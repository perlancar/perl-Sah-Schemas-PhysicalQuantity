package Sah::Schema::physical::mass_in_kg;

# AUTHORITY
# DATE
# DIST
# VERSION

use Physics::Unit; # for examples

our $schema = [obj => {
    summary => 'A physical mass quantity, in kg',
    isa => 'Physics::Unit',
    prefilters => [
        'PhysicalQuantity::convert_from_str',
        ['PhysicalQuantity::check_type', {is=>'Mass'}],
        ['PhysicalQuantity::convert_unit', {to=>'kg'}],
    ],
    examples => [
        #{
        #    value   => '10 kg',
        #    valid   => 1,
        #    validated_value => Physics::Unit->new("10 kg"),
        #},
        #{
        #    value   => '1 tonne',
        #    valid   => 1,
        #    validated_value => Physics::Unit->new("1000 kg"),
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
