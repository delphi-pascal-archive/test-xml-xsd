unit UAbout;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, StdCtrls, ComCtrls, ExtCtrls, Forms;

type
  TFAbout = class(TForm)
    CloseButton: TButton;
    GroupBox1: TGroupBox;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Bevel1: TBevel;
    ProductLabel: TLabel;
    VersionMemo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
  end;

var
  FAbout: TFAbout;

implementation

{$R *.dfm}

procedure TFAbout.FormCreate(Sender: TObject);
begin
 with VersionMemo do
  begin
    ProgramIcon.Picture.Assign(Application.Icon);
    Lines.Add('');
    Lines.Add('Version 1.0');
    Lines.Add('');
    Lines.Add('GNU Licence');
    Lines.Add('');
  end;
end;

procedure TFAbout.CloseButtonClick(Sender: TObject);
begin
  Hide;
end;

end.

