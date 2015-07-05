package perl_amon2_sample::DB::Schema;
use strict;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'perl_amon2_sample::DB::Row';

table {
    name 'member';
    pk 'id';
    columns qw(id name);
};

1;
