package Sah::Schema::physical::quantity;

# AUTHORITY
# DATE
# DIST
# VERSION

use Physics::Unit; # for examples

our $schema = [obj => {
    summary => 'A physical quantity',
    isa => 'Physics::Unit',
    prefilters => ['PhysicalQuantity::convert_from_str'],
    examples => [
        {
            value   => '10 m',
            valid   => 1,
            validated_value => Physics::Unit->new("10 m"),
        },
    ],
}, {}];

1;
# ABSTRACT:
