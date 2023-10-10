=for comment based on iup-3.2
 
=head1 NAME
 
IUP - Cross-platform GUI toolkit for building graphical user interfaces
 
=head1 DESCRIPTION
 
The IUP module is a cross-platform GUI toolkit designed to run on
B<MS Windows> (incl. Cygwin), B<GTK+> and B<Motif/X11>.
On all platform it uses native GUI widgets.
 
=begin html
 
<p>
  <table border="1">
    <tbody align="center">
      <tr>
        <th>GTK</th>
        <th>Windows Vista</th>
      </tr>
      <tr>      
        <td><img src="http://kmx.github.io/perl-iup/spec/sample_gtk_small.png"></td>
        <td><img src="http://kmx.github.io/perl-iup/spec/sample_vista_small.png"></td>
      </tr>
    </tbody>
  </table>
<p>  
  <table border="1">
    <tbody align="center">
      <tr>
        <th>Motif</th>
        <th>Windows Classic</th>
      </tr>
      <tr>      
        <td><img src="http://kmx.github.io/perl-iup/spec/sample_mot_small.png"></td>
        <td><img src="http://kmx.github.io/perl-iup/spec/sample_win2k_small.png"></td>
      </tr>
    </tbody>
  </table>
</p>
 
=end html
 
B<Source code:> see L<1-apps/app-sample1.pl|https://metacpan.org/source/KMX/IUP-0.305/examples//1-apps/app-sample1.pl>
 
=head2 IUP's Strengths
 
=over
 
=item * B<Portability:> The same GUI application written in perl
works on Windows and UNIX systems.
 
=item * B<Small and Simple API:> This is rare. Many libraries assume
that a GUI toolkit is also a synonymous with a system abstraction
and accumulate a bunch of extra functions and/or classes that are not
related to User Interface.
 
=item * B<Easy to Learn:> The learning curve for a new IUP user is often
faster due to the small number of functions and to IUP's
L<attributes concept|IUP::Manual::01_Introduction/"Attributes Concept"> which makes a lot of
things more elegant and simpler to understand.
 
=item * B<Native Look & Feel:> Many toolkits draw their own controls.
This gives an uniformity among systems, but also a disparity among the
available applications in the same system. Native controls are also
faster because they are drawn by the system.
 
=item * B<Exhaustive Documentation:> Which is not so common by other
perl GUI toolkits. Good starting points are L<IUP|IUP> and L<IUP::Manual::01_Introduction>.
 
=item * B<Advanced Visualization Elements:> Thanks to IUP'S academic origin
it has several fairly advanced GUI elemts handy for visualisation of scientific
data (L<IUP::PPlot|IUP::PPlot>, L<IUP::Matrix|IUP::Matrix>) and 2D
drawing (L<IUP::Canvas|IUP::Canvas>).
 
=back
 
=head2 IUP's Background
 
IUP perl module is based on the following libraries delivered by
B<Tecgraf - Computer Graphics Technology Group, PUC-Rio, Brazil>
L<http://www.tecgraf.puc-rio.br/iup|http://www.tecgraf.puc-rio.br>:
 
=over
 
=item * iup library - see L<http://www.tecgraf.puc-rio.br/iup/|http://www.tecgraf.puc-rio.br/iup/>
 
=item * im library  - see L<http://www.tecgraf.puc-rio.br/im/|http://www.tecgraf.puc-rio.br/im/>
 
=item * cd library  - see L<http://www.tecgraf.puc-rio.br/cd/|http://www.tecgraf.puc-rio.br/cd/>
 
=back
 
There is no need to install them before installing L<IUP|IUP> module;
they are handled by separate L<Alien::IUP|Alien::IUP> module.
 
=head1 QUICK START
 
At this point we show just basic ideas behind IUP based GUI applications.
For more details see L<IUP::Manual::01_Introduction|IUP::Manual::01_Introduction>.
Or if you wanna skip the theory you can go directly to L<examples|https://metacpan.org/source/KMX/IUP-0.305/examples/>
directory of IUP distribution.
 
=head2 Simple GUI Dialogs
 
 use IUP ':all';
 
 my ($ret, $b, $i, $a, $s, $l, $f, $c) = IUP->GetParam(
   "Simple Dialog Title", undef,
   #define dialog controls
   "Boolean: %b[No,Yes]{Boolean Tip}\n".
   "Integer: %i[0,255]{Integer Tip 2}\n".
   "Angle: %a[0,360]{Angle Tip}\n".
   "String: %s{String Tip}\n".
   "List: %l|item1|item2|item3|{List Tip}\n".
   "File: %f[OPEN|*.bmp;*.jpg|CURRENT|NO|NO]{File Tip}\n".
   "Color: %c{Color Tip}\n",
   #set default values
   1, 100, 45, 'test string', 2, 'test.jpg', '255 0 128'
 );
  
 IUP->Message("Results",
   "Boolean:\t$b\n".
   "Integer:\t$i\n".
   "Angle:\t$a\n".
   "String:\t$s\n".
   "List Index:\t$l\n".
   "File:\t$f\n".
   "Color:\t$c\n"
 ) if $ret;
 
=begin html
 
<p>
  <table border="1">
    <tbody align="center">
      <tr>
        <th>Application</th>
        <th>After "OK"</th>
      </tr>
      <tr>      
        <td><img src="http://kmx.github.io/perl-iup/spec/app_simple1.png"></td>
        <td><img src="http://kmx.github.io/perl-iup/spec/app_simple2.png"></td>
      </tr>
    </tbody>
  </table>
</p>
 
=end html
 
All functions from this category:
L<Alarm|/"Alarm()">,
L<GetFile|/"GetFile()">,
L<GetColor|/"GetColor()">,
L<GetParam|/"GetParam()">,
L<GetText|/"GetText()">,
L<ListDialog|/"ListDialog()">,
L<Message|Message> - see L<simple GUI dialogs|/"Simple GUI dialogs"> section.
 
=head2 Pre-defined Dialogs
 
 use IUP ':all';
  
 my $dlg = IUP::ColorDlg->new( VALUE=>"128 0 255", ALPHA=>"142",
                               SHOWHEX=>"YES", SHOWCOLORTABLE=>"YES",
                               TITLE=>"IUP::ColorDlg Test" );
 
 $dlg->Popup(IUP_CENTER, IUP_CENTER); 
 
 IUP->Message("Chosen color", "Color:\t" . $dlg->VALUE) if $dlg->STATUS;
 
=begin html
 
<p>
  <table border="1">
    <tbody align="center">
      <tr>
        <th>Application</th>
        <th>After "OK"</th>
      </tr>
      <tr>      
        <td><img src="http://kmx.github.io/perl-iup/spec/app_predefined1.png"></td>
        <td><img src="http://kmx.github.io/perl-iup/spec/app_predefined2.png"></td>
      </tr>
    </tbody>
  </table>
</p>
 
=end html
 
=for comment generated list - predefined dialogs
 
All pre-defined dialogs supported by IUP:
L<IUP::ColorDlg|IUP::ColorDlg>,
L<IUP::FileDlg|IUP::FileDlg>,
L<IUP::FontDlg|IUP::FontDlg>,
L<IUP::MessageDlg|IUP::MessageDlg>.
 
=head2 Custom Dialogs
 
 use IUP ':all';
  
 # demo callback handler
 sub my_cb {
   my $self = shift;
   IUP->Message("Hello from callback handler");
 }
  
 # create the main dialog
 sub init_dialog {
   my $menu = IUP::Menu->new( child=>[
                IUP::Item->new(TITLE=>"Message", ACTION=>\&my_cb ),
                IUP::Item->new(TITLE=>"Quit", ACTION=>sub { IUP_CLOSE } ),
              ]);
  
   my $frm1 = IUP::Frame->new( TITLE=>"IUP::Button", child=>
                IUP::Vbox->new( child=>[
                  IUP::Button->new( TITLE=>"Test Me", ACTION=>\&my_cb ),
                  IUP::Button->new( ACTION=>\&my_cb, IMAGE=>"IUP_Tecgraf", TITLE=>"Text" ),
                  IUP::Button->new( ACTION=>\&my_cb, IMAGE=>"IUP_Tecgraf" ),
                  IUP::Button->new( ACTION=>\&my_cb, IMAGE=>"IUP_Tecgraf", IMPRESS=>"IUP_Tecgraf" ),
                ])
              );
 
   my $frm2 = IUP::Frame->new( TITLE=>"IUP::Label", child=>
                IUP::Vbox->new( child=>[
                  IUP::Label->new( TITLE=>"Label Text" ),
                  IUP::Label->new( SEPARATOR=>"HORIZONTAL" ),
                  IUP::Label->new( IMAGE=>"IUP_Tecgraf" ),
                ])
              );
  
   my $frm3 = IUP::Frame->new( TITLE=>"IUP::Radio", child=>
                IUP::Vbox->new( child=>
                  IUP::Radio->new( child=>
                    IUP::Vbox->new( child=>[
                      IUP::Toggle->new( TITLE=>"Toggle Text", ACTION=>\&my_cb ),
                      IUP::Toggle->new( TITLE=>"Toggle Text", ACTION=>\&my_cb ),
                    ])
                  )
                )
              );
  
   my $frm4 = IUP::Frame->new( TITLE=>"IUP::Val", child=>IUP::Val->new( MIN=>0, MAX=>100 ) );
 
   my $frm5 = IUP::Frame->new( TITLE=>"IUP::ProgressBar", child=>IUP::ProgressBar->new( MIN=>0, MAX=>100, VALUE=>50 ) );
 
   my $hbox1 = IUP::Hbox->new( child=>[ $frm1, $frm2, $frm3 ] );
   my $hbox2 = IUP::Hbox->new( child=>[ $frm4, $frm5 ] );
   my $vbox1 = IUP::Vbox->new( child=>[ $hbox1, $hbox2 ], MARGIN=>"5x5", ALIGNMENT=>"ARIGHT", GAP=>"5" );
  
   return IUP::Dialog->new( MENU=>$menu, TITLE=>"Custom Dialog Sample", child=>$vbox1 );
 }
 
 # main program
 my $dlg = init_dialog();
 $dlg->Show();
 IUP->MainLoop();
 
=begin html
 
<p>
  <table border="1">
    <tbody align="center">
      <tr>
        <th>Application</th>
        <th>After clicking "Test Me"</th>
      </tr>
      <tr>      
        <td><img src="http://kmx.github.io/perl-iup/spec/app_custom1.png"></td>
        <td><img src="http://kmx.github.io/perl-iup/spec/app_custom2.png"></td>
      </tr>
    </tbody>
  </table>
</p>
 
=end html
 
The main GUI element (the main application window) is always
L<IUP::Dialog|IUP::Dialog> - for more info see L<IUP::Manual::05_DialogLayout|IUP::Manual::05_DialogLayout>.
 
=head1 USING IUP
 
=head2 What is included in IUP's interface ?
 
=head3 IUP Global Function
 
These functions are placed directly in L<IUP|IUP> module - see L<GLOBAL FUNCTIONS|/"GLOBAL FUNCTIONS">.
They are never exported from IUP module, you have to call them via C<< IUP->FunctionName() >>.
 
 use IUP;
 my $s = IUP->GetGlobal('SCREENSIZE');
 my $d = IUP->GetGlobal('DRIVER');
 print "GUI driver=$d\nScreen resolution=$s\n";
 
Global funtions cover:
 
=over
 
=item * handling IUP event loop
 
=item * accessing global attributes
 
=item * simple GUI dialogs
 
=item * other helper functions
 
=back
 
=head3 IUP Global Constants
 
All IUP related constants (e.g. C<IUP_CLOSE>, C<IUP_ERROR>, ...)
are defined in L<IUP::Constants|IUP::Constants>. Please note that:
 
=over
 
=item * all constants are defined via C<use constant> pragma
 
=item * constants are usable as barewords therefore they do not
interpolate in interpolation contexts such as double-quoted strings
 
  use IUP::Constants;
   
  # beware!!!
  print "color is - IUP_GREEN";    # prints: color is - IUP_GREEN
   
  # this is probably what you want
  print "color is - " . IUP_GREEN; # prints: color is - 0 255 0
 
=back
 
=head3 IUP Elemenets
 
B<Currently available IUP elements:>
 
=over
 
=item * The most important GUI element used for the main applications window:
 
L<IUP::Dialog>
 
=item * GUI elements:
 
L<IUP::AnimatedLabel|IUP::AnimatedLabel>,
L<IUP::BackgroundBox|IUP::BackgroundBox>,
L<IUP::Button|IUP::Button>,
L<IUP::Calendar|IUP::Calendar>,
L<IUP::CanvasGL|IUP::CanvasGL>,
L<IUP::Canvas|IUP::Canvas>,
L<IUP::Cbox|IUP::Cbox>,
L<IUP::Cells|IUP::Cells>,
L<IUP::ColorBar|IUP::ColorBar>,
L<IUP::ColorBrowser|IUP::ColorBrowser>,
L<IUP::DatePick|IUP::DatePick>,
L<IUP::DetachBox|IUP::DetachBox>,
L<IUP::Dialog|IUP::Dialog>,
L<IUP::Dial|IUP::Dial>,
L<IUP::Expander|IUP::Expander>,
L<IUP::Fill|IUP::Fill>,
L<IUP::FlatButton|IUP::FlatButton>
L<IUP::Frame|IUP::Frame>,
L<IUP::Gauge|IUP::Gauge>,
L<IUP::GridBox|IUP::GridBox>,
L<IUP::Hbox|IUP::Hbox>,
L<IUP::Image|IUP::Image>,
L<IUP::Item|IUP::Item>,
L<IUP::Label|IUP::Label>,
L<IUP::Link|IUP::Link>,
L<IUP::List|IUP::List>,
L<IUP::MatrixList|IUP::MatrixList>,
L<IUP::Matrix|IUP::Matrix>,
L<IUP::Menu|IUP::Menu>,
L<IUP::MglPlot|IUP::MglPlot>,
L<IUP::Normalizer|IUP::Normalizer>,
L<IUP::OLE|IUP::OLE>,
L<IUP::Plot|IUP::Plot>,
L<IUP::ProgressBar|IUP::ProgressBar>,
L<IUP::Radio|IUP::Radio>,
L<IUP::Sbox|IUP::Sbox>,
L<IUP::Scintilla|IUP::Scintilla>,
L<IUP::ScrollBox|IUP::ScrollBox>,
L<IUP::Separator|IUP::Separator>,
L<IUP::SpinBox|IUP::SpinBox>,
L<IUP::Spin|IUP::Spin>,
L<IUP::Split|IUP::Split>,
L<IUP::Submenu|IUP::Submenu>,
L<IUP::Tabs|IUP::Tabs>,
L<IUP::Text|IUP::Text>,
L<IUP::Toggle|IUP::Toggle>,
L<IUP::Tree|IUP::Tree>,
L<IUP::Val|IUP::Val>,
L<IUP::Vbox|IUP::Vbox>,
L<IUP::Zbox|IUP::Zbox>
 
=for comment generated list - predefined dialogs
 
=item * GL-based GUI elements:
 
L<IUP::GL::BackgroundBox>,
L<IUP::GL::Button>,
L<IUP::GL::CanvasBox>,
L<IUP::GL::Expander>,
L<IUP::GL::Frame>,
L<IUP::GL::Label>,
L<IUP::GL::Link>,
L<IUP::GL::ProgressBar>,
L<IUP::GL::ScrollBox>,
L<IUP::GL::Separator>,
L<IUP::GL::SizeBox>,
L<IUP::GL::SubCanvas>,
L<IUP::GL::Text>,
L<IUP::GL::Toggle>,
L<IUP::GL::Val>
 
=for comment generated list - predefined dialogs
 
=item * Pre-defined dialogs:
 
L<IUP::ColorDlg|IUP::ColorDlg>,
L<IUP::FileDlg|IUP::FileDlg>,
L<IUP::FontDlg|IUP::FontDlg>,
L<IUP::MessageDlg|IUP::MessageDlg>,
L<IUP::ProgressDlg|IUP::ProgressDlg>
 
=item * Special non-GUI elements:
 
L<IUP::Clipboard|IUP::Clipboard>,
L<IUP::Timer|IUP::Timer>,
L<IUP::User|IUP::User>
 
=back
 
 
All IUP elements are perl classes with C<new()> constructor. The are used in this way:
 
 my $button = IUP::Button->new( TITLE=>'Hello' ); # creating
 $button->SetAttribute('FGCOLOR', '255 128 128'); # calling a method
 
For more info see L<IUP::Manual::02_Elements|IUP::Manual::02_Elements>.
  
=head3 Using IUP in your perl program
 
By default, IUP doesn't import any other IUP related modules:
 
 # import IUP but don't import other modules
 use IUP;
 
You may, however, instruct IUP to import all modules by using the following syntax:
 
 # import IUP + all IUP::* modules - short, easy but memory consuming
 use IUP ':all';
 
Or you can import just basic elements (all except Matrix, Cells, Canvas, CanvasGL, PPlot, LayoutDialog, ElementPropertiesDialog)
 
 use IUP ':basic';
 
Or you can import just selected modules by using:
 
 # import IUP + IUP::Button and IUP::Menu
 use IUP qw(Button Menu);
 
Which is equivalent to:
 
 use IUP;
 use IUP::Button;
 use IUP::Menu;
  
B<IMPORTANT NOTE:> If you are the first time reader of this document at this point
you might wanna jumt to L<IUP::Manual::01_Introduction|IUP::Manual::01_Introduction>. The rest of this document is just
the reference list of all functions available in the main L<IUP|IUP> module.
 
=head1 GLOBAL FUNCTIONS
 
=head2 Handling IUP event loop
 
=head3 MainLoop()
 
=over
 
Executes the user interaction until a callback returns C<IUP_CLOSE>,
C<L<< IUP->ExitLoop|/"ExitLoop" >>> is called, or hiding the last visible dialog.
 
 IUP->MainLoop();
 
B<Returns:> Always C<IUP_NOERROR>
 
B<Notes:>
 
When this function is called, it will interrupt the program execution
until a callback returns C<IUP_CLOSE>, C<L<< IUP->ExitLoop|/"ExitLoop" >>> is called, 
or there are no visible dialogs.
 
If you cascade many calls to C<L<< IUP->MainLoop|/"MainLoop" >>> there must be a C<return
IUP_CLOSE> or C<L<< IUP->ExitLoop|/"ExitLoop" >>> call for each cascade level, hidding all
dialogs will close only one level. Call C<L<< IUP->MainLoopLevel|/"MainLoopLevel" >>>
to obtain the current level.
 
If C<L<< IUP->MainLoop|/"MainLoop" >>> is called without any visible dialogs and no active
timers, the application will hang and will not be possible to close the
main loop. The process will have to be interrupted by the system.
 
When the last visible dialog is hidden the C<L<< IUP->ExitLoop|/"ExitLoop" >>> function is
automatically called, causing the C<L<< IUP->MainLoop|/"MainLoop" >>> to return. To avoid
that set global attribute C<LOCKLOOP> to C<"YES"> before hiding the last dialog.
 
B<See Also:>
L<Open|/"Open()"> (global method),
L<Close|/"Close()"> (global method),
L<LoopStep|/"LoopStep()"> (global method),
L<ExitLoop|/"ExitLoop()"> (global method),
L<IDLE_ACTION|IUP::Manual::04_Callbacks/"IDLE_ACTION"> (callback),
L<LOCKLOOP|IUP::Manual::03_Attributes/"LOCKLOOP"> (attribute).
  
=back
 
=head3 MainLoopLevel()
 
=over
 
Returns the current cascade level of C<L<< IUP->MainLoop|/"MainLoop" >>>. 
When no calls were done, return value is 0.
 
 IUP->MainLoopLevel();
 
B<Returns:> the cascade level
 
B<Notes:>
 
You can use this function to check if C<L<< IUP->MainLoop|/"MainLoop" >>> was already called
and avoid calling it again.
 
A call to C<L<< $element->Popup|IUP::Manual::02_Elements/"Popup" >>> will increase one level.
 
B<See Also:>
L<Open|/"Open()"> (global function),
L<Close|/"Close()"> (global function),
L<LoopStep|/"LoopStep()"> (global function),
L<IDLE_ACTION|IUP::Manual::04_Callbacks/"IDLE_ACTION"> (callback),
L<LOCKLOOP|IUP::Manual::03_Attributes/"LOCKLOOP"> (attribute).
 
=back
 
=head3 LoopStep()
 
=over
 
 IUP->LoopStep();
 
See L<LoopStepWait|/"LoopStepWait()">.
 
=back
 
=head3 LoopStepWait()
 
=over
 
Runs one iteration of the message loop.
 
 IUP->LoopStepWait();
 
B<Returns:> C<IUP_CLOSE> or C<IUP_DEFAULT>
 
B<Notes:>
 
This function is useful for allowing a second message loop to be
managed by the application itself. This means that messages can be
intercepted and callbacks can be processed inside an application loop.
 
C<L<< IUP->LoopStep|/"LoopStep()" >>> returns immediately after processing any messages or if
there are no messages to process. C<L<< IUP->LoopStepWait|/"LoopStepWait()" >>> put the system in
idle until a message is processed .
 
If C<IUP_CLOSE> is returned the C<L<< IUP->MainLoop|/"MainLoop" >>> will not end because the
return code was already processed. If you want to end C<L<< IUP->MainLoop|/"MainLoop" >>>
when C<IUP_CLOSE> is returned by C<L<< IUP->LoopStep|/"LoopStep()" >>> then call C<L<< IUP->ExitLoop|/"ExitLoop()" >>>
after C<L<< IUP->LoopStep|/"LoopStep()" >>> returns.
 
An example of how to use this function is a counter that can be stopped
by the user. For such, the user has to interact with the system, which
is possible by calling the function periodically.
 
This way, this function replaces old mechanisms implemented using the
Idle callback.
 
Note that this function does not replace C<L<< IUP->MainLoop|/"MainLoop()" >>>.
 
B<See Also:>
L<Open|/"Open"> (global function),
L<Close|/"Close"> (global function),
L<MainLoop|/"MainLoop"> (global function),
L<ExitLoop|/"ExitLoop"> (global function),
L<IDLE_ACTION|IUP::Manual::04_Callbacks/"IDLE_ACTION"> (callback).
 
=back
 
=head3 ExitLoop()
 
=over
 
Terminates the current message loop. It has the same effect of a
callback returning C<IUP_CLOSE>.
 
 IUP->ExitLoop();
 
=back
 
=head3 Flush()
 
=over
 
Processes all pending messages in the message queue.
 
 IUP->Flush();
 
B<Notes:>
 
When you change an attribute of a certain element, the change may not
take place immediately. For this update to occur faster than usual,
call C<< IUP->Flush >> after the attribute is changed.
 
B<Important:> A call to this function may cause other callbacks to be
processed before it returns.
 
In Motif, if the X server sent an event which is not yet in the event
queue, after a call to C<< IUP->Flush >> the queue might not be empty. 
 
=back
 
=head3 SetIdle()
 
=over
 
Setting global L<IDLE_ACTION|IUP::Manual::04_Callbacks/"IDLE_ACTION"> callback ("idle callback") handler.
 
 sub idle_cb {
   #...
 }
  
 IUP->SetIdle(\&idle_cb);  #set idle callback handler
  
 #at some point later
 IUP->SetIdle(undef);      #unset idle callback handler
 
B<See Also:>
L<IDLE_ACTION|IUP::Manual::04_Callbacks/"IDLE_ACTION"> (callback).
 
=back
 
=head2 Accessing global attributes
 
=head3 GetGlobal()
 
=over
 
Returns an attribute value from the global environment. The value can
be returned from the driver or from the internal storage.
 
 IUP->GetGlobal($name);
 
B<$name>: name of the attribute - see L<global attributes|IUP::Manual::03_Attributes/"GLOBAL ATTRIBUTES">.
 
B<Returns:> the attribute value. If the attribute does not exist C<undef> is returned.
 
B<Notes:>
 
This function's return value is not necessarily the same one
used by the application to define the attribute's value.
 
B<See Also:>
L<SetGlobal|/"SetGlobal"> (global function).
 
=back
 
=head3 SetGlobal()
 
=over
 
Defines an attribute for the global environment. If the driver process
the attribute then it will not be stored internally.
 
 IUP->SetGlobal($name, $value);
 
B<$name>: name of the attribute - see L<global attributes|IUP::Manual::03_Attributes/"GLOBAL ATTRIBUTES">.
 
B<$value>: value of the attribute. If it equals C<undef> the attribute will be removed.
 
B<Notes:>
 
The value stored in the attribute is not duplicated. Therefore, you can
store your private attributes, such as a structure of data to be used
in a callback.
 
B<See Also:>
L<GetGlobal|/"GetGlobal"> (global function).
 
=back
 
=head3 GetLanguage()
 
=over
 
Returns the value of global attribute C<L<LANGUAGE|IUP::Manual::03_Attributes/"LANGUAGE">>.
 
 IUP->GetLanguage();
 
B<Returns:> string with the language name - e.g. C<"ENGLISH">.
 
B<See Also:>
L<SetLanguage|/"SetLanguage()"> (global function),
L<LANGUAGE|IUP::Manual::03_Attributes/"LANGUAGE"> (attribute).
 
=back
 
=head3 SetLanguage()
 
=over
 
Defines the language used by some pre-defined dialogs. This is an old
function, it just sets the global attribute C<L<LANGUAGE|IUP::Manual::03_Attributes/"LANGUAGE">>.
 
 IUP->SetLanguage($lng);
 
B<$lng>: Language to be used. Can have one of the following values:
 
=over
 
=item * "ENGLISH"
 
=item * "PORTUGUESE"
 
=back
 
B<Default:> "ENGLISH"
 
B<Examples:>
 
 use IUP;
 IUP->SetLanguage("ENGLISH"); 
 IUP->Message("IUP Language", IUP->GetLanguage());
 
B<See Also:>
L<GetLanguage|/"GetLanguage()"> (global function),
L<LANGUAGE|IUP::Manual::03_Attributes/"LANGUAGE"> (attribute).
 
=back
 
=head3 Version()
 
=over
 
Returns the value of global attribute C<L<VERSION|IUP::Manual::03_Attributes/"VERSION">>.
 
 my $verstring = IUP->Version();
 
B<Returns:> the version of underlaying iup library - for example: "3.3". 
 
=back
 
=head3 VersionNumber()
 
=over
 
Returns numeric represenatation of underlaying iup library version. The
return value can be used for numeric comparison.
 
 my $vernumger = IUP->VersionNumber();
 
B<Returns:> the version number - for example: 303000 for version "3.3". 
 
=back
 
=head3 VersionDate()
 
=over
 
Returns a release date of underlaying iup library.
 
 my $vernumger = IUP->VersionDate();
 
B<Returns:> date string - for example: "2010/11/09". 
 
=back
 
=head3 SetClassDefaultAttribute()
 
=over
 
Changes the default value of an attribute for a class. It can be any
attribute, i.e. registered attributes or user custom attributes.
 
 IUP->SetClassDefaultAttribute($classname, $name, $value);
 
B<$classname:> name of the class - B<BEWARE:> this is IUP internal class
name e.g. "dialog", "image" or "button"; not a perl class name:
 
=over
 
=item * "button" corresponds to IUP::Button
 
=item * "canvas" corresponds to IUP::Canvas
 
=item * "dialog" corresponds to IUP::Dialog
 
=item * etc.
 
=back
 
B<$name:> name of the attribute
 
B<$value>: new default value.
 
B<Notes:>
 
If the value is "DEFAULTFONT", "DLGBGCOLOR", "DLGFGCOLOR", "TXTBGCOLOR",
"TXTFGCOLOR" or "MENUBGCOLOR" then the actual default value will be the
global attribute of the same name consulted at the time the attribute
is consulted.
 
Attributes that are not strings and attributes that have variable
names, like those which has a complementary number, can NOT have a
default value. Some attributes can NOT have a default value by
definition.
 
If the new default value is C<-1>, ZZZ-test-this
then the default value is set to be the system default if any is defined.
 
B<See Also:>
L<GetClassName|IUP::Manual::02_Elements/"GetClassName()"> (element method),
L<GetClassType|IUP::Manual::02_Elements/"GetClassType()"> (element method),
L<GetAllAttributes|IUP::Manual::02_Elements/"GetAllAttributes()"> (element method).
  
=back
 
=head2 Simple GUI dialogs
 
=head3 Alarm()
 
=over
 
Shows a modal dialog containing a message and up to three buttons.
 
=begin html
 
<p><img src="http://kmx.github.io/perl-iup/img-3.9/dlg/alarm.png"></p>
 
=end html
 
 my $buttonA = IUP->Alarm($t, $m, $b1);  # message box with 1 button
 #or
 my $buttonB = IUP->Alarm($t, $m, $b1, $b2); # message box with 2 buttons
 #or
 my $buttonC = IUP->Alarm($t, $m, $b1, $b2, $b3); # message box with 3 buttons
 
B<$t:> Dialog's title
 
B<$m:> Message text
 
B<$b1:> Text of the first button
 
B<$b2:> Text of the second button (optional)
 
B<$b3:> Text of the third button (optional)
 
B<Returns:> the number of the B<button> selected by the user (1, 2 or 3),
or 0 if failed. It fails only if $b1 is not defined.
 
B<Notes:>
 
This function shows a dialog centralized on the screen, with the
message and the buttons. The C<\n> character can be added
to the message to indicate line change.
 
A button is not shown if its parameter is C<undef>. This is valid only for
B<$b2> and B<$b3>.
 
Button 1 is set as the "DEFAULTENTER" and "DEFAULTESC". If Button 2
exists it is set as the "DEFAULTESC". If Button 3 exists it is set as
the "DEFAULTESC".
 
The dialog uses a global attribute called "PARENTDIALOG" as the parent
dialog if it is defined. It also uses a global attribute called "ICON"
as the dialog icon if it is defined.
 
B<See Also:>
L<Message|/"Message()"> (global function),
L<ListDialog|/"ListDialog()"> (global function),
L<GetFile|/"GetFile()"> (global function).
 
=back
 
=head3 GetColor()
 
=over
 
Shows a modal dialog which allows the user to select a color. Based on
pre-defined dialog L<IUP::ColorDlg|IUP::ColorDlg>.
 
=begin html
 
<p>
  <table border="1">
    <tbody align="left">
      <tr>
        <th>MS&nbsp;Windows</th>
        <td><img src="http://kmx.github.io/perl-iup/img-3.9/dlg/colordlg_cb.png"></td>
      </tr>
      <tr>
        <th>GTK</th>
        <td><img src="http://kmx.github.io/perl-iup/img-3.9/dlg/colordlg_gtk.png"></td>
      </tr>
    </tbody>
  </table>
</p>
 
=end html
 
 my ($r1, $g1, $b1) = IUP->GetColor($x, $y);
 #or
 my ($r2, $g2, $b2) = IUP->GetColor($x, $y, $r, $g, $b);
 
B<$x, $y:> x, y values of the L<Popup|IUP::Manual::02_Elements/"Popup()"> function.
 
B<$r, $g, $b:>Initialization values defining the color being selected when
the dialog is shown.
 
B<Returns:> List of three (R, G, B) values are returned if the OK button
is pressed or three C<undef> otherwise.
 
B<Notes:>
 
The dialog uses a global attribute called "PARENTDIALOG" as the parent
dialog if it is defined. It also uses a global attribute called "ICON"
as the dialog icon if it is defined.
 
B<See Also:>
L<Message|/"Message()"> (global function),
L<ListDialog|/"ListDialog()"> (global function),
L<Alarm|/"Alarm()"> (global function),
L<GetFile|/"GetFile()"> (global function).
 
=back
 
=head3 GetFile()
 
=over
 
Shows a modal dialog of the native interface system to select a
filename. Uses pre-defined dialog L<IUP::FileDlg|IUP::FileDlg>. 
 
=begin html
 
<p>
  <table border="1">
    <tbody align="left">
      <tr>
        <th>MS&nbsp;Windows</th>
        <td><img src="http://kmx.github.io/perl-iup/img-3.9/dlg/filedlg_win.png"></td>
      </tr>
      <tr>
        <th>GTK</th>
        <td><img src="http://kmx.github.io/perl-iup/img-3.9/dlg/filedlg_gtk.png"></td>
      </tr>
      <tr>
        <th>Motif</th>
        <td><img src="http://kmx.github.io/perl-iup/img-3.9/dlg/filedlg_mot.png"></td>
      </tr>
    </tbody>
  </table>
</p>
 
=end html
 
 my ($filename, $status) = IUP->GetFile($filename_spec);
 
B<$filename_spec:> This parameter is used as an input value to define the
default filter and directory. Example: "../docs/*.txt".
 
B<Returns:> a list with 2 values: B<filename> of chosen file; B<status> code, 
whose values can be:
 
=over
 
=item * "1": New file.
 
=item * "0": Normal, existing file.
 
=item * "-1": Operation cancelled.
 
=back
 
B<Notes:>
 
The function will reuse the directory from one call to another, so in
the next call will open in the directory of the last selected file.
 
The dialog uses a global attribute called "PARENTDIALOG" as the parent
dialog if it is defined. It also uses a global attribute called "ICON"
as the dialog icon if it is defined.
 
B<See Also:>
L<IUP::FileDlg|IUP::FileDlg> (pre-defined dialog),
L<Message|/"Message()"> (global function),
L<ListDialog|/"ListDialog()"> (global function),
L<Alarm|/"Alarm()"> (global function),
L<SetLanguage|/"SetLanguage()"> (global function).
 
=back
 
=head3 GetParam()
 
=over
 
Shows a modal dialog for capturing parameter values using several types
of controls.
 
=begin html
 
<p><img src="http://kmx.github.io/perl-iup/img-3.9/dlg/getparam.png"></p>
 
=end html
 
 my ($status, @values) = IUP->GetParam($title, $action, $format, @initial_values);
 
B<$title:> dialog title.
 
B<$action:> user callback (reference to a perl function) to be called whenever
a parameter value was changed, and when the user pressed the OK button.
It can be C<undef>.
 
B<$format>: string describing the parameter
 
=over
 
The format string must have the following format, notice the "\n" at
the end:
 
 "<text>%<x><extra>{<tip>}\n"
 
Where:
 
B<< <text> >> is a descriptive text, to be placed to the left of the entry
field in a label.
 
B<< <x> >> is the type of the parameter (always a single character). The valid options are:
 
=over
 
=item * B<b> = boolean (shows a True/False toggle)
 
=item * B<i> = integer (shows a integer number filtered text box)
 
=item * B<r> = real (shows a real number filtered text box, use "float" in C)
 
=item * B<a> = angle in degrees (shows a real number filtered text box and a dial)
 
=item * B<s> = string (shows a text box, BEWARE: there is hardcoded string size limitation 10240bytes)
 
=item * B<m> = multiline string (shows a multiline text box, BEWARE: there is hardcoded string size limitation 10240bytes)
 
=item * B<l> = list (shows a dropdown list box)
 
=item * B<o> = list (shows a list of toggles inside a radio)
 
=item * B<t> = separator (shows a horizontal line separator label, in this case
text can be an empty string, not included in parameter count)
 
=item * B<f> = string (same as 's', but also show a button to open a file
selection dialog box)
 
=item * B<c> = string (same as 's', but also show a color button to open a
color selection dialog box)
 
=item * B<n> = string (same as 's', but also show a font button to open a font
selection dialog box)
 
=item * B<u> = buttons names (allow to redefine the OK and Cancel button names,
and to add a Help button, use [ok,cancel,help] as extra data,
can omit one of them, it will use the default name, not included
in parameter count) - B<BEWARE> C<%u> has to be the last item in C<$format> string.
 
=back
 
B<< <extra> >> is one or more additional options for the given type
 
=over
 
=item * B<[min,max,step]> are optional limits for B<integer> and B<real> types. The
B<max> and B<step> values can be omitted. When B<min> and B<max> are
specified a valuator will also be added to change the value. To specify
B<step>, B<max> must be also specified. B<step> is the size of the
increment.
 
=item * B<[false,true]> are optional strings for B<boolean> types to be displayed
after the toggle. The strings can not have commas 'B<,>', nor brackets
'B<[>' or 'B<]>'.
 
=item * B<mask> is an optional mask for the B<string> and B<multiline> types. The dialog
uses the L<MASK|IUP::Manual::03_Attributes/MASK> attribute internally. In this
case we do no use the brackets 'B<[>' and 'B<]>' to avoid confusion
with the specified mask.
 
=item * B<|item0|item1|item2,...|> are the items of the B<list>. At least one item
must exist. Again the brackets are not used to increase the
possibilities for the strings, instead you must use 'B<|>'. Items index
is zero based.
 
=item * B<[dialogtype|filter|directory|nochangedir|nooverwriteprompt]> are the
respective attribute values passed to the L<IUP::FileDlg|IUP::FileDlg>
control when activated. All commas must exist, but you can let empty
values to use the default values. No mask can be set.
 
=back
 
B<< <tip> >> is a string that is displayed in a TIP for the main control of
the parameter. 
 
There are no extra parameters for the B<color> string. The mask is
automatically set to capture 3 or 4 unsigned integers from 0 to 255 (R
G B) or (R G B A) (alpha is optional).
 
The number of lines in the format string (number of '\n') will
determine the number of required parameters. But separators will not
count as parameters.
 
A integer parameter always has a spin attached to the text to increment
and decrement the value. A real parameter only has a spin if a full
interval is defined (min and max), in this case the default step is
(max-min)/20. When the callback is called because a spin was activated
then the attribute SPINNING of the dialog will be defined to a non C<undef>
and non zero value.
 
Examples of format strings:
 
 my $format1 = "Real 2: %r[-1.5,1.5,0.05]\n";       # [min,max,step] example
 my $format2 = "Numeric string: %s/d+\n";           # mask example
 my $format3 = "Boolean: %b[No,Yes]{tip text}\n";   # [false,true] + tip text example
 my $format4 = "List: %l|item0|item1|item2|item3|item4|item5|item6|\n"; # list example
 my $format5 = "File: %f[OPEN|*.bmp;*.jpg|CURRENT|NO|NO]\n" # [dialogtype|filter|directory|nochangedir|nooverwriteprompt] example
 
=back
 
B<@initial_values:> list of variables with initial values for the parameters
used in format string.
 
B<Returns:> a B<$status> code 1 if the "OK" button is pressed, 0 if the user
canceled or if an error occurred + list of values corresponding to format
string parameters, the values are returned by the function in the same
order they were passed.
 
The function will abort if there are errors in the format string as in
the number of the expected parameters. 
 
B<Handling GetParam Callback:>
 
=over
 
This callback is called whenever a parameter value was changed, and when
the user pressed the OK button.
 
  sub getparam_cb {
    my ($dialog, $param_index) = @_;
    #...
  }
 
B<$dialog:> Reference to the dialog object (L<IUP::Dialog|IUP::Dialog>).
 
B<$param_index:> Current parameter index (0 based) being changed. 
It is -1 if the user pressed the B<OK> button. It is -2 after the dialog
is B<mapped> and just before it is shown. It is -3 if the user pressed
the B<Cancel> button. It is -4 if the user pressed the B<Help> button, if any.
 
B<Returns:> You can reject the change or the OK action by returning 0 in
the callback, otherwise you must return 1.
 
The easiest way to retrieve a parameter inside the callback is via
L<GetParamValue|IUP::Manual::02_Elements/"GetParamValue()"> method:
 
 sub getparam_cb {
   my ($dialog, $param_index) = @_;
   my $oldvalue = $dialog->GetParamValue(2); #get value of the element with index 2 (index is 0-based)
   my $newvalue;
   #...   
   $dialog->GetParamValue(2, $newvalue); #set value of the element with index 2 to $newvalue
   return 1;
 }
 
B<BEWARE: You should not programmatically change the current parameter value (with index == $param_index)
during the callback>. On the other hand you can freely change the value of other parameters.   
 
B<BEWARE:> Programmatical changes are not filtered.
 
=back
 
B<Handling GetParam Callback (even more advanced):>
 
=over
 
Use the $dialog method L<GetParamParam|IUP::Manual::02_Elements/"GetParamParam()"> to get the reference
to element representing given parameter:
 
 my $parameter = $dialog->GetParamParam($n);
 
where C<$n> is the parameter index in the order they are specified
starting at 0, but separators and button names are not counted. Notice
that this is not the actual control, which is internally stored in parameter's
attribute "CONTROL".
 
Avaliable attributes of C<$parameter> (do not try to use them from perl unless you know what can happen):
 
=over
 
=item * "LABEL" - returns an IUP Ihandle, the label associated with the parameter.
 
=item * "CONTROL" - returns an IUP Ihandle, the real control associated with the parameter.
 
=item * "AUXCONTROL" - returns an IUP Ihandle, the auxiliary control associated with the parameter (only for Valuators).
 
=item * "INDEX" - returns an integer value associated with the parameter index.
 
=item * "VALUE" - returns the parameter value as a string. It usually contains the new value of
the control while the VALUE attribute of the control still has the old value.
 
=back
 
=back
 
=back
 
=head3 GetText()
 
=over
 
Shows a modal dialog to edit a multiline text.
 
=begin html
 
<p><img src="http://kmx.github.io/perl-iup/img-3.9/dlg/gettext.png"></p>
 
=end html
 
 my $text = IUP->GetText($title, $initial_text);
 
B<$initial_text:> It contains the initial value of the text.
 
B<Returns:> The text or C<undef> if an error occured.
 
B<Notes:>
 
The dialog uses a global attribute called "PARENTDIALOG" as the parent
dialog if it is defined. It also uses a global attribute called "ICON"
as the dialog icon if it is defined.
 
B<See Also:>
L<Message|/"Message()"> (global function),
L<ListDialog|/"ListDialog()"> (global function),
L<Alarm|/"Alarm()"> (global function),
L<SetLanguage|/"SetLanguage()"> (global function).
 
=back
 
=head3 ListDialog()
 
=over
 
Shows a modal dialog to select items from a simple or multiple
selection list.
 
=begin html
 
<p><img src="http://kmx.github.io/perl-iup/img-3.9/dlg/listdialog.png"></p>
 
=end html
 
 my $list = ["Blue", "Red", "Green", "Yellow", "Black", "White", "Gray", "Brown"];
  
 #simple selection
 my $status = IUP->ListDialog($title, $list, $mark, $max_lin, $max_col);
  
 #multi selection
 my $status = IUP->ListDialog($title, $list, [0, 1, 0, 0, 1, 1, 0, 0], $max_lin, $max_col);
 
 
B<$title:> Text for the dialog's title
 
B<$list:> A reference to array of list items.
 
B<$mark:> Initial selected item. For simple selection - has to be a scalar value (0-based index into $list array).
For multiple selection - has to be an arrayref (must have the same numer of elements as $list size)
with values "1" for selected items, "0" for unselected items.
 
B<$max_col:> Maximum number of columns in the list.
 
B<$max_lin:> Maximum number of lines in the list.
 
B<Returns:> When simple selection, the function returns the index of the selected
option (starts at 0), or -1 if the user cancels the operation.
 
When multiple selection, the function returns -1 when the user cancels the
operation. If the user does not cancel the operation the function
returns arrayref with a list of values "1" for selected items, "0" for non-selected items.
 
B<Notes:>
The dialog uses a global attribute called "PARENTDIALOG" as the parent
dialog if it is defined. It also uses a global attribute called "ICON"
as the dialog icon if it is defined.
 
B<See Also:>
L<Message|/"Message()"> (global function),
L<GetFile|/"GetFile()"> (global function),
L<Alarm|/"Alarm()"> (global function).
 
=back
 
=head3 Message()
 
=over
 
Shows a modal dialog containing a message. It simply creates and popup
a L<IUP::MessageDlg|IUP::MessageDlg>.
 
=begin html
 
<p>
  <table border="1">
    <tbody align="left">
      <tr>
        <th>MS&nbsp;Windows</th>
        <td><img src="http://kmx.github.io/perl-iup/img-3.9/dlg/messagedlg_win.png"></td>
      </tr>
      <tr>
        <th>GTK</th>
        <td><img src="http://kmx.github.io/perl-iup/img-3.9/dlg/messagedlg_gtk.png"></td>
      </tr>
      <tr>
        <th>Motif</th>
        <td><img src="http://kmx.github.io/perl-iup/img-3.9/dlg/messagedlg_mot.png"></td>
      </tr>
    </tbody>
  </table>
</p>
 
=end html
 
 IUP->Message($message);
 #or
 IUP->Message($title, $message);
 
B<$title:> dialog title
 
B<$message:> text message contents
 
B<Notes:>
 
The L<Message|/"Message"> function shows a dialog centralized on the screen,
showing the message and the "OK" button. The "\n" character can be added
to the message to indicate line change.
 
The dialog uses a global attribute called "PARENTDIALOG" as the parent
dialog if it is defined. It also uses a global attribute called "ICON"
as the dialog icon if it is defined (used only in Motif, in Windows
MessageBox does not have an icon in the title bar).
 
B<See Also:>
L<GetFile|/"GetFile()"> (global function),
L<ListDialog|/"ListDialog()"> (global function),
L<Alarm|/"Alarm()"> (global function),
L<IUP::MessageDlg|IUP::MessageDlg> (pre-defined dialog).
 
=back
 
=head2 Recording and Re-playing User Input
 
=head3 PlayInput()
 
=over
 
Reproduces all mouse and keyboard input from a given file.
 
 my $ret = IUP->PlayInput($filename);
 
B<$filename:> name of the file to be played. C<undef> will stop playing. 
"" will pause and restart a file already being played.
 
B<Returns:> IUP_NOERROR if successful, IUP_ERROR if failed to open the
file for writing. If already playing
 
The file must had been saved using the L<RecordInput|/"RecordInput()"> function.
Record mode will be automatically detected.
 
This function will start the play and return the control to the
application. If the file ends all internal memory used to play the file
will be automatically released.
 
It uses the MOUSEBUTTON global attribute to reproduce the events.
 
B<IMPORTANT>: See the documentation of the L<MOUSEBUTTON|IUP::Manual::03_Attributes/MOUSEBUTTON> attribute for
further details and current limitations.
 
The file must had been generated in the same operating system. Screen
size differences can exist, but if different themes are used then mouse
precision will be affected.
 
=back
 
=head3 RecordInput()
 
=over
 
Records all mouse and keyboard input in a file for later reproduction.
 
 my $ret = IUP->RecordInput($filename, $mode);
 
B<$filename:> name of the file to be saved. C<undef> will stop recording.
 
B<$mode:> flag for controlling the file generation. Can be: IUP_RECBINARY or IUP_RECTEXT.
 
B<Returns:> IUP_NOERROR if successful, IUP_ERROR if failed to open the file for writing.
 
Notes:
 
=over
 
=item * Any existing file will be replaced.
 
=item * Must stop recording before exiting the application.
 
=item * It uses the global callbacks enabled by the INPUTCALLBACKS global attribute.
 
=item * Mouse position is relative to the top left corner of the screen and it
is independent from the controls and dialogs being manipulated.
 
=item * The generated file can be used by L<PlayInput|/"PlayInput()"> to reproduce the same events.
 
=back
 
=back
 
=head2 Other helper functions
 
=head3 CopyClassAttributes()
 
=over
 
Copies all registered attributes from one element to another. Both
elements must be of the same internal class (see L<GetClassName|/"GetClassName()">).
 
 IUP->CopyClassAttributes($src_element, $dst_element);
 
B<$src_elem:> reference of the source element.
 
B<$dst_elem:> reference of the destination element.
 
B<See Also:>
L<GetClassAttributes|/"GetClassAttributes()"> (global function),
L<GetClassName|/"GetClassName()"> (element method),
L<GetClassType|/"GetClassType()"> (element method),
L<GetAllAttributes|/"GetAllAttributes()"> (element method),
L<SaveClassAttributes|IUP::Manual::02_Elements/"SaveClassAttributes()"> (element method).
 
=back
 
=head3 GetAllClasses()
 
=over
 
Returns the internal names of all registered classes.
 
 my @list1 = IUP->GetAllClasses();
 #or
 my @list1 = IUP->GetAllClasses($max_n);
 
B<$max_n:> maximum number of names we want to receive. Can be omitted.
 
B<Returns:> The list of all names (or just C<$max_n> first items). The names
are internal iup library class names B<not perl class names>:
 
=over
 
=item * "button" corresponds to IUP::Button
 
=item * "canvas" corresponds to IUP::Canvas
 
=item * "dialog" corresponds to IUP::Dialog
 
=item * etc.
 
=back
 
B<See Also:>
L<GetClassName|IUP::Manual::02_Elements/"GetClassName()"> (element method),
L<GetClassType|IUP::Manual::02_Elements/"GetClassType()"> (element method),
L<GetAllAttributes|IUP::Manual::02_Elements/"GetAllAttributes()"> (element method).
 
=back
 
=head3 GetAllDialogs()
 
=over
 
Returns the names of all dialogs that have an associated name using
C<L<< $elem->SetName()|IUP::Manual::02_Elements/SetName >>> or using LED - C<L<< IUP->LoadLED()|/LoadLED >>>.
Other existing dialogs (without assigned name) will not be returned.
 
 my @list1 = IUP->GetAllDialogs();
 #or
 my @list1 = IUP->GetAllDialogs($max_n);
 
 
B<$max_n:> maximum number of names we want to receive. Can be omitted.
 
B<Returns:> The list of all names (or just C<$max_n> first items).
 
B<See Also:>
L<SetName|IUP::Manual::02_Elements/"SetName()"> (element method),
L<GetName|IUP::Manual::02_Elements/"GetName()"> (element method),
L<GetByName|/"GetByName()"> (global function),
L<GetAllNames|/"GetAllNames()"> (global function).
 
=back
 
=head3 GetAllNames()
 
=over
 
Returns the names of all interface elements that have an associated name using
C<L<< $elem->SetName()|IUP::Manual::02_Elements/SetName >>> or using LED - C<L<< IUP->LoadLED()|/LoadLED >>>.
 
 my @list1 = IUP->GetAllNames();
 #or
 my @list1 = IUP->GetAllNames($max_n);
 
B<$max_n:> maximum number of names we want to receive. Can be omitted.
 
B<Returns:> The list of all names (or just C<$max_n> first items).
 
B<See Also:>
L<SetName|IUP::Manual::02_Elements/"SetName()"> (element method),
L<GetName|IUP::Manual::02_Elements/"GetName()"> (element method),
L<GetByName|/"GetByName()"> (global function),
L<GetAllDialogs|/"GetAllDialogs()"> (global function).
 
=back
 
=head3 GetClassAttributes()
 
=over
 
Returns the names of all registered attributes of a class.
 
 my @list1 = IUP->GetClassAttributes($classname);
 #or
 my @list2 = IUP->GetClassAttributes($classname, $max_n);
 
B<$classname:> internal name of the class - e.g. "button",
"image" or "dialog"; not a perl class name:
 
=over
 
=item * "button" corresponds to IUP::Button
 
=item * "canvas" corresponds to IUP::Canvas
 
=item * "dialog" corresponds to IUP::Dialog
 
=item * etc.
 
=back
 
B<$max_n:> maximum number of names we want to receive. Can be omitted.
 
B<Returns:> the list of all names (or just C<$max_n> first items).
 
B<See Also:>
L<GetClassName|IUP::Manual::02_Elements/"GetClassName()"> (element method),
L<GetClassType|IUP::Manual::02_Elements/"GetClassType()"> (element method),
L<GetAllAttributes|IUP::Manual::02_Elements/"GetAllAttributes()"> (element method).
 
=back
 
=head3 GetClassCallbacks()
 
=over
 
Returns the names of all registered callbacks of a class.
 
 my @list1 = IUP->GetClassCallbacks($classname);
 #or
 my @list2 = IUP->GetClassCallbacks($classname, $max_n);
 
B<$classname:> internal name of the class - e.g. "button",
"image" or "dialog"; not a perl class name:
 
=over
 
=item * "button" corresponds to IUP::Button
 
=item * "canvas" corresponds to IUP::Canvas
 
=item * "dialog" corresponds to IUP::Dialog
 
=item * etc.
 
=back
 
B<$max_n:> maximum number of names we want to receive. Can be omitted.
 
B<Returns:> the list of all names (or just C<$max_n> first items).
 
B<See Also:>
L<GetClassName|IUP::Manual::02_Elements/"GetClassName()"> (element method),
L<GetClassType|IUP::Manual::02_Elements/"GetClassType()"> (element method),
L<GetAllAttributes|IUP::Manual::02_Elements/"GetAllAttributes()"> (element method).
 
=back
 
=head3 GetFocus()
 
=over
 
Returns the reference to a GUI element that has the keyboard
focus, i.e. the element that will receive keyboard events.
 
 my $elem = IUP->GetFocus();
 
B<See Also:>
L<SetFocus|IUP::Manual::02_Elements/"SetFocus()"> (element method).
 
=back
 
=head3 GetIhClassName()
 
=over
 
 my $classname = GetIhClassName($elem->ihandle); 
 # gives the same output as
 $elem->GetClassName(); 
 
The same as element method L<GetClassName|IUP::Manual::02_Elements/"GetClassName()">.
 
=back
 
=head3 GetByIhandle()
 
=over
 
Returns the reference to a GUI element that is associated with internal C<ihandle>
given as a parameter. (avoid this function if possible)
 
  my $elem = IUP->GetByIhandle($ihandle);
 
B<$ihandle:> In fact C pointer - be carefull.
 
=back
 
=head3 GetByName()
 
=over
 
Returns the reference to a GUI element that has an associated name using
C<L<< $elem->SetName()|IUP::Manual::02_Elements/SetName >>> or using LED - C<L<< IUP->LoadLED()|/LoadLED >>>.
 
 my $elem = IUP->GetByName($name);
 
B<$name:> name of an GUI element
 
B<Notes:>
 
This function is used for integrating IUP and LED. To manipulate an
interface element defined in LED, first capture its reference using
function L<GetByName|/"GetByName">, passing the name of the GUI element as
parameter, then use this reference on the calls to IUP element methods - for example:
 
 use IUP;
 my $ledfile = 'file.led';
 IUP->LoadLED($ledfile) or die "cannot load '$ledfile'\n";
 my $button = IUP->GetByName('button1');
 die "GetByName() failed\n" unless $button;
 print "FGCOLOR=", $button->GetAttribute('FGCOLOR'), "\n";
 
B<See Also:>
L<SetName|IUP::Manual::02_Elements/"SetName()"> (element method),
L<LoadLED|/"LoadLED"> (global function),
L<IUP::Manual::08_UsingLED|IUP::Manual::08_UsingLED>.
 
=back
 
=head3 Help()
 
=over
 
Opens the given URL. In UNIX executes Netscape, Safari (MacOS) or
Firefox (in Linux) passing the desired URL as a parameter. In Windows
executes the shell "open" operation on the given URL.
 
In UNIX you can change the used browser setting the environment
variable C<IUP_HELPAPP> or using the global attribute "HELPAPP".
 
It is a non synchronous operation, i.e. the function will return just
after execute the command and it will not wait for its result.
 
 IUP->Help($url);
 
B<$url:> may be any kind of address accepted by the Browser, that is, it
can include 'http://', or be just a file name, etc.
 
B<Returns:> 1 if successfull, -1 if failed. In Windows can return -2 if
file not found.
 
=back
 
=head3 LoadLED()
 
=over
 
Loads and compiles a LED specification from file.
 
 my $rv1 = IUP->LoadLED($led_filename);
 #or
 my $rv2 = IUP->LoadLED(\$led_string); #passing as a reference
 
B<$led_filename>: name of the file containing the LED specification.
 
B<$led_string:> string with the LED specification
 
B<Returns:> C<undef> if the file was successfully compiled;
otherwise it returns a string containing the error message.
 
B<Notes:>
 
Each time the function loads a LED file, the elements contained in it
are created. Therefore, the same LED file cannot be loaded several
times, otherwise the elements will also be created several times. 
 
=back
 
=head2 Keyboard Related Functions
 
=head3 isXkey()
 
=over
 
Informs if a given key is an extended code (returns 1) or not (returns 0).
 
 my $is_xkey = IUP->isXkey($code);
 
B<$code:> Key code number e.g. value passed to L<K_ANY|IUP::Manual::04_Callbacks/"K_ANY"> callback handler.
 
B<Returns:> 1 or 0
 
=back
 
=head3 isShiftXkey()
 
=over
 
Informs if a given key is an extended code using the C<Shift> modifier (returns 1) or not (returns 0).
 
 my $is_shiftxkey = IUP->isShiftXkey($code);
 
B<$code:> Key code number e.g. value passed to L<K_ANY|IUP::Manual::04_Callbacks/"K_ANY"> callback handler.
 
B<Returns:> 1 or 0
 
=back
 
=head3 isCtrlXkey()
 
=over
 
Informs if a given key is an extended code using the C<Ctrl> modifier (returns 1) or not (returns 0).
 
 my $is_ctrlxkey = IUP->isCtrlXkey($code);
 
B<$code:> Key code number e.g. value passed to L<K_ANY|IUP::Manual::04_Callbacks/"K_ANY"> callback handler.
 
B<Returns:> 1 or 0
 
=back
 
=head3 isAltXkey()
 
=over
 
Informs if a given key is an extended code using the C<Alt> modifier (returns 1) or not (returns 0).
 
 my $is_altxkey = IUP->isAltXkey($code);
 
B<$code:> Key code number e.g. value passed to L<K_ANY|IUP::Manual::04_Callbacks/"K_ANY"> callback handler.
 
B<Returns:> 1 or 0
 
=back
 
=head3 isSysXkey()
 
=over
 
Informs if a given key is an extended code using the C<Sys> (on Windows C<WindowKey>, on Mac C<AppleKey>)
modifier (returns 1) or not (returns 0).
 
 my $is_sysxkey = IUP->isSysXkey($code);
 
B<$code:> Key code number e.g. value passed to L<K_ANY|IUP::Manual::04_Callbacks/"K_ANY"> callback handler.
 
B<Returns:> 1 or 0
 
=back
 
=head3 isPrintable()
 
=over
 
Informs if a key can be directly used as a printable character (31 < ASCII code < 127).
 
 my $is_printable = IUP->isPrintable($code);
 
B<$code:> Key code number.
 
B<Returns:> 1 (is printable) or 0 (otherwise)
 
=back
 
=head2 Mouse Related Functions
 
=head3 isShift()
 
=over
 
Checks the given mouse buttons and keyboard keys status string (see L<BUTTON_CB|IUP::Manual::04_Callbacks/"BUTTON_CB"> callback) 
whether C<Shift> key was pressed at the time of mouse click event or not.
 
 my $shift_pressed = IUP->isShift($status);
 
B<Returns:> 1 (pressed) or 0 (not pressed)
 
=back
 
=head3 isControl()
 
=over
 
Checks the given mouse buttons and keyboard keys status string (see L<BUTTON_CB|IUP::Manual::04_Callbacks/"BUTTON_CB"> callback) 
whether C<Control> key was pressed at the time of mouse click event or not.
 
 my $crtl_pressed = IUP->isControl($status);
 
B<Returns:> 1 (pressed) or 0 (not pressed)
 
=back
 
=head3 isAlt()
 
=over
 
Checks the given mouse buttons and keyboard keys status string (see L<BUTTON_CB|IUP::Manual::04_Callbacks/"BUTTON_CB"> callback) 
whether C<Alt> key was pressed at the time of mouse click event or not.
 
 my $alt_pressed = IUP->isControl($status);
 
B<Returns:> 1 (pressed) or 0 (not pressed)
 
=back
 
=head3 isSys()
 
=over
 
Checks the given mouse buttons and keyboard keys status string (see L<BUTTON_CB|IUP::Manual::04_Callbacks/"BUTTON_CB"> callback) 
whether C<Sys> key (on Windows C<WindowKey>, on Mac C<AppleKey>) was pressed at the time of mouse click event or not.
 
 my $sys_pressed = IUP->isSys($status);
 
B<Returns:> 1 (pressed) or 0 (not pressed)
 
=back
 
=head3 isButton1()
 
=over
 
Checks the given mouse buttons status string (see L<BUTTON_CB|IUP::Manual::04_Callbacks/"BUTTON_CB"> callback) 
whether the B<left button> was pressed at the time of mouse click event or not.
 
NOTE: It does not mean that this button generated the event, it might be already pressed before other 
mouse button click.
 
 my $letft_mouse_button_pressed = IUP->isButton1($status);
 
B<Returns:> 1 (pressed) or 0 (not pressed)
 
=back
 
=head3 isButton2()
 
=over
 
Checks the given mouse buttons status string (see L<BUTTON_CB|IUP::Manual::04_Callbacks/"BUTTON_CB"> callback) 
whether the B<middle button> was pressed at the time of mouse click event or not.
 
NOTE: It does not mean that this button generated the event, it might be already pressed before other 
mouse button click.
 
 my $middle_mouse_button_pressed = IUP->isButton2($status);
 
B<Returns:> 1 (pressed) or 0 (not pressed)
 
=back
 
=head3 isButton3()
 
=over
 
Checks the given mouse buttons status string (see L<BUTTON_CB|IUP::Manual::04_Callbacks/"BUTTON_CB"> callback) 
whether the B<right button> was pressed at the time of mouse click event or not.
 
NOTE: It does not mean that this button generated the event, it might be already pressed before other 
mouse button click.
 
 my $right_mouse_button_pressed = IUP->isButton3($status);
 
B<Returns:> 1 (pressed) or 0 (not pressed)
 
=back
 
=head3 isButton4()
 
=over
 
Checks the given mouse buttons status string (see L<BUTTON_CB|IUP::Manual::04_Callbacks/"BUTTON_CB"> callback) 
whether the B<button 4> (Windows: 1st X button) was pressed at the time of mouse click event or not.
 
NOTE: It does not mean that this button generated the event, it might be already pressed before other 
mouse button click.
 
 my $mouse_button4_pressed = IUP->isButton4($status);
 
B<Returns:> 1 (pressed) or 0 (not pressed)
 
=back
 
=head3 isButton5()
 
=over
 
Checks the given mouse buttons status string (see L<BUTTON_CB|IUP::Manual::04_Callbacks/"BUTTON_CB"> callback) 
whether the B<button 5> (Windows: 2nd X button) was pressed at the time of mouse click event or not.
 
NOTE: It does not mean that this button generated the event, it might be already pressed before other 
mouse button click.
 
 my $mouse_button5_pressed = IUP->isButton5($status);
 
B<Returns:> 1 (pressed) or 0 (not pressed)
 
=back
 
=head3 isDouble()
 
=over
 
Checks the given mouse buttons status string (see L<BUTTON_CB|IUP::Manual::04_Callbacks/"BUTTON_CB"> callback) 
whether the click event was double click or not.
 
 my $double_click = IUP->isDouble($status);
 
B<Returns:> 1 (double click) or 0 (otherwise)
 
=back
 
=head2 Special Functions
 
=head3 Open()
 
=over
 
Initializes the IUP toolkit. Usually there is no need to call this function
as it is call automatically during: C<use IUP;>
 
 IUP->Open();
 
B<Returns:> C<IUP_OPENED> (already opened), C<IUP_ERROR> or C<IUP_NOERROR>. Only in
UNIX can fail to open, because X-Windows may be not initialized.
 
B<Notes:>
 
The toolkit's initialization depends also on platform-dependent
environment variables, see each driver documentation.
 
=over
 
=item * QUIET
 
When this variable is set to NO, IUP will generate a message in console
indicating the driver's version when initializing. Default: YES.
 
=item * VERSION
 
When this variable is set to YES, IUP generates a message dialog
indicating the driver's version when initializing. Default: NO.
 
=back
 
=back
 
=head3 Close()
 
=over
 
Ends the IUP toolkit and releases internal memory. It will also
automatically destroy all dialogs and all elements that have names.
 
 IUP->Close();
 
B<Notes:> Situations when you need to call this function are quite rare.
 
=back
 
=head1 AUTHOR
 
KMX, E<lt>kmx at cpan.orgE<gt>
 
=head1 BUGS
 
Please report any bugs or feature requests to C<bug-iup at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=IUP>.
 
=head1 ACKNOWLEDGEMENTS
 
Thanks to Tecgraf, PUC-Rio. L<http://www.tecgraf.puc-rio.br> for excelent 
work on L<iup|http://www.tecgraf.puc-rio.br/iup/>,
L<cd|http://www.tecgraf.puc-rio.br/cd/> and
L<im|http://www.tecgraf.puc-rio.br/im/> libraries.
 
Special thanks for the original documentation that was a very usefull
resource for creating the documentation for IUP perl module.
 
=head1 LICENSE AND COPYRIGHT
 
External libraries I<iup>, I<im> and I<cd>: 
Copyright (C) 1994-2010 Tecgraf, PUC-Rio. L<http://www.tecgraf.puc-rio.br>
 
IUP perl module: Copyright (C) 2010 KMX.
 
This program is distributed under the MIT License:
L<http://www.opensource.org/licenses/mit-license.php>
 
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:
 
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
 
=head1 IUP TRADEMARK
 
IUP is registered at the National Institute of Intellectual Property in
Brazil (INPI) under the number 07569-0, and so it is protected against
illegal use. 
See the L<Tecgraf Library License|http://www.tecgraf.puc-rio.br/iup/en/copyright.html>
for further usage information and Copyright.
 
=cut
