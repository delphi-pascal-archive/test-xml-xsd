unit UMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XSDValidator;

type
  TFMain = class(TForm)
    BtLoadXml: TButton;
    MeXml: TMemo;
    BtLoadXsd: TButton;
    BtValidate: TButton;
    BtReset: TButton;
    Button1: TButton;
    procedure BtLoadXmlClick(Sender: TObject);
    procedure BtLoadXsdClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtResetClick(Sender: TObject);
    procedure BtValidateClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FMain: TFMain;
  Validator: TXSDValidator;
  
  function droite(substr: string; s: string): string;
  function droiteDroite(substr: string; s: string): string;

implementation

uses
  UAbout;

{$R *.dfm}

function droite(substr: string; s: string): string;
begin
  if pos(substr,s)=0 then
    result := ''
  else
    result := copy( s,
                    pos(substr, s)+length(substr),
                    length(s)-pos(substr, s)+length(substr) );
end;

function droiteDroite(substr: string; s: string): string;
begin
  Repeat
    S:=droite(substr,s);
  until pos(substr,s)=0;
  result:=S;
end;

/////////////////////////////////////////////

procedure TFMain.FormActivate(Sender: TObject);
begin
   Validator:= TXSDValidator.Create;
   MeXml.Clear;
end;

procedure TFMain.BtLoadXmlClick(Sender: TObject);
var
  XMLOpenDialog: TOpenDialog;
begin
  XMLOpenDialog := TOpenDialog.Create(self);
  XMLOpenDialog.Filter := 'File XML (*.xml)|*.xml';

  if XMLOpenDialog.Execute then
  begin
    if not Validator.ParseXmlFile( XMLOpenDialog.FileName ) then
    begin
      MeXml.Lines.Add('-- XML no parse: '+#13+#10+droiteDroite('\', XMLOpenDialog.FileName) );
      MeXml.Lines.Add(Validator.Error);
    end
    else
      MeXml.Lines.Add('--- File XML: '+#13+#10+droiteDroite('\', XMLOpenDialog.FileName) );
  end;
end;

procedure TFMain.BtLoadXsdClick(Sender: TObject);
var
  XSDOpenDialog: TOpenDialog;
begin
  XSDOpenDialog := TOpenDialog.Create(self);
  XSDOpenDialog.Filter := 'File XSD (*.xsd)|*.xsd';
  if XSDOpenDialog.Execute then
  begin
    if not Validator.AddXsdFile( XSDOpenDialog.FileName ) then
    begin
      MeXml.Lines.Add('-- XSD no parse: '+#13+#10+droiteDroite('\', XSDOpenDialog.FileName) );
      MeXml.Lines.Add(Validator.Error);
    end
    else
      MeXml.Lines.Add('--- XSD added: '+#13+#10+droiteDroite('\', XSDOpenDialog.FileName) );
  end;
end;

procedure TFMain.BtResetClick(Sender: TObject);
begin
  Validator := TXSDValidator.Create;
  MeXml.Clear;
end;

procedure TFMain.BtValidateClick(Sender: TObject);
begin
  MeXml.Lines.Add('--- Validation ---');
  if Validator.Valid
  then
    MeXml.Lines.Add( 'XML Valide' )
  else
    MeXml.Lines.Add( Validator.Error );
end;

procedure TFMain.Button1Click(Sender: TObject);
begin
  FAbout.Show;
end;

end.
