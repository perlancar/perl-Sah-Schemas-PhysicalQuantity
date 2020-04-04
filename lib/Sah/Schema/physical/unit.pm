package Sah::Schema::physical::unit;

# AUTHORITY
# DATE
# DIST
# VERSION

use Physics::Unit ();

our $schema = [str => {
    summary => 'A physical unit',
    description => <<'_',

All units recognized by <pm:Physics::Unit> are valid.

_
    in => [Physics::Unit::ListUnits()],
    examples => [
        {value=>"", valid=>0},
        {value=>"kg", valid=>1},
        {value=>"foo", valid=>0},
    ],
}, {}];

1;
# ABSTRACT:
