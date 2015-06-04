package WebService::MinFraud::Data::Rx::Type::RFC3987;

use 5.010;

use strict;
use warnings;

our $VERSION = '0.001001';

use Carp ();
use IRI;

use parent 'Data::Rx::CommonType::EasyNew';

sub type_uri {
    ## no critic(ValuesAndExpressions::ProhibitCommaSeparatedStatements)
    'tag:maxmind.com,MAXMIND:rx/rfc3987';
}

sub guts_from_arg {
    my ( $class, $arg, $rx ) = @_;
    $arg ||= {};

    if ( my @unexpected = keys %$arg ) {
        Carp::croak sprintf 'Unknown arguments %s in constructing %s',
            ( join ',' => @unexpected ), $class->type_uri;
    }

    return {};
}

sub assert_valid {
    my ( $self, $value ) = @_;

    my @labels = split /\./, $value;
    return 1
        if $value
        && eval {
        my $scheme = IRI->new( value => $value )->scheme;
        return ( $scheme eq 'http' || $scheme eq 'https' );
        };

    $self->fail(
        {
            error   => [qw(type)],
            message => 'Found value is not a valid URI (RFC3987).',
            value   => $value,
        }
    );
}

1;
__END__

=head1 SYNOPSIS

NEED ONE

=head1 DESCRIPTION

A type to check if a value is a valid URI per RFC3987

=head1 METHODS

=head2 assert_valid

=head2 guts_from_arg

=head2 type_uri
