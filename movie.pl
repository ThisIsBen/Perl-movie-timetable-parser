use strict;
use LWP::Simple;
use HTML::TreeBuilder;
use 5.010;
use encoding "utf-8";
#binmode(STDIN, ':encoding(utf8)');
#binmode(STDOUT, ':encoding(utf8)');
##binmode(STDERR, ':encoding(utf8)');
binmode(STDOUT, ":utf8");

print "Which Theater's Movie timetable would you like to see?\n";
print"Enter 1 for: 台南國賓影城\nEnter 2 for: 台南新光影城\nEnter 3 for: 台南威秀影城\n";
my $theater=<>;
my $URL;

if($theater==1)
{
	 $URL = get("http://www.atmovies.com.tw/showtime/theater_t06608_a06.html");
}
if($theater==2)
{
	 $URL = get("http://www.atmovies.com.tw/showtime/theater_t06607_a06.html");
}
if($theater==3)
{
	 $URL = get("http://www.atmovies.com.tw/showtime/theater_t06609_a06.html");
}


my $root = HTML::TreeBuilder->new_from_content($URL);




my @div_class = $root->find_by_attribute("class","showtime_box");


my $counter=0;#to control the  ":" of time print out.
foreach my $node (@div_class) 
 {
        #print film name
		my @a_class=$node->look_down(_tag => 'a');
		
		
		print $a_class[0]->as_text() , "\n"; 
		
	
		my @time_class=$node->look_down(_tag => 'UL');
		
		
		#print timetable
		foreach my $time (@time_class) 
		{
			
				 my $char;
				 
				 foreach $char (split //, $time->as_text())
				{
					 $counter=$counter+1;
					 
					 print "$char";

					 

			if($theater==3)
			{
				
			  


							 if($counter==6)
								 {

									$counter=0;
									 
									print "\n";# newline
									

								 }

			}
			else
			{
							 if($counter==5)
								 {$counter=0;

									print "\n";# newline
								 }
			}
					
								  
		}
					
	}
					
					
				
}


<>;
