unit StatisticsCalculationStyle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TStatisticsCalculationStyleForm = class(TForm)
    CheckCalculationStyleRadioGroup: TRadioGroup;
    OkButton: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure CheckCalculationStyleRadioGroupClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatisticsCalculationStyleForm: TStatisticsCalculationStyleForm;

implementation

Uses StatisticsForm,MainForm;

{$R *.DFM}

procedure TStatisticsCalculationStyleForm.Timer1Timer(Sender: TObject);
begin
//Show;

end;

procedure TStatisticsCalculationStyleForm.CheckCalculationStyleRadioGroupClick(
  Sender: TObject);
begin

if CheckCalculationStyleRadioGroup.ItemIndex=0 then begin
                                                    Form8.CalculateRedusedStatistics:=false;
                                                    Form8.StopCalculation:=false;
                                                    Form2.CalculateFullStatisticsToolButton.Down:=true;
                                                    end;

if CheckCalculationStyleRadioGroup.ItemIndex=1 then begin
                                                    Form8.CalculateRedusedStatistics:=true;
                                                    Form8.StopCalculation:=false;
                                                    Form2.CalculateRedusedStatisticsToolButton.Down:=true;
                                               end;

if CheckCalculationStyleRadioGroup.ItemIndex=2 then begin
                                                    Form8.StopCalculation:=true;
                                                    Form2.CalculateNoStatisticsToolButton.Down:=true;
                                                    end;
end;

procedure TStatisticsCalculationStyleForm.OkButtonClick(Sender: TObject);
begin
Close;
end;

procedure TStatisticsCalculationStyleForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Form8.CalculationBreak:=false;
if (CheckCalculationStyleRadioGroup.ItemIndex=0)
    or
   (CheckCalculationStyleRadioGroup.ItemIndex=1)
   then begin

     Form2.StatisticsTimer.Enabled:=true;

   end;

end;

procedure TStatisticsCalculationStyleForm.FormCreate(Sender: TObject);
begin
 Form2.StatisticsTimer.Enabled:=false;
end;

end.
