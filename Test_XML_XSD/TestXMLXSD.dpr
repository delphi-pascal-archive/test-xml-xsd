program TestXMLXSD;

uses
  Forms,
  XSDValidator in 'XSDValidator.pas',
  UMain in 'UMain.pas' {FMain},
  UAbout in 'UAbout.pas' {FAbout},
  MSXML2_TLB in 'MSXML2_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title:='TestXMLXSD';
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFAbout, FAbout);
  Application.Run;
end.
