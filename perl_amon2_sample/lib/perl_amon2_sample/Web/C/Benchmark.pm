package perl_amon2_sample::Web::C::Benchmark;
use strict;
use warnings;
use utf8;

use Amon2::Web::Dispatcher::RouterBoom;
use JSON::Types;

sub _prime {
    my ($class, $max) = @_;

	my @table = (0) x $max;
	my $i_max = sqrt($max) + 2;

	return -1 if $max < 3;

	# init table
	$table[0] = $table[1] = 1; # 0 & 1 is not prime number

	# make table
    for (my $i = 2; $i < $i_max; $i++) {
        if (!$table[$i]) {
            for (my $j = $i + $i; $j < $max; $j += $i) {
				$table[$j] = 1;
            }
        }
    }

	# search
	for (my $i = $max - 1; $i < $max; $i--) {
		if (!$table[$i]) {
			return $i;
		}
	}

    return -1;
}

sub simple {
    my ($class, $c) = @_;
    return $c->render_json({
        ok        => bool 1,
        language  => string 'Perl',
        framework => string 'Amon2',
    });
}

sub cpu {
    my ($class, $c) = @_;
    my $max = $c->request->parameters->{max};

    return $c->render_json({
        ok     => bool 1,
        max    => number $max,
        result => number $class->_prime($max),
    });
}

1;
