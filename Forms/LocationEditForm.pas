unit LocationEditForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Math,
  LocationClass,
  ParameterClass,
  ParameterDeltaClass,
  CalcParseClass,
  StdCtrls, EC_BlockPar, ComCtrls,  ExtCtrls,
  MessageText, Tabs, CheckLst;

type PM=^TBlockParEC;
type PRB=^TRadioButton;

type
  TForm1 = class(TForm)
    VoidFlagPanel: TPanel;
    IsLocationStartCheck: TCheckBox;
    IsLocationEndCheck: TCheckBox;
    LocationDescriptionEdit: TMemo;
    
    IsLocationFailCheck: TCheckBox;
    OkButton: TButton;
    CancelButton: TButton;
    PlayerDeathCheckBox: TCheckBox;
    ParCustomizePanel: TPanel;
    Shape19: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Shape22: TShape;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ParDeltaTrackBar: TTrackBar;
    DeltaTypeGroupBox: TGroupBox;
    DeltaValueRadioBtn: TRadioButton;
    DeltaPercentRadioBtn: TRadioButton;
    MinGateEdit: TEdit;
    MaxGateEdit: TEdit;
    ParViewActionRG: TRadioGroup;
    StatisticsLabel: TLabel;
    RedrawStatistsicsTimer: TTimer;
    ParCriticalMessageMemo: TMemo;
    CostOneDayCheckBox: TCheckBox;
    LocationDescriptionVariantRG: TRadioGroup;
    LocationDescriptionViewOrderRG: TRadioGroup;
    Shape21: TShape;
    LDV_RG: TGroupBox;
    VRB1: TRadioButton;
    VRB2: TRadioButton;
    VRB3: TRadioButton;
    VRB4: TRadioButton;
    VRB9: TRadioButton;
    VRB10: TRadioButton;
    VRB5: TRadioButton;
    VRB6: TRadioButton;
    VRB7: TRadioButton;
    VRB8: TRadioButton;
    DeltaApprRadioBtn: TRadioButton;
    VoidLocationCheckBox: TCheckBox;
    DeltaNonExprPanel: TPanel;
    Shape3: TShape;
    TrackBarGroundShape: TShape;
    TrackBarRightImage: TImage;
    TrackBarLeftImage: TImage;
    ParMinLabel: TLabel;
    ParValueLabel: TLabel;
    ParMaxLabel: TLabel;
    TrackBarButtonShape: TShape;
    DeltaExprPanel: TPanel;
    ExpressionEdit: TEdit;
    DeltaExprRadioBtn: TRadioButton;
    SymWarnLabel: TLabel;
    ParenthesErrorLabel: TLabel;
    DiapErrorLabel: TLabel;
    ParameterErrorLabel: TLabel;
    ValueErrorLabel: TLabel;
    ParseOkLabel: TLabel;
    Shape6: TShape;
    LOrdPanel: TPanel;
    LOrdExprEdit: TEdit;
    LOrdSymWarnLabel: TLabel;
    LOrdParenthesesErrorLabel: TLabel;
    LOrdDiapErrorLabel: TLabel;
    LOrdParameterErrorLabel: TLabel;
    LOrdValueErrorLabel: TLabel;
    LOrdParseOkLabel: TLabel;
    ParList: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure IsLocationStartCheckClick(Sender: TObject);
    procedure IsLocationEndCheckClick(Sender: TObject);

    procedure process_enabled_controls;
    //procedure ProcessParTab(nt:integer);
    //procedure ProcessTabParSelect(nt:integer);

    procedure OnShow(Sender: TObject);
    procedure IsLocationFailCheckClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LocationNameEditKeyPress(Sender: TObject; var Key: Char);
    procedure PlayerDeathCheckBoxClick(Sender: TObject);
    procedure LocationDescriptionEditChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ParRadioButton1Click(Sender: TObject);
    procedure ParRadioButton2Click(Sender: TObject);
    procedure ParRadioButton3Click(Sender: TObject);
    procedure ParRadioButton4Click(Sender: TObject);
    procedure ParRadioButton5Click(Sender: TObject);
    procedure ParRadioButton6Click(Sender: TObject);
    procedure ParRadioButton7Click(Sender: TObject);
    procedure ParRadioButton8Click(Sender: TObject);
    procedure ParRadioButton9Click(Sender: TObject);
    procedure ParDeltaTrackBarChange(Sender: TObject);
    procedure ParViewActionRGClick(Sender: TObject);
    procedure DeltaValueRadioBtnClick(Sender: TObject);
    procedure DeltaPercentRadioBtnClick(Sender: TObject);
    procedure ParCriticalMessageMemoChange(Sender: TObject);
    procedure MinGateEditChange(Sender: TObject);
    procedure MaxGateEditChange(Sender: TObject);

    procedure DrawStatistics;
    procedure RedrawParTrackBar;
    procedure RedrawStatistsicsTimerTimer(Sender: TObject);
    procedure TrackBarGroundShapeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarGroundShapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarGroundShapeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarLeftImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarRightImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarLeftImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarRightImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton10Click(Sender: TObject);
    procedure ParRadioButton11Click(Sender: TObject);
    procedure ParRadioButton12Click(Sender: TObject);
    procedure CostOneDayCheckBoxClick(Sender: TObject);
    procedure LocationDescriptionVariantRGClick(Sender: TObject);
    procedure LocationDescriptionViewOrderRGClick(Sender: TObject);

    procedure ColorVRBS;

    procedure VRB1Click(Sender: TObject);
    procedure VRB2Click(Sender: TObject);
    procedure VRB3Click(Sender: TObject);
    procedure VRB4Click(Sender: TObject);
    procedure VRB5Click(Sender: TObject);
    procedure VRB6Click(Sender: TObject);
    procedure VRB7Click(Sender: TObject);
    procedure VRB8Click(Sender: TObject);
    procedure VRB9Click(Sender: TObject);
    procedure VRB10Click(Sender: TObject);
    procedure DeltaApprRadioBtnClick(Sender: TObject);
    procedure VoidLocationCheckBoxClick(Sender: TObject);
    {procedure ParTabSetChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure ParRadioButton13Click(Sender: TObject);
    procedure ParRadioButton14Click(Sender: TObject);
    procedure ParRadioButton15Click(Sender: TObject);
    procedure ParRadioButton16Click(Sender: TObject);
    procedure ParRadioButton17Click(Sender: TObject);
    procedure ParRadioButton18Click(Sender: TObject);
    procedure ParRadioButton19Click(Sender: TObject);
    procedure ParRadioButton20Click(Sender: TObject);
    procedure ParRadioButton21Click(Sender: TObject);
    procedure ParRadioButton22Click(Sender: TObject);
    procedure ParRadioButton23Click(Sender: TObject);
    procedure ParRadioButton24Click(Sender: TObject);
    procedure ParTabSetClick(Sender: TObject);}
    procedure ExpressionEditChange(Sender: TObject);
    procedure DeltaExprRadioBtnClick(Sender: TObject);

    function GetSelectedParameter:integer;
    procedure ProcessParRadioButtonClick;
    procedure LOrdExprEditChange(Sender: TObject);

    procedure ParListClick(Sender: TObject);
    function ParListGetItem(i: integer): string;
    procedure ParListSetItem(i: integer; s: string);
    procedure ParListClickCheck(Sender: TObject);

  private
    { Private declarations }
  public

    { Public declarations }
    M:PM;
    is_ok_pressed:boolean;
    FormLocation: TLocation;
    CanCheckStartLocation:boolean;

    //    cancel_confirm:boolean;
    OldLocation:TLocation;

    //ParRadioButtons:array [1..maxparameters] of TRadioButton;
    //ParGateLabels: array [1..maxparameters] of TLabel;
    //ParDeltaLabels:array [1..maxparameters] of TLabel;
    ParMaxes, ParMins: array [1..maxparameters] of integer;
    //LPEA: array [1..maxparameters] of TLabel;

    tempDPars: array [1..maxparameters] of TParameterDelta;
    SelectedParameter:integer;

    WeMakingANewLocation: boolean;
    //     FormJustOpened:boolean;

    QuestLocationIndex:integer;

    PVRBA:array [1..10] of PRB;

    OpeningForm: boolean;
end;

var
  Form1: TForm1;


implementation
{$R *.DFM}

uses MainForm, StatisticsForm;


procedure Tform1.DrawStatistics;
begin
  if not Form2.Game.Locations[QuestLocationIndex].IsEqualWith(FormLocation) then begin
    Form2.Game.Locations[QuestLocationIndex].CopyDataFrom(FormLocation);
    Form2.TraceForClosedLocations;
    Process_Enabled_Controls;
  end;
end;

procedure Tform1.ColorVRBS;
var
  i:integer;
begin
  for i:=1 to 10 do begin
    if trim(FormLocation.LocationDescriptions[i].Text)<>'' then PVRBA[i]^.Font.Color:=clBlack
    else PVRBA[i]^.Font.Color:=clGray;
  end;
end;

procedure Tform1.RedrawParTrackBar;
var
  range:integer;
  currentposition:integer;
  dmax:integer;
  dmin:integer;
begin
if FormLocation.DPars[SelectedParameter].DeltaApprFlag then begin

	 dmax:=Form2.Game.Pars[SelectedParameter].max;
	 dmin:=Form2.Game.Pars[SelectedParameter].min;
 	 range:=dmax-dmin;

     currentposition:=
       trunc(
             (
              (ParDeltaTrackBar.Position-dmin)/(Range)
             )
              *
              TrackBarGroundShape.Width
           )
       +
       TrackBarGroundShape.Left;

     TrackBarButtonShape.Left:=currentposition - TrackBarButtonShape.Width div 2;
end else begin

	if FormLocation.DPars[SelectedParameter].DeltaPercentFlag then dmax:=100
	else dmax:=Math.max(abs(Form2.Game.Pars[SelectedParameter].min),abs(Form2.Game.Pars[SelectedParameter].max));

     range:=abs(dmax);

     currentposition:=
       trunc(
             (
              (ParDeltaTrackBar.Position+range)
               /
              (2*Range)
              )
              *
              TrackBarGroundShape.Width
             )
       +
       TrackBarGroundShape.Left;

     TrackBarButtonShape.Left:=currentposition - TrackBarButtonShape.Width div 2;
end;

end;


procedure Tform1.ProcessParRadioButtonClick;
begin
//FormJustOpened:=true;
  SelectedParameter:=GetSelectedParameter;
  if SelectedParameter<>0 then 
  ExpressionEdit.Text:=FormLocation.DPars[SelectedParameter].Expression.Text;
  Process_enabled_controls;
end;

function TForm1.GetSelectedParameter:integer;
var
  i: integer;
  //answer: integer;
begin
  i:=ParList.ItemIndex + 1;
  if(i <> 0) then ParCustomizePanel.Visible:=ParList.ItemEnabled[i-1]; //(i <> 0);
  GetSelectedParameter:=i;
  {answer:=0;
  if ParTabset.TabIndex=0 then begin
    for i:=1 to 12 do if (ParRadioButtons[i].Visible) and (ParRadioButtons[i].checked) then answer:=i;
  end
  else begin
    for i:=13 to maxparameters do if (ParRadioButtons[i].Visible) and (ParRadioButtons[i].checked) then answer:=i;
  end;
  if answer=0 then ParCustomizePanel.Visible:=false
  else ParCustomizePanel.Visible:=true;

  ProcessTabParSelect(ParTabset.tabindex);

  GetSelectedParameter:=answer;}
end;

procedure TForm1.OnShow(Sender:TObject);
var
  i:integer;
  //f1_12par,f13_24par:boolean;
begin

	ActiveControl:=CancelButton;

  {f1_12par:=false;
  for i:=1 to 12 do if Form2.Game.Pars[i].Enabled then f1_12par:=true;
  f13_24par:=false;
  for i:=13 to 24 do if Form2.Game.Pars[i].Enabled then f13_24par:=true;

  if f1_12par and f13_24par then begin
    ParTabSet.Visible:=true;
    ParTabSet1_12.Visible:=false;
    ParTabSet13_24.Visible:=false;
  end;
  if f1_12par and not f13_24par then begin
    ParTabSet.Visible:=false;
    ParTabSet.TabIndex:=0;
    ParTabSet1_12.Visible:=true;
    ParTabSet13_24.Visible:=false;
  end;
  if not f1_12par and f13_24par then begin
    ParTabSet.Visible:=false;
    ParTabSet.TabIndex:=1;
    ParTabSet1_12.Visible:=false;
    ParTabSet13_24.Visible:=true;
  end;
  if not f1_12par and not f13_24par then begin
    ParTabSet.Visible:=false;
    ParTabSet.TabIndex:=0;
    ParTabSet1_12.Visible:=false;
    ParTabSet13_24.Visible:=false;
  end;}

  OpeningForm:=true;

  for i:=1 to maxparameters do
    if(ParList.ItemEnabled[i-1]) then ParList.Checked[i-1]:=true;

  FormLocation.CopyDataFrom(Form2.Game.Locations[QuestLocationIndex]);
  //showMessage(FormLocation.LocationDescription.Text);

  OldLocation.CopyDataFrom(FormLocation);
  // showmessage(FormLocation.LocationDescriptions[1].text);
  //ShowMessage(FormLocation.LocationDescription.Text);
  LocationDescriptionEdit.Text:=trim(FormLocation.LocationDescriptions[1].text);

  for i:=1 to 10 do PVRBA[i]^.Checked:=false;

  VRB1.Checked:=true;
  LocationDescriptionVariantRG.ItemIndex:=0;
  ColorVRBS;

  if FormLocation.RandomShowLocationDescriptions then i:=1
  else i:=0;
  LocationDescriptionViewOrderRG.ItemIndex:=i;
  is_ok_pressed:=false;



  SelectedParameter:=0;
  for i:=1 to maxparameters do tempDPars[i].CopyDataFrom(FormLocation.DPars[i]);

  //  LocationDescriptionEdit.Text:=trim(FormLocation.LocationDescription.Text);
  
  IsLocationStartCheck.Checked:=FormLocation.StartLocationFlag;
  IsLocationEndCheck.Checked:=FormLocation.EndLocationFlag;
  IsLocationFailCheck.Checked:=FormLocation.FailLocationFlag;
  PlayerDeathCheckBox.checked:=FormLocation.PlayerDeath;
  VoidLocationCheckBox.Checked:=FormLocation.VoidLocation;

  if WeMakingANewLocation then DrawStatistics;
  process_enabled_controls;
  if SelectedParameter>0 then begin
    ExpressionEdit.Text:=trim(FormLocation.DPars[SelectedParameter].Expression.Text);
  end;
  LOrdPanel.Visible:=(LocationDescriptionViewOrderRG.ItemIndex=1) and (LocationDescriptionViewOrderRG.Enabled);
  LOrdExprEdit.Text:=trim(FormLocation.LocDescrExprOrder.Text);
  OpeningForm:=false;
end;

procedure TForm1.process_enabled_controls;
label jump,jump1;
var
  i,cmin,cmax,value: integer;
  flag: boolean;
  tstr: string;
  parse: TCalcParse;
  temp: string;
begin
	ColorVRBS;

  {for i:=1 to maxparameters do begin
    case FormLocation.DPars[i].ParameterViewAction of
      ShowParameter:ParRadioButtons[i].Caption:=trim(Form2.Game.Pars[i].Name.Text)+' (показать)';
      HideParameter:ParRadioButtons[i].Caption:=trim(Form2.Game.Pars[i].Name.Text)+' (скрыть)';
      StayAsIs:ParRadioButtons[i].Caption:=trim(Form2.Game.Pars[i].Name.Text);
    end;
  end;}

  if FormLocation.DaysCost=1 then CostOneDayCheckBox.checked:=true
  else CostOneDayCheckBox.checked:=false;

  if FormLocation.ValueOfLocationDescriptions<=1 then LocationDescriptionViewOrderRG.Enabled:=false
  else LocationDescriptionViewOrderRG.Enabled:=true;

  if Form2.CalculateNoStatisticsToolButton.Down then begin
    Statisticslabel.Caption:='L '+inttostr(FormLocation.LocationNumber);
  end else begin
    StatisticsLabel.Caption:=
      Form2.myinttostr(form8.LocationReaches[QuestLocationIndex]) + ' -> ' +
      Form2.myinttostr(form8.SuccessReaches[QuestLocationIndex]);
  end;

  {SelectedParameter:=0;
  if ParTabset.TabIndex=0 then begin
    for i:=1 to 12 do if (ParRadioButtons[i].Visible) and (ParRadioButtons[i].checked) then SelectedParameter:=i;
  end
  else begin
    for i:=13 to maxparameters do if (ParRadioButtons[i].Visible) and (ParRadioButtons[i].checked) then SelectedParameter:=i;
  end;

  ProcessTabParSelect(ParTabset.tabindex);}

  SelectedParameter:=GetSelectedParameter();

  for i:=1 to maxparameters do begin
    with FormLocation.DPars[i] do begin

      {ParGateLabels[i].Caption:='[ ' + inttostr(Min) + ' .. ' + inttostr(Max) + ' ]';

      if DeltaExprFlag then begin
        ParDeltaLabels[i].Visible:=true;
        ParDeltaLabels[i].Enabled:=true;
        temp:=trim(Expression.Text);
        if temp<>'' then temp:=':= '+temp;
        ParDeltaLabels[i].Caption:=temp;
      end else begin
        if (delta>0)and(not DeltaApprFlag) then ParDeltaLabels[i].Caption:='+'+inttostr(delta)
        else ParDeltaLabels[i].Caption:=inttostr(delta);

        if (not DeltaApprFlag)and(DeltaPercentFlag) then ParDeltaLabels[i].Caption:=ParDeltaLabels[i].Caption+'%';
        if (Delta=0)and(not DeltaApprFlag) then ParDeltaLabels[i].Visible:=false else ParDeltaLabels[i].Visible:=true;
        if DeltaApprFlag then ParDeltaLabels[i].Caption:=':= '+ParDeltaLabels[i].Caption;
        if //(tempdpars[i].DeltaPercentFlag=FormLocation.DPars[i].DeltaPercentFlag)
        // and
        (Delta=0)and(not DeltaApprFlag) then ParDeltaLabels[i].Enabled:=false else ParDeltaLabels[i].Enabled:=true;
      end;

      if (min=Parmins[i])and(max=Parmaxes[i])then ParGateLabels[i].Enabled:=false else ParGateLabels[i].Enabled:=true;}

      tstr:=trim(Form2.Game.Pars[i].Name.Text);

      if(min = Parmins[i]) and (max = Parmaxes[i]) then temp:=''
      else temp:='  [ ' + IntToStr(Min) + ' .. ' + IntToStr(Max) + ' ]';

      if DeltaExprFlag then begin
        temp:=trim(Expression.Text);
        if temp<>'' then tstr:=tstr + '  = ' + temp;

      end else begin
        if(delta <> 0) or (DeltaApprFlag) then begin

          temp:='  ';
          if DeltaApprFlag then temp:=temp + '=';

          if(delta > 0) and (not DeltaApprFlag) then temp:=temp + '+';
          temp:=temp + IntToStr(delta);
          if DeltaPercentFlag then temp:=temp + '%';

          if(temp <> '') then tstr:=tstr + temp;
        end;
      end;

      case ParameterViewAction of
        ShowParameter: tstr:=tstr + ' (показать)';
        HideParameter: tstr:=tstr + ' (скрыть)';
      end;

      case Form8.ParameterActiveLocations[QuestLocationIndex][i] of
        FailParType : begin
          tstr:='#' + tstr;
        end;
        SuccessParType: begin
          tstr:='^' + tstr;
        end;
      end;

      ParListSetItem(i, tstr);
    end;
  end;

  {for i:=1 to maxparameters do begin
    case Form8.ParameterActiveLocations[QuestLocationIndex][i] of
      FailParType : begin
        ParRadioButtons[i].Font.Color:=clRed;
        ParGateLabels[i].Font.Color:=clRed;
        ParDeltaLabels[i].Font.Color:=clRed;
      end;
      SuccessParType: begin
        ParRadioButtons[i].Font.Color:=clGreen;
        ParGateLabels[i].Font.Color:=clGreen;
        ParDeltaLabels[i].Font.Color:=clGreen;
      end;
      NoCriticalParType: begin
        ParRadioButtons[i].Font.Color:=clBlack;
        ParGateLabels[i].Font.Color:=clBlack;
        ParDeltaLabels[i].Font.Color:=clBlack;
      end;
    end;
  end;}

  if SelectedParameter<>0 then begin
    parse:=TCalcParse.Create;
    tstr:=trim(FormLocation.DPars[SelectedParameter].Expression.Text);
    parse.AssignAndPreprocess(trim(ExpressionEdit.Text),SelectedParameter);
    if ((tstr<>parse.ConvertToExternal(parse.internal_str))and(not parse.default_expression)) then ExpressionEdit.Text:=FormLocation.DPars[SelectedParameter].Expression.Text;
    parse.Destroy;

    if MinGateEdit.text=inttostr(Form2.Game.Pars[SelectedParameter].GetDefaultMinGate) then
      MinGateEdit.Font.Color:=clGray else MinGateEdit.Font.Color:=clBlack;

    if MaxGateEdit.text=inttostr(Form2.Game.Pars[SelectedParameter].GetDefaultMaxGate) then
      MaxGateEdit.Font.Color:=clGray else MaxGateEdit.Font.Color:=clBlack;

    with FormLocation.DPars[SelectedParameter] do begin
      MinGateEdit.Text:=inttostr(min);
      MaxGateEdit.Text:=inttostr(max);

      ParCriticalMessageMemo.Text:=(CriticalMessage.text);
      if (trim(CriticalMessage.text)='') or (trim( ParCriticalMessageMemo.Text)='') then begin
        ParCriticalMessageMemo.text:='';
        ParCriticalMessageMemo.text:=trim(Form2.Game.Pars[SelectedParameter].CriticalMessage.Text);
        ParCriticalMessageMemo.Font.Color:=clGray;
      end else ParCriticalMessageMemo.Font.Color:=clBlack;

      flag:=not (Form2.Game.Pars[SelectedParameter].ParType=NoCriticalParType);
      case Form8.ParameterActiveLocations[QuestLocationIndex][SelectedParameter] of
        FailParType : ParCriticalMessageMemo.Font.Color:=clRed; //ParCritcalTypeShape.Pen.Color:=clRed;
        SuccessParType: ParCriticalMessageMemo.Font.Color:=clGreen; //ParCritcalTypeShape.Pen.Color:=clGreen;
        NoCriticalParType: begin
        //                                       flag:=false;
          //ParCritcalTypeShape.Pen.Color:=clGray;
          ParCriticalMessageMemo.Font.Color:=clBlack;
        end;
      end;

      //CriticalMessageBackgroundShape.Visible:=flag;
      //ParCritcalTypeShape.Visible:=flag;
      ParCriticalMessageMemo.Visible:=flag;

      //                CriticalMessageBackgroundShape.Visible:=true;
      //                ParCritcalTypeShape.Visible:=true;
      //                ParCriticalMessageMemo.Visible:=true;


      ParViewActionRG.ItemIndex:=ParameterViewAction;
      value:=delta;
      if DeltaApprFlag then begin
        DeltaExprPanel.Visible:=false;
        DeltaApprRadioBtn.Checked:=true;
        ParDeltaTrackBar.min:=Form2.Game.Pars[SelectedParameter].min;
        ParDeltaTrackBar.max:=Form2.Game.Pars[SelectedParameter].max;
        ParMinLabel.Caption:=inttostr(Form2.Game.Pars[SelectedParameter].min);
        ParMaxLabel.Caption:=inttostr(Form2.Game.Pars[SelectedParameter].max);
        delta:=value;
        ParDeltaTrackBar.Position:=delta;
      end else begin

        if DeltaExprFlag then begin
          DeltaExprPanel.Visible:=true;
          DeltaExprRadioBtn.Checked:=true;
        end else begin
          DeltaExprPanel.Visible:=false;
          if DeltaPercentFlag then begin
            DeltaPercentRadioBtn.Checked:=true;
            ParDeltaTrackBar.min:=-100;
            ParDeltaTrackBar.max:=100;
            ParMinLabel.Caption:='-100%';
            ParMaxLabel.Caption:='+100%';
            delta:=value;
            ParDeltaTrackBar.Position:=delta;
          end else begin
            cmax:=Math.max(abs(Form2.Game.Pars[SelectedParameter].min),abs(Form2.Game.Pars[SelectedParameter].max));
            cmin:=-cmax;
            DeltaValueRadioBtn.Checked:=true;
            ParDeltaTrackBar.min:=cmin;
            ParDeltaTrackBar.max:=cmax;
            ParMinLabel.Caption:=inttostr(cmin);
            ParMaxLabel.Caption:='+'+inttostr(cmax);
            delta:=value;
            ParDeltaTrackBar.Position:=delta;
          end;
        end;
      end;
    end;
  end;

  if FormLocation.StartLocationFlag then begin
    IsLocationEndCheck.Checked:=false;
    IsLocationEndCheck.enabled:=false;
    IsLocationFailCheck.Checked:=false;
    IsLocationFailCheck.enabled:=false;
    PlayerDeathCheckBox.Enabled:=false;
    PlayerDeathCheckBox.Checked:=false;
    goto jump1;
  end else begin
    IsLocationEndCheck.enabled:=true;
    IsLocationFailCheck.enabled:=true;
  end;

  if FormLocation.EndLocationFlag then begin
    IsLocationStartCheck.Checked:=false;
    IsLocationStartCheck.enabled:=false;
    IsLocationFailCheck.Checked:=false;
    IsLocationFailCheck.enabled:=false;
    PlayerDeathCheckBox.Enabled:=false;
    PlayerDeathCheckBox.Checked:=false;
    goto jump;
  end else begin
    IsLocationStartCheck.enabled:=true;
    IsLocationFailCheck.enabled:=true;
  end;

  if FormLocation.FailLocationFlag then begin
    IsLocationEndCheck.Checked:=false;
    IsLocationEndCheck.enabled:=false;
    IsLocationStartCheck.Checked:=false;
    IsLocationStartCheck.enabled:=false;
    PlayerDeathCheckBox.Enabled:=true;
    goto jump;
  end else begin
    IsLocationEndCheck.enabled:=true;
    IsLocationStartCheck.enabled:=true;
    PlayerDeathCheckBox.Enabled:=false;
    PlayerDeathCheckBox.Checked:=false;
  end;

jump1:
  IsLocationStartCheck.Enabled:=CanCheckStartLocation;
  VoidLocationCheckBox.Enabled:=not IsLocationStartCheck.Checked;

jump:
  if not WeMakingANewLocation then begin
    flag:=not OldLocation.IsEqualWith(FormLocation);
    OkButton.Enabled:=flag;
  end else OkButton.Enabled:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
begin
  //ProcessParTab(ParTabSet.TabIndex);
  //ProcessTabParSelect(ParTabSet.TabIndex);

  for i:=1 to maxparameters do ParList.AddItem(IntToStr(i), Sender); // added by Koc
  ParList.ItemIndex:=0;

  OldLocation:=TLocation.Create(0,LocationClass.PM(M));
  FormLocation:=TLocation.Create(0,LocationClass.PM(M));

  M:=@MessageText.M;

  for i:=1 to maxparameters do tempDPars[i]:=TParameterDelta.Create(i);

{LPEA[1]:=LPE1;
LPEA[2]:=LPE2;
LPEA[3]:=LPE3;
LPEA[4]:=LPE4;
LPEA[5]:=LPE5;
LPEA[6]:=LPE6;
LPEA[7]:=LPE7;
LPEA[8]:=LPE8;
LPEA[9]:=LPE9;
LPEA[10]:=LPE10;
LPEA[11]:=LPE11;
LPEA[12]:=LPE12;
LPEA[13]:=LPE13;
LPEA[14]:=LPE14;
LPEA[15]:=LPE15;
LPEA[16]:=LPE16;
LPEA[17]:=LPE17;
LPEA[18]:=LPE18;
LPEA[19]:=LPE19;
LPEA[20]:=LPE20;
LPEA[21]:=LPE21;
LPEA[22]:=LPE22;
LPEA[23]:=LPE23;
LPEA[24]:=LPE24;}


{ParRadioButtons[1]:=ParRadiobutton1;
ParGateLabels[1]:=ParGateLabel1;
ParDeltaLabels[1]:=ParDeltaLabel1;

ParRadioButtons[2]:=ParRadiobutton2;
ParGateLabels[2]:=ParGateLabel2;
ParDeltaLabels[2]:=ParDeltaLabel2;

ParRadioButtons[3]:=ParRadiobutton3;
ParGateLabels[3]:=ParGateLabel3;
ParDeltaLabels[3]:=ParDeltaLabel3;

ParRadioButtons[4]:=ParRadiobutton4;
ParGateLabels[4]:=ParGateLabel4;
ParDeltaLabels[4]:=ParDeltaLabel4;

ParRadioButtons[5]:=ParRadiobutton5;
ParGateLabels[5]:=ParGateLabel5;
ParDeltaLabels[5]:=ParDeltaLabel5;

ParRadioButtons[6]:=ParRadiobutton6;
ParGateLabels[6]:=ParGateLabel6;
ParDeltaLabels[6]:=ParDeltaLabel6;

ParRadioButtons[7]:=ParRadiobutton7;
ParGateLabels[7]:=ParGateLabel7;
ParDeltaLabels[7]:=ParDeltaLabel7;

ParRadioButtons[8]:=ParRadiobutton8;
ParGateLabels[8]:=ParGateLabel8;
ParDeltaLabels[8]:=ParDeltaLabel8;

ParRadioButtons[9]:=ParRadiobutton9;
ParGateLabels[9]:=ParGateLabel9;
ParDeltaLabels[9]:=ParDeltaLabel9;

ParRadioButtons[10]:=ParRadiobutton10;
ParGateLabels[10]:=ParGateLabel10;
ParDeltaLabels[10]:=ParDeltaLabel10;

ParRadioButtons[11]:=ParRadiobutton11;
ParGateLabels[11]:=ParGateLabel11;
ParDeltaLabels[11]:=ParDeltaLabel11;

ParRadioButtons[12]:=ParRadiobutton12;
ParGateLabels[12]:=ParGateLabel12;
ParDeltaLabels[12]:=ParDeltaLabel12;

ParRadioButtons[13]:=ParRadiobutton13;
ParGateLabels[13]:=ParGateLabel13;
ParDeltaLabels[13]:=ParDeltaLabel13;

ParRadioButtons[14]:=ParRadiobutton14;
ParGateLabels[14]:=ParGateLabel14;
ParDeltaLabels[14]:=ParDeltaLabel14;

ParRadioButtons[15]:=ParRadiobutton15;
ParGateLabels[15]:=ParGateLabel15;
ParDeltaLabels[15]:=ParDeltaLabel15;

ParRadioButtons[16]:=ParRadiobutton16;
ParGateLabels[16]:=ParGateLabel16;
ParDeltaLabels[16]:=ParDeltaLabel16;

ParRadioButtons[17]:=ParRadiobutton17;
ParGateLabels[17]:=ParGateLabel17;
ParDeltaLabels[17]:=ParDeltaLabel17;

ParRadioButtons[18]:=ParRadiobutton18;
ParGateLabels[18]:=ParGateLabel18;
ParDeltaLabels[18]:=ParDeltaLabel18;

ParRadioButtons[19]:=ParRadiobutton19;
ParGateLabels[19]:=ParGateLabel19;
ParDeltaLabels[19]:=ParDeltaLabel19;

ParRadioButtons[20]:=ParRadiobutton20;
ParGateLabels[20]:=ParGateLabel20;
ParDeltaLabels[20]:=ParDeltaLabel20;

ParRadioButtons[21]:=ParRadiobutton21;
ParGateLabels[21]:=ParGateLabel21;
ParDeltaLabels[21]:=ParDeltaLabel21;

ParRadioButtons[22]:=ParRadiobutton22;
ParGateLabels[22]:=ParGateLabel22;
ParDeltaLabels[22]:=ParDeltaLabel22;

ParRadioButtons[23]:=ParRadiobutton23;
ParGateLabels[23]:=ParGateLabel23;
ParDeltaLabels[23]:=ParDeltaLabel23;

ParRadioButtons[24]:=ParRadiobutton24;
ParGateLabels[24]:=ParGateLabel24;
ParDeltaLabels[24]:=ParDeltaLabel24;}

  PVRBA[1]:=@VRB1;
  PVRBA[2]:=@VRB2;
  PVRBA[3]:=@VRB3;
  PVRBA[4]:=@VRB4;
  PVRBA[5]:=@VRB5;
  PVRBA[6]:=@VRB6;
  PVRBA[7]:=@VRB7;
  PVRBA[8]:=@VRB8;
  PVRBA[9]:=@VRB9;
  PVRBA[10]:=@VRB10;

  Caption:=M.Par_Get('Form1Caption');

  LocationDescriptionEdit.Hint:=M.Par_Get('Form1LocationDescriptionEdit');

  IsLocationStartCheck.Caption:=M.Par_Get('Form1IsLocationStartCheck');
  IsLocationStartCheck.Hint:=M.Par_Get('Form1IsLocationStartCheckHint');
  IsLocationFailCheck.Caption:=M.Par_Get('Form1IsLocationFailCheck');
  IsLocationFailCheck.Hint:=M.Par_Get('Form1IsLocationFailCheckHint');
  IsLocationEndCheck.Caption:=M.Par_Get('Form1IsLocationEndCheck');
  IsLocationEndCheck.Hint:=M.Par_Get('Form1IsLocationEndCheckHint');

  OkButton.Caption:=M.Par_Get('Form1OkButtonCaption');
  CancelButton.Caption:=M.Par_Get('Form1CancelButtonCaption');

  OkButton.Hint:=M.Par_Get('Form1OkButtonCaptionHint');
  CancelButton.Hint:=M.Par_Get('Form1CancelButtonCaptionHint');
end;

procedure TForm1.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.OkButtonClick(Sender: TObject);
var
  i:integer;
begin
  is_ok_pressed:=true;

  FormLocation.LocDescrOrder:=1;
  FormLocation.LocationDescription.text:=trim(FormLocation.LocationDescriptions[1].text);

  for i:=1 to maxparameters do begin
    if FormLocation.Dpars[i].min>FormLocation.Dpars[i].max then begin
      FormLocation.Dpars[i].min:=Form2.Game.Pars[i].GetDefaultMinGate;
      FormLocation.Dpars[i].max:=Form2.Game.Pars[i].GetDefaultMaxGate;
    end;
  end;
  // FormLocation.LocationDescription.Text:=trim(LocationDescriptionEdit.Text);
  FormLocation.StartLocationFlag:=IsLocationStartCheck.Checked;
  FormLocation.EndLocationFlag:=IsLocationEndCheck.Checked;
  FormLocation.FailLocationFlag:=IsLocationFailCheck.Checked;
  FormLocation.PlayerDeath:=PlayerDeathCheckBox.Checked;
  Form2.Game.Locations[QuestLocationIndex].CopyDataFrom(FormLocation);
  Close;
end;

procedure TForm1.IsLocationStartCheckClick(Sender: TObject);
begin
  FormLocation.StartLocationFlag:=IsLocationStartCheck.Checked;
  process_enabled_controls;
end;

procedure TForm1.IsLocationEndCheckClick(Sender: TObject);
begin
  FormLocation.EndLocationFlag:=IsLocationEndCheck.Checked;
  process_enabled_controls;
end;

procedure TForm1.IsLocationFailCheckClick(Sender: TObject);
begin
  FormLocation.FailLocationFlag:=IsLocationFailCheck.Checked;
  if not FormLocation.FailLocationFlag then PlayerDeathCheckBox.Checked:=false;
  process_enabled_controls;
end;


procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=VK_ESCAPE then CancelButton.Click;
end;

procedure TForm1.LocationNameEditKeyPress(Sender: TObject; var Key: Char);
begin
  process_enabled_controls;
end;

procedure TForm1.PlayerDeathCheckBoxClick(Sender: TObject);
begin
  FormLocation.PlayerDeath:=PlayerDeathCheckBox.Checked;
  process_enabled_controls;
end;

procedure TForm1.LocationDescriptionEditChange(Sender: TObject);
begin
  FormLocation.LocationDescriptions[LocationDescriptionVariantRG.ItemIndex+1].Text:=trim(LocationDescriptionEdit.text);
  process_enabled_controls;
end;


procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=true;
  VRB1.Checked:=true;
  if not is_ok_pressed then begin
    CanClose:=false;

    if OldLocation.IsEqualWith(FormLocation) then begin
      is_ok_pressed:=false;
      CanClose:=true;
      exit;
    end;

    if MessageDlg('Отменить изменения?',mtConfirmation, [mbYes, mbNo],0)=mrYes then begin
      is_ok_pressed:=false;
      CanClose:=true;
      VRB1.Checked:=true;
    end;
  end;
end;

procedure TForm1.ParRadioButton1Click(Sender: TObject);
begin
  //FormJustOpened:=true;
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton2Click(Sender: TObject);
begin
  //FormJustOpened:=true;
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton3Click(Sender: TObject);
begin
  //FormJustOpened:=true;
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton4Click(Sender: TObject);
begin
  //FormJustOpened:=true;
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton5Click(Sender: TObject);
begin
  //FormJustOpened:=true;
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton6Click(Sender: TObject);
begin
  //FormJustOpened:=true;
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton7Click(Sender: TObject);
begin
  //FormJustOpened:=true;
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton8Click(Sender: TObject);
begin
  //FormJustOpened:=true;
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton9Click(Sender: TObject);
begin
  //FormJustOpened:=true;
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParDeltaTrackBarChange(Sender: TObject);
begin
  FormLocation.DPars[SelectedParameter].delta:=ParDeltaTrackBar.Position;
  ParValueLabel.Caption:=inttostr(ParDeltaTrackBar.Position);

  RedrawParTrackBar;

  Process_Enabled_Controls;
end;

procedure TForm1.ParViewActionRGClick(Sender: TObject);
begin
  FormLocation.DPars[SelectedParameter].ParameterViewAction:=ParViewActionRG.ItemIndex;
  Process_Enabled_Controls;
end;

procedure TForm1.DeltaValueRadioBtnClick(Sender: TObject);
begin
  FormLocation.DPars[SelectedParameter].DeltaPercentFlag:=false;
  FormLocation.DPars[SelectedParameter].DeltaApprFlag:=false;
  FormLocation.DPars[SelectedParameter].DeltaExprFlag:=false;

  RedrawParTrackBar;
  RedrawStatistsicsTimer.Enabled:=true;
  Process_Enabled_Controls;
end;

procedure TForm1.DeltaPercentRadioBtnClick(Sender: TObject);
begin
  FormLocation.DPars[SelectedParameter].DeltaPercentFlag:=true;
  FormLocation.DPars[SelectedParameter].DeltaApprFlag:=false;
  FormLocation.DPars[SelectedParameter].DeltaExprFlag:=false;

  RedrawParTrackBar;
  RedrawStatistsicsTimer.Enabled:=true;
  Process_Enabled_Controls;
end;

procedure TForm1.ParCriticalMessageMemoChange(Sender: TObject);
begin
  if trim(ParCriticalMessageMemo.text) <> trim(Form2.Game.Pars[SelectedParameter].CriticalMessage.text) then begin
    FormLocation.DPars[SelectedParameter].CriticalMessage.text:=(ParCriticalMessageMemo.text);
    Process_Enabled_Controls;
  end;
end;

procedure TForm1.MinGateEditChange(Sender: TObject);
begin
  if (MinGateEdit.text='') or (MaxGateEdit.text='') then
    FormLocation.DPars[SelectedParameter].min:=Form2.Game.Pars[SelectedParameter].GetDefaultMinGate
  else begin //then MinGateEdit.text:=inttostr(tempDPars[SelectedParameter].min);
    //if strtoint(MaxGateEdit.text)<strtoint(MinGateEdit.text)
    //then  MinGateEdit.text:=inttostr(tempDPars[SelectedParameter].min);

    //if MinGateEdit.text=inttostr(tempDPars[SelectedParameter].min) then
    //MinGateEdit.Font.Color:=clGray else MinGateEdit.Font.Color:=clBlack;

    if MinGateEdit.text=inttostr(Form2.Game.Pars[SelectedParameter].GetDefaultMinGate) then
    MinGateEdit.Font.Color:=clGray else MinGateEdit.Font.Color:=clBlack;

    FormLocation.DPars[SelectedParameter].min:=strtoint(MinGateEdit.text);
    RedrawStatistsicsTimer.Enabled:=true;
    Process_Enabled_Controls;
  end;
end;

procedure TForm1.MaxGateEditChange(Sender: TObject);
begin
  if (MinGateEdit.text='') or (MaxGateEdit.text='') then
    FormLocation.DPars[SelectedParameter].max:=Form2.Game.Pars[SelectedParameter].GetDefaultMaxGate
  else begin //then MinGateEdit.text:=inttostr(tempDPars[SelectedParameter].min);
    //if strtoint(MaxGateEdit.text)<strtoint(MinGateEdit.text)
    //then  MaxGateEdit.text:=inttostr(tempDPars[SelectedParameter].max);

    //if maxGateEdit.text=inttostr(tempDPars[SelectedParameter].max) then
    //maxGateEdit.Font.Color:=clGray else maxGateEdit.Font.Color:=clBlack;

    if MaxGateEdit.text=inttostr(Form2.Game.Pars[SelectedParameter].GetDefaultMaxGate) then
    MaxGateEdit.Font.Color:=clGray else MaxGateEdit.Font.Color:=clBlack;

    FormLocation.DPars[SelectedParameter].max:=strtoint(MaxGateEdit.text);
    RedrawStatistsicsTimer.Enabled:=true;
    Process_Enabled_Controls;
  end;
end;



procedure TForm1.RedrawStatistsicsTimerTimer(Sender: TObject);
begin
  RedrawStatistsicsTimer.Enabled:=false;
  DrawStatistics;
end;

procedure TForm1.TrackBarGroundShapeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DrawStatistics;
end;

procedure TForm1.TrackBarGroundShapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TrackBarGroundShape.OnMouseMove(Sender,Shift,x,y);
end;

procedure TForm1.TrackBarGroundShapeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  range:integer;
  currentposition:integer;
  dmax:integer;
begin
  if ssLeft in Shift then begin
    if FormLocation.DPars[SelectedParameter].DeltaApprFlag then begin
      range:=Form2.Game.Pars[SelectedParameter].max-Form2.Game.Pars[SelectedParameter].min;
      currentposition:=round(range*(X)/TrackBarGroundShape.Width);
      ParDeltaTrackBar.Position:=Form2.Game.Pars[SelectedParameter].min+currentposition;
    end else begin
      if FormLocation.DPars[SelectedParameter].DeltaPercentFlag then dmax:=100
      else dmax:=Math.max(abs(Form2.Game.Pars[SelectedParameter].min),
      abs(Form2.Game.Pars[SelectedParameter].max));
      range:=2*abs(dmax);
      currentposition:=round(range*(X)/TrackBarGroundShape.Width) - abs(dmax);
      ParDeltaTrackBar.Position:=currentposition;
    end;
  end;
end;

procedure TForm1.TrackBarLeftImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  dmin: integer;
begin
  if FormLocation.DPars[SelectedParameter].DeltaApprFlag then begin
    dmin:=Form2.Game.Pars[SelectedParameter].min;
    if (FormLocation.DPars[SelectedParameter].delta>dmin) then begin
      dec(FormLocation.DPars[SelectedParameter].delta);
      Process_Enabled_Controls;
    end;
  end else begin
    if FormLocation.DPars[SelectedParameter].DeltaPercentFlag then dmin:=100
    else dmin:=Math.max(abs(Form2.Game.Pars[SelectedParameter].min),abs(Form2.Game.Pars[SelectedParameter].max));

    if (abs(FormLocation.DPars[SelectedParameter].delta)<dmin) then begin
      dec(FormLocation.DPars[SelectedParameter].delta);
      Process_Enabled_Controls;
    end;
  end;
end;

procedure TForm1.TrackBarRightImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  dmax:integer;
begin
  if FormLocation.DPars[SelectedParameter].DeltaApprFlag then begin
    dmax:=Form2.Game.Pars[SelectedParameter].max;
    if (FormLocation.DPars[SelectedParameter].delta<dmax) then begin
      inc(FormLocation.DPars[SelectedParameter].delta);
      Process_Enabled_Controls;
    end;
  end else begin
    if FormLocation.DPars[SelectedParameter].DeltaPercentFlag then dmax:=100
    else dmax:=Math.max(abs(Form2.Game.Pars[SelectedParameter].min),abs(Form2.Game.Pars[SelectedParameter].max));
    if (FormLocation.DPars[SelectedParameter].delta<dmax) then begin
      inc(FormLocation.DPars[SelectedParameter].delta);
      Process_Enabled_Controls;
    end;
  end;
end;

procedure TForm1.TrackBarLeftImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DrawStatistics;
end;

procedure TForm1.TrackBarRightImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DrawStatistics;
end;

procedure TForm1.ParRadioButton10Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton11Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton12Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.CostOneDayCheckBoxClick(Sender: TObject);
var
  i:integer;
begin
  i:=0;
  if CostOneDayCheckBox.checked then i:=1;
  FormLocation.DaysCost:=i;
  process_enabled_controls;
end;

procedure TForm1.LocationDescriptionVariantRGClick(Sender: TObject);
begin
  LocationDescriptionEdit.Text:=trim(FormLocation.LocationDescriptions[LocationDescriptionVariantRG.itemindex+1].text);
  //PVRBA[LocationDescriptionVariantRG.ItemIndex+1]^.Checked:=true;
  //LDV_RG.Refresh;
  //LDV_RG.OnClick(sender);
  ColorVRBS;
end;

procedure TForm1.LocationDescriptionViewOrderRGClick(Sender: TObject);
var
  flag:boolean;
begin
  flag:=false;
  if LocationDescriptionViewOrderRG.ItemIndex=1 then begin
    flag:=true;
  end;
  LOrdPanel.Visible:=flag and (LocationDescriptionViewOrderRG.Enabled);
  if not OpeningForm then begin
    FormLocation.RandomShowLocationDescriptions:=flag;
    process_enabled_controls;
  end;
end;

procedure TForm1.VRB1Click(Sender: TObject);
begin
  LocationDescriptionVariantRG.ItemIndex:=0;
end;

procedure TForm1.VRB2Click(Sender: TObject);
begin
  LocationDescriptionVariantRG.ItemIndex:=1;
end;

procedure TForm1.VRB3Click(Sender: TObject);
begin
  LocationDescriptionVariantRG.ItemIndex:=2;
end;

procedure TForm1.VRB4Click(Sender: TObject);
begin
  LocationDescriptionVariantRG.ItemIndex:=3;
end;

procedure TForm1.VRB5Click(Sender: TObject);
begin
  LocationDescriptionVariantRG.ItemIndex:=4;
end;

procedure TForm1.VRB6Click(Sender: TObject);
begin
  LocationDescriptionVariantRG.ItemIndex:=5;
end;

procedure TForm1.VRB7Click(Sender: TObject);
begin
  LocationDescriptionVariantRG.ItemIndex:=6;
end;

procedure TForm1.VRB8Click(Sender: TObject);
begin
  LocationDescriptionVariantRG.ItemIndex:=7;
end;

procedure TForm1.VRB9Click(Sender: TObject);
begin
  LocationDescriptionVariantRG.ItemIndex:=8;
end;

procedure TForm1.VRB10Click(Sender: TObject);
begin
  LocationDescriptionVariantRG.ItemIndex:=9;
end;

procedure TForm1.DeltaApprRadioBtnClick(Sender: TObject);
begin
  FormLocation.DPars[SelectedParameter].DeltaPercentFlag:=false;
  FormLocation.DPars[SelectedParameter].DeltaApprFlag:=true;
  FormLocation.DPars[SelectedParameter].DeltaExprFlag:=false;
  ParDeltaTrackBar.Position:=trunc((Form2.Game.Pars[SelectedParameter].min+Form2.Game.Pars[SelectedParameter].max)/2);
  RedrawParTrackBar;
  RedrawStatistsicsTimer.Enabled:=true;
  Process_Enabled_Controls;
end;

procedure TForm1.VoidLocationCheckBoxClick(Sender: TObject);
begin
  FormLocation.VoidLocation:=VoidLocationCheckBox.Checked;
  process_enabled_controls;
end;

{procedure TForm1.ParTabSetChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
	ProcessParTab(newtab);
	ProcessTabParSelect(newtab);
end;}

{procedure TForm1.ParRadioButton13Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton14Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton15Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton16Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton17Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton18Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton19Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton20Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton21Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton22Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton23Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParRadioButton24Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm1.ParTabSetClick(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;}

procedure TForm1.ExpressionEditChange(Sender: TObject);
var
  ltstr,tstr: string;
  parse: TCalcParse;
begin
  if FormLocation.DPars[SelectedParameter].DeltaExprFlag then begin
    parse:=TCalcParse.Create;
    tstr:=trim(ExpressionEdit.Text);
    ltstr:=FormLocation.DPars[SelectedParameter].Expression.Text;
    parse.AssignAndPreprocess(tstr,SelectedParameter);

    SymWarnLabel.Visible:=parse.sym_warning;
    ParenthesErrorLabel.Visible:=parse.parentheses_error;
    ParameterErrorLabel.Visible:=parse.parameters_error;
    ValueErrorLabel.Visible:=parse.num_error;
    DiapErrorLabel.Visible:=parse.diapazone_error;
    ParseOkLabel.Visible:=not parse.error;
    if not parse.error then begin
      FormLocation.DPars[SelectedParameter].Expression.Text:=parse.ConvertToExternal(parse.internal_str);
      if parse.default_expression then FormLocation.DPars[SelectedParameter].Expression.Text:='';
      RedrawStatistsicsTimer.Enabled:=true;
    end;
    parse.Destroy;
  end;
end;

procedure TForm1.DeltaExprRadioBtnClick(Sender: TObject);
begin
  FormLocation.DPars[SelectedParameter].DeltaPercentFlag:=false;
  FormLocation.DPars[SelectedParameter].DeltaApprFlag:=false;
  FormLocation.DPars[SelectedParameter].DeltaExprFlag:=true;
  SymWarnLabel.Visible:=false;
  ParenthesErrorLabel.Visible:=false;
  ParameterErrorLabel.Visible:=false;
  ValueErrorLabel.Visible:=false;
  ParseOkLabel.Visible:=false;
  ExpressionEdit.Text:=FormLocation.DPars[SelectedParameter].Expression.Text;
  RedrawParTrackBar;
  RedrawStatistsicsTimer.Enabled:=true;
  Process_Enabled_Controls;
end;

procedure TForm1.LOrdExprEditChange(Sender: TObject);
var
  ltstr,tstr: string;
  parse: TCalcParse;
begin
//	if LocationDescriptionViewOrderRG.ItemIndex=1 then begin
  parse:=TCalcParse.Create;
  tstr:=trim(LOrdExprEdit.Text);
  ltstr:=FormLocation.LocDescrExprOrder.Text;
  parse.AssignAndPreprocess(tstr,1);

  LOrdSymWarnLabel.Visible:=parse.sym_warning;
  LOrdParenthesesErrorLabel.Visible:=parse.parentheses_error;
  LOrdParameterErrorLabel.Visible:=parse.parameters_error;
  LOrdValueErrorLabel.Visible:=parse.num_error;
  LOrdDiapErrorLabel.Visible:=parse.diapazone_error;
  LOrdParseOkLabel.Visible:=not parse.error;
  if not parse.error then begin
    FormLocation.LocDescrExprOrder.Text:=parse.ConvertToExternal(parse.internal_str);
    if parse.default_expression then FormLocation.LocDescrExprOrder.Text:='';
    process_enabled_controls;
  end;
  parse.Destroy;
//	end;
end;

procedure TForm1.ParListClick(Sender: TObject);
begin
  ProcessParRadioButtonClick();
end;

procedure TForm1.ParListClickCheck(Sender: TObject);
var
  i: integer;
begin
  for i:=1 to maxparameters do
    if(ParList.ItemEnabled[i-1]) then ParList.Checked[i-1]:=true;
end;

function TForm1.ParListGetItem(i: integer): string;
//var
  //ln: Integer;
begin
  //ln:=Length(ParList.Items[i - 1]);
  //if(i > 9) then result:=RightStr(ParList.Items[i - 1], ln - 3)
  //else result:=RightStr(ParList.Items[i - 1], ln - 4);
  result:=ParList.Items[i - 1];
end;

procedure TForm1.ParListSetItem(i: integer; s: string);
begin
  s:='[p' + IntToStr(i) + '] ' + s;
  if(ParList.Items[i-1] <> s) then ParList.Items[i-1]:=s; //'p' + IntToStr(i) + ': ' + s;
end;

end.



