use warnings;
use strict;
use Module::Build;

my $requires = {
    perl => '>=5.10.0',
    Catmandu => 0,  
    'Text::Markdown::Discount' => 0
};
my $recommends = {};
my $build = Module::Build->new(

    module_name => 'Catmandu-Markdown',
    dist_version_from => 'lib/Catmandu/Markdown.pm',
    dist_author => [qw(
        nicolas.franck@ugent.be
    )],
    dist_abstract => 'Catmandu for working with markdown data',
    requires => $requires,
    recommends => $recommends,
    create_license => 1

);
$build->create_build_script();
