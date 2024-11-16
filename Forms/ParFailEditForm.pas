unit ParFailEditForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Buttons;

type
  TForm9 = class(TForm)
    MessageText: TMemo;
    OkButton: TButton;
    Button1: TButton;
    Shape1: TShape;
    Shape2: TShape;
    SpeedButton1: TSpeedButton;
    Button2: TButton;
    procedure OkButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     DefaultMessageText:WideString;
     OkPressed:boolean;
  end;

var
  Form9: TForm9;

implementation

{$R *.DFM}

procedure TForm9.OkButtonClick(Sender: TObject);
begin
OkPressed:=true;
Close;
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
	// MessageText.Text:=trim(MessageText.Text)+trim(DefaultMessageText);
    MessageText.lines.add(trim(DefaultMessageText));
end;

procedure TForm9.FormShow(Sender: TObject);
begin
OkPressed:=false;
end;

procedure TForm9.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_ESCAPE then begin okpressed:=false; close; end;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
	okpressed:=false;
	close;
end;

end.
