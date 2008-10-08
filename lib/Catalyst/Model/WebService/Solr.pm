package Catalyst::Model::WebService::Solr;

use strict;
use warnings;

use base qw( WebService::Solr Catalyst::Model );

our $VERSION = '0.01';

=head1 NAME

Catalyst::Model::WebService::Solr - Use WebService::Solr in your Catalyst application

=head1 SYNOPSIS

    package MyApp::Model::Solr;
    
    use base qw( Catalyst::Model::WebService::Solr );
    
    __PACKAGE__->config(
        server  => 'http://localhost:8080/solr/',
        options => {
            autocommit => 1,
        }
    );

=head1 DESCRIPTION

This module helps you use remote indexes via WebService::Solr in your
Catalyst application.

=head1 METHODS

=head2 COMPONENT( )

passes your config options to L<WebService::Solr>'s C<new> method.

=cut

sub COMPONENT {
    my ( $class, $c, $config ) = @_;
    my $self = $class->new( $config->{ server }, ( $config->{ options } || {} ) );

    $self->config( $self->merge_config_hashes( $self->config, $config ) );

    return $self;
}

=head1 SEE ALSO

=over 4

=item * L<Catalyst>

=item * L<WebService::Solr>

=back

=head1 AUTHOR

Brian Cassidy E<lt>bricas@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut

1;
