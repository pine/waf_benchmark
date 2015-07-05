use strict;
use warnings;
use Test::More;


use perl_amon2_sample;
use perl_amon2_sample::Web;
use perl_amon2_sample::Web::View;
use perl_amon2_sample::Web::ViewFunctions;

use perl_amon2_sample::DB::Schema;
use perl_amon2_sample::Web::Dispatcher;


pass "All modules can load.";

done_testing;
