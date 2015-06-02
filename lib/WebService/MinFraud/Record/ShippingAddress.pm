package WebService::MinFraud::Record::ShippingAddress;

use strict;
use warnings;

our $VERSION = '0.001001';

use Sub::Quote qw( quote_sub );
use WebService::MinFraud::Types qw( Bool BoolCoercion Num);

use Moo;

has distance_to_billing_address => (
    is  => 'ro',
    isa => Num,
);

has distance_to_ip_location => (
    is  => 'ro',
    isa => Num,
);

has is_high_risk => (
    is      => 'ro',
    isa     => Bool,
    default => quote_sub(q{ 0 }),
    coerce  => BoolCoercion,
);

has is_in_ip_country => (
    is      => 'ro',
    isa     => Bool,
    default => quote_sub(q{ 0 }),
    coerce  => BoolCoercion,
);

has is_postal_in_city => (
    is      => 'ro',
    isa     => Bool,
    default => quote_sub(q{ 0 }),
    coerce  => BoolCoercion,
);

has latitude => (
    is  => 'ro',
    isa => Num,
);

has longitude => (
    is  => 'ro',
    isa => Num,
);

1;

# ABSTRACT: Contains data for the shipping address record associated with a transaction

__END__

=head1 SYNOPSIS

  use 5.010;
  use WebService::MinFraud::Client;

  my $client = WebService::MinFraud::Client->new(
      user_id     => 42,
      license_key => 'abcdef123456',
  );
  my $request = { device => { ip_address => '24.24.24.24'} };
  my $insights = $client->insights( $request);
  my $shipping_address_rec = $insights->shipping_address;
  say $shipping_address_rec->distance_to_ip_location;

=head1 DESCRIPTION

This class contains the shipping address data associated with a transaction.

This record is returned by the insights end point.

=head1 METHODS

This class provides the following methods:

=head2 distance_to_billing_address

The distance from the shipping address to the billing address.

=head2 distance_to_ip_location

The distance from the shipping address to the location of the IP address.

=head2 is_in_ip_country

A boolean indicating whether or not the shipping address is in the same country
as that of the IP address.

=head2 latitude

The latitude of the shipping address

=head2 longitude

The longitude of the shipping address

