package perl_amon2_sample::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;
use JSON::Types;

use perl_amon2_sample::Web::C::Benchmark;
base 'perl_amon2_sample::Web::C';

any '/benchmark/simple' => 'Benchmark#simple';
any '/benchmark/cpu' => 'Benchmark#cpu';

1;
