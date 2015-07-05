package perl_amon2_sample;
use strict;
use warnings;
use utf8;
our $VERSION='0.01';
use 5.008001;
use perl_amon2_sample::DB::Schema;
use perl_amon2_sample::DB;

use parent qw/Amon2/;
# Enable project local mode.
__PACKAGE__->make_local_context();

my $schema = perl_amon2_sample::DB::Schema->instance;

sub db {
    my $c = shift;
    if (!exists $c->{db}) {
        my $conf = $c->config->{DBI}
            or die "Missing configuration about DBI";
        $c->{db} = perl_amon2_sample::DB->new(
            schema       => $schema,
            connect_info => [@$conf],
            # I suggest to enable following lines if you are using mysql.
            # on_connect_do => [
            #     'SET SESSION sql_mode=STRICT_TRANS_TABLES;',
            # ],
        );
    }
    $c->{db};
}

1;
__END__

=head1 NAME

perl_amon2_sample - perl_amon2_sample

=head1 DESCRIPTION

This is a main context class for perl_amon2_sample

=head1 AUTHOR

perl_amon2_sample authors.

