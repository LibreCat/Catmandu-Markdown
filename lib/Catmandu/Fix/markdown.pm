package Catmandu::Fix::markdown;
use Catmandu::Sane;
use Moo;
use Catmandu::Util qw(:is :check);
use Text::Markdown::Discount;

has field => (
  is => 'ro' , 
  required => 1
);
around BUILDARGS => sub {
  my($orig,$class,$field) = @_;
  $orig->($class,field => $field);
};

sub emit {
  my($self,$fixer) = @_;

  my $perl = "";  

  my $field = $fixer->split_path($self->field());
  my $key = pop @$field;

  $perl .= $fixer->emit_walk_path($fixer->var,$field,sub{
    my $var = shift;
    $fixer->emit_get_key($var,$key, sub {
      my $var = shift;
      "${var} = is_string(${var}) ? Text::Markdown::Discount::markdown(${var}) : \"\";";  
    });
  });

  $perl;
}

=head1 NAME

  Catmandu::Fix::markdown

=head1 SYNOPSIS

  markdown('timestamp')

=head1 SEE ALSO

L<Catmandu::Fix>

=cut

1;
