package Kwiki::Cache;
use strict;
use warnings;
use Kwiki::Plugin '-Base';
use Digest::MD5;
our $VERSION = '0.10';

const class_id => 'cache';

sub process {
    my $closure = shift;
    my $cache_name = Digest::MD5::md5_hex(join '!@#$', @_);
    my $path = $self->plugin_directory;
    my $io = io->catfile($path, $cache_name)->assert;
    unless (-f "$io") {
        &$closure > $io;
        $io->close;
    }
    $io->scalar;
}

1;
__DATA__

=head1 NAME 

Kwiki::Cache - Kwiki Cache Plugin

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 AUTHOR

Brian Ingerson <ingy@cpan.org>

=head1 COPYRIGHT

Copyright (c) 2004. Brian Ingerson. All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See http://www.perl.com/perl/misc/Artistic.html

=cut
