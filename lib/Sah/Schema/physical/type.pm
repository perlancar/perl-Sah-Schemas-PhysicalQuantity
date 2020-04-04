package Sah::Schema::physical::type;

# AUTHORITY
# DATE
# DIST
# VERSION

use Physics::Unit ();

our $schema = [str => {
    summary => 'A physical type (e.g. Mass, Distance)',
    description => <<'_',

All types recognized by <pm:Physics::Unit> are valid.

_
    in => [Physics::Unit::ListTypes()],
    examples => [
        {value=>"", valid=>0},
        {value=>"Mass", valid=>1},
        {value=>"Love", valid=>0},
    ],
}, {}];

1;
# ABSTRACT:
