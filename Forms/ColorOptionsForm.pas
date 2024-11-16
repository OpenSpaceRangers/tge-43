unit ColorOptionsForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, EC_BlockPar, Spin, Buttons, ExtCtrls;

Type PM=^TBlockParEC;

type
  TForm7 = class(TForm)
    B1: TButton;
    B2: TButton;
    B3: TButton;
    B6: TButton;
    B5: TButton;
    B4: TButton;
    ColorDialog1: TColorDialog;
    CancelButton: TButton;
    OkButton: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    GroupBoxStatusPanel: TGroupBox;
    StatusPanelS: TRadioButton;
    StatusPanelD: TRadioButton;
    StatusPanelX: TSpinEdit;
    StatusPanelY: TSpinEdit;
    LabelStatusPanelX: TLabel;
    LabelStatusPanelY: TLabel;
    GroupBoxSPN: TRadioGroup;
    CalculationStatisticsTimerDelayRadioGroup: TRadioGroup;
    Button12: TButton;
    Button13: TButton;
    DrawPathTypeRG: TRadioGroup;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    ParNameHelpPanelRG: TRadioGroup;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure B2Click(Sender: TObject);
    procedure B3Click(Sender: TObject);
    procedure B4Click(Sender: TObject);
    procedure B5Click(Sender: TObject);
    procedure B6Click(Sender: TObject);
    procedure B7Click(Sender: TObject);

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure StatusPanelDClick(Sender: TObject);
    procedure StatusPanelSClick(Sender: TObject);
    procedure GroupBoxSPNClick(Sender: TObject);
    procedure DrawPathTypeRGClick(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    M:PM;
    LineFromColor:TColor;
    LineToColor:TColor;
    VoidLineFromColor:TColor;
    VoidLineToColor:TColor;

    PointerColor:TColor;
    StartLocationColor:Tcolor;
    EndLocationColor:TColor;
    FailLocationColor:TColor;
    DefaultLocationColor:TColor;
    ClosedLocationColor:TColor;
    BackGroundColor:TColor;
    NoWay2Color:TColor;
    NoSuccessWaysColor:TColor;
    OneQuestionColor:TColor;
    PathHelpPanelColor:TColor;
    LocationHelpPanelColor:TColor;
    AbsPathColor:TColor;
    NotAbsPathColor:TColor;
    DrawPathType:integer;

    SameQNoDescrStartColor:TColor;
    SameQNoDescrEndColor:TColor;
    SameQDescrStartColor:TColor;
    SameQDescrEndColor:TColor;
    VoidObjectColor:TColor;
    VoidObjectStartColor:TColor;


    StatisticsCalculationTimerDelay:integer;

    StatusPanelSflag:boolean;
    SPN:integer;

    is_ok_pressed:boolean;
  end;

var
  Form7: TForm7;

implementation

{$R *.DFM}

uses MainForm;

procedure TForm7.CancelButtonClick(Sender: TObject);
begin
is_ok_pressed:=false;
Close;
end;

procedure TForm7.OkButtonClick(Sender: TObject);
begin
is_ok_pressed:=true;


        StatisticsCalculationTimerDelay:=
                (CalculationStatisticsTimerDelayRadioGroup.ItemIndex+1)*5000;
Close;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
is_ok_pressed:=true;
end;

procedure TForm7.FormPaint(Sender: TObject);
var rect:Trect;
begin

   CalculationStatisticsTimerDelayRadioGroup.ItemIndex:=
        StatisticsCalculationTimerDelay div 5000 - 1;


StatusPanelS.Checked:=StatusPanelSflag;
StatusPanelD.Checked:=not StatusPanelSflag;
GroupBoxSPN.ItemIndex:=SPN;

rect.Top:=18;
rect.Left:=170;
rect.Right:=250;
rect.Bottom:=36;

Canvas.brush.Color:=LineFromColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=LineToColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=VoidLineFromColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=VoidLineToColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=SameQDescrStartColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=SameQDescrEndColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=SameQNoDescrStartColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=SameQNoDescrEndColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=VoidObjectStartColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=VoidObjectColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=PointerColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=StartLocationColor;
Canvas.FillRect(rect);

rect.Top:=18;
rect.Left:=rect.Left + 272;
rect.Right:=rect.Right + 272;
rect.Bottom:=36;

rect.Top:=rect.Top;
rect.Bottom:=rect.Bottom;
Canvas.brush.Color:=EndLocationColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=DefaultLocationColor;
Canvas.FillRect(rect);


rect.Top:=rect.Top+40;
rect.Bottom:=rect.Bottom+40;
Canvas.brush.Color:=FailLocationColor+40;
Canvas.FillRect(rect);

rect.Top:=rect.Top+40;
rect.Bottom:=rect.Bottom+40;
Canvas.brush.Color:=ClosedLOcationColor;
Canvas.FillRect(rect);


rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=NoWay2Color;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=BackGroundColor;
Canvas.FillRect(rect);


rect.Top:=rect.Top+40;
rect.Bottom:=rect.Bottom+40;
Canvas.brush.Color:=NoSuccessWaysColor;
Canvas.FillRect(rect);
{
rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=OneQuestionColor;
Canvas.FillRect(rect);
 }
rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=PathHelpPanelColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=LocationHelpPanelColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=AbsPathColor;
Canvas.FillRect(rect);

rect.Top:=rect.Top + 40;
rect.Bottom:=rect.Bottom + 40;
Canvas.brush.Color:=NotAbsPathColor;
Canvas.FillRect(rect);
end;

procedure TForm7.B1Click(Sender: TObject);
begin
if ColorDialog1.Execute then LineFromColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.B2Click(Sender: TObject);
begin
if ColorDialog1.Execute then LineToColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.B3Click(Sender: TObject);
begin
if ColorDialog1.Execute then PointerColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.B4Click(Sender: TObject);
begin
if ColorDialog1.Execute then StartLocationColor:=ColorDialog1.Color;
repaint;

end;

procedure TForm7.B5Click(Sender: TObject);
begin
if ColorDialog1.Execute then EndLocationColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.B6Click(Sender: TObject);
begin
if ColorDialog1.Execute then DefaultLocationColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.B7Click(Sender: TObject);
begin
if ColorDialog1.Execute then NoWay2Color:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
    LineFromColor:=TColor($00FFFFFF);
    LineToColor:=TColor($00FF0000);
    VoidLineFromColor:=TColor($00FFdd00);
    VoidLineToColor:=TColor($00AAAA00);
    PointerColor:=TColor($00FF0000);
    StartLocationColor:=TColor($00FF5555);
    EndLocationColor:=TColor($0000FF00);
    FailLocationColor:=TColor($000000AA);
    DefaultLocationColor:=TColor($00FFFFFF);
    ClosedLocationColor:=TColor($000000FF);
    BackGroundColor:=TColor($00aaaaaa);
    NoWay2Color:=TColor($00EB57FB);
    NoSuccessWaysColor:=TColor($004080FF);
    OneQuestionColor:=TColor($00400080);
    PathHelpPanelColor:=TColor($0098E2E7);//TColor($00B8F1F0);
    LocationHelpPanelColor:=TColor($0098E2E7);
    AbsPathColor:=TColor($00ff0000);
    NotAbsPathColor:=TColor($000000ff);
	DrawPathType:=0;
    DrawPathTypeRG.ItemIndex:=0;
    ParNameHelpPanelRG.ItemIndex:=2;

    SameQNoDescrStartColor:=TColor($0096c8f5);
    SameQNoDescrEndColor:=TColor($00000080);
    SameQDescrStartColor:=TColor($00ffffff);
    SameQDescrEndColor:=TColor($00000080);
    VoidObjectColor:=TColor($00004000);
    VoidObjectStartColor:=TColor($00FFFFFF);

    StatisticsCalculationTimerDelay:=5000;
    CalculationStatisticsTimerDelayRadioGroup.ItemIndex:=
        StatisticsCalculationTimerDelay div 5000 - 1;

    SPN:=8;
    StatusPanelSflag:=True;

    repaint;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
if ColorDialog1.Execute then FailLocationColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
if ColorDialog1.Execute then VoidLineFromColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.Button4Click(Sender: TObject);
begin
if ColorDialog1.Execute then VoidLineToColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.Button5Click(Sender: TObject);
begin

if ColorDialog1.Execute then ClosedLocationColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.Button6Click(Sender: TObject);
begin
if ColorDialog1.Execute then BackGroundColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.Button8Click(Sender: TObject);
begin
if ColorDialog1.Execute then NoSuccessWaysColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.Button9Click(Sender: TObject);
begin
if ColorDialog1.Execute then OneQuestionColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.Button10Click(Sender: TObject);
begin
if ColorDialog1.Execute then PathHelpPanelColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.Button11Click(Sender: TObject);
begin
if ColorDialog1.Execute then locationHelpPanelColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.StatusPanelDClick(Sender: TObject);
begin
StatusPanelSFlag:=false;
end;

procedure TForm7.StatusPanelSClick(Sender: TObject);
begin
StatusPanelsflag:=true;
end;

procedure TForm7.GroupBoxSPNClick(Sender: TObject);
begin
 SPN:=GroupBoxSPN.ItemIndex;
end;

procedure TForm7.DrawPathTypeRGClick(Sender: TObject);
begin
DrawPathType:=DrawPathTypeRG.ItemIndex;
end;

procedure TForm7.Button12Click(Sender: TObject);
begin
if ColorDialog1.Execute then AbsPathColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.Button13Click(Sender: TObject);
begin
if ColorDialog1.Execute then NotAbsPathColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
DrawPathTypeRG.ItemIndex:=DrawPathType;

end;

procedure TForm7.Button15Click(Sender: TObject);
begin
if ColorDialog1.Execute then SameQNoDescrStartColor:=ColorDialog1.Color;
repaint;

end;

procedure TForm7.Button14Click(Sender: TObject);
begin
if ColorDialog1.Execute then SameQNoDescrEndColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.Button16Click(Sender: TObject);
begin
if ColorDialog1.Execute then VoidObjectColor:=ColorDialog1.Color;
repaint;
end;
procedure TForm7.Button17Click(Sender: TObject);
begin
Form2.ChooseFont;
end;

procedure TForm7.Button18Click(Sender: TObject);
begin
if ColorDialog1.Execute then VoidObjectStartColor:=ColorDialog1.Color;
repaint;
end;

procedure TForm7.Button20Click(Sender: TObject);
begin
if ColorDialog1.Execute then SameQDescrStartColor:=ColorDialog1.Color;
repaint;

end;

procedure TForm7.Button19Click(Sender: TObject);
begin
if ColorDialog1.Execute then SameQDescrEndColor:=ColorDialog1.Color;
repaint;

end;

end.
