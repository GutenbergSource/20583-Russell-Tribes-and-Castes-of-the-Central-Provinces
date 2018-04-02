# Process the TCCPI as a single file.

use strict;

my $toolsdir    = 'D:\\Users\\Jeroen\\Documents\\eLibrary\\Tools\\tei2html\\tools'; # location of tools
my $xsldir      = $toolsdir . '\\..';                                               # location of xsl stylesheets
my $saxon       = 'java -jar ' . $toolsdir . '\\lib\\saxon9he.jar ';

sub main()  {
    processVolume("TCCPI-1", "TCCPI-1-1.0.tei");
    processVolume("TCCPI-2", "TCCPI-2-1.0.tei");
    processVolume("TCCPI-3", "TCCPI-3-1.0.tei");
    processVolume("TCCPI-4", "TCCPI-4-1.0.tei");

    print "Create complete XML version...\n";
    system ("$saxon TCCPI-Complete.xsl TCCPI-Complete.xsl > TCCPI-Complete.xml");

    system ("perl -S tei2html.pl -h -r TCCPI-Complete.xml");
}

sub processVolume($) {
    my $dir = shift;
    my $file = shift;
    chdir "$dir";
    system ("perl -S tei2html.pl -x " . $file);
    chdir "..";
}

main();