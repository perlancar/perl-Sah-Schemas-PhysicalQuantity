package Sah::Schema::physical::distance;

# AUTHORITY
# DATE
# DIST
# VERSION

use Physics::Unit; # for examples

our $schema = [obj => {
    summary => 'A physical distance',
    isa => 'Physics::Unit',
    prefilters => ['PhysicalQuantity::convert_from_str', ['PhysicalQuantity::check_type', {is=>'Distance'}]],
    examples => [
        {
            value   => '10 m',
            valid   => 1,
            validated_value => Physics::Unit->new("10 m"),
        },
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
