title ThinkSQL dbExpress

"c:\program files\borland\delphi6\bin\brcc32" version.rc >build.log

if exist sqlthink.cfg (
	findstr /R /I /V "^-D" sqlthink.cfg >dcc32.cfg

	del sqlthink.cfg  
)

echo %date% %time% >>build.log

if /I "%1"=="TEST" (
	echo TEST >>build.log
	"c:\program files\borland\delphi6\bin\dcc32" -B -DDEBUG_LOG sqlthink.dpr >>build.log
) else (
	echo LIVE >>build.log
	"c:\program files\borland\delphi6\bin\dcc32" -B -$O+ -$R- -$Q- sqlthink.dpr >>build.log

       copy sqlthink.exe c:\ThinkSQLSource >>build.log
       copy sqlthink.dll c:\ThinkSQLSource >>build.log

	echo sqlthink: >>c:\ThinkSQLSource\success.log
	findstr /R "^[0-9] lines, " build.log >>c:\ThinkSQLSource\success.log
) 