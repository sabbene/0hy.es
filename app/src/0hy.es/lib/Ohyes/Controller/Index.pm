package Ohyes::Controller::Index;
use Mojo::Base 'Mojolicious::Controller', -signatures;

# This action will render a template
sub welcome ($self) {

    # Render template "index/welcome.html.ep" with message
    $self->render( color => 'green' );
}

1;
