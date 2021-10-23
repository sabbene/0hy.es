package Ohyes::Controller::Tides;

use Mojo::Base 'Mojolicious::Controller', -signatures;
use Ohyes::Tides;

use DateTime;
use Storable qw(store retrieve);

# This action will render a template
sub init ($self) {
    my $forecast_storable_file = '/tmp/forecast_storable_file';
    my $now                    = time;

    my $forecasts;
    my $updated_time;

    if ( -e $forecast_storable_file ) {

        my $mtime = ( stat $forecast_storable_file )[9];
        my $delta = $now - $mtime;

        if ( $delta < 1800 ) {
            $forecasts    = retrieve $forecast_storable_file;
            $updated_time = $mtime;
        }
        else {
            $forecasts    = Ohyes::Tides->get_forecasts;
            $updated_time = $now;

            store( $forecasts, $forecast_storable_file );
        }
    }
    else {
        $forecasts    = Ohyes::Tides->get_forecasts;
        $updated_time = $now;

        store( $forecasts, $forecast_storable_file );
    }

    my $dt = DateTime->from_epoch(
        epoch     => $updated_time,
        time_zone => $ENV{TZ}
    );
    my $updated_time_string = $dt->strftime('%Y-%m-%d %H:%M:%S %Z');

    # Render template "index/init.html.ep" with message
    $self->render( %{$forecasts}, updated_time => $updated_time_string );
}

1;
