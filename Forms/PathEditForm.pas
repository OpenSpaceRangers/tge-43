 unit PathEditForm;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, EC_BlockPar, Math,
  PathClass,
  MessageText,
  ParameterClass,
  ValueListClass,
  ParameterDeltaClass,
  CalcParseClass,
  ParFailEditForm, Tabs, Gauges, CheckLst;

Type PM=^TBlockParEC;

//type PRB=^TradioButton;

type
  TForm3 = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    VoidFlagPanel: TPanel;
    Label4: TLabel;
    EndMessageEdit: TMemo;
    Label3: TLabel;
    StartMessageEdit: TMemo;
    ParCustomizePanel: TPanel;
    ParMinLabel: TLabel;
    ParValueLabel: TLabel;
    ParMaxLabel: TLabel;
    Shape19: TShape;
    Label9: TLabel;
    Shape21: TShape;
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
    TrackBarGroundShape: TShape;
    TrackBarButtonShape: TShape;
    ParCriticalMessageMemo: TMemo;
    TrackBarLeftImage: TImage;
    TrackBarRightImage: TImage;
    AlwaysShowWhenPlayCheckBox: TCheckBox;
    BitMaskGroupBox: TGroupBox;
    BMCheck0: TCheckBox;
    BMCheck1: TCheckBox;
    BMCheck2: TCheckBox;
    BMCheck5: TCheckBox;
    BMCheck4: TCheckBox;
    BMCheck3: TCheckBox;
    BMCheck8: TCheckBox;
    BMCheck7: TCheckBox;
    BMCheck6: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    CostOneDayCheckBox: TCheckBox;
    ValueGateEdit: TEdit;
    Shape1: TShape;
    Shape3: TShape;
    ValueGateNegationLabel: TLabel;
    ModZeroeGateEdit: TEdit;
    Shape4: TShape;
    Shape5: TShape;
    ModZeroeGateNegationLabel: TLabel;
    Shape2: TShape;
    ChangeValueGateNegationImg: TImage;
    ChangeModZeroeGateNegationImg: TImage;
    Label10: TLabel;
    ProbabilityEdit: TEdit;
    DeltaApprRadioBtn: TRadioButton;

    DeltaExprPanel: TPanel;
    Shape6: TShape;
    SymWarnLabel: TLabel;
    ParenthesErrorLabel: TLabel;
    ParameterErrorLabel: TLabel;
    ValueErrorLabel: TLabel;
    ParseOkLabel: TLabel;
    ExpressionEdit: TEdit;
    DeltaExprRadioBtn: TRadioButton;
    LogicExpressionEdit: TEdit;
    Label2: TLabel;
    LSymWarnLabel: TLabel;
    LParenthesErrorLabel: TLabel;
    LParameterErrorLabel: TLabel;
    LValueErrorLabel: TLabel;
    LParseOkLabel: TLabel;
    
    NextOQPButton: TButton;
    DiapErrorLabel: TLabel;
    LDiapErrorLabel: TLabel;
    PassTimesValueEdit: TEdit;
    Timer1: TTimer;
    Timer2: TTimer;
    DefUnlPathGoTimesCheck: TCheckBox;
    PTLabel: TLabel;
    QuestDifficultyGroupBox: TGroupBox;
    ShowOrderGauge: TGauge;
    ShowOrderTrackBar: TTrackBar;
    ShowOrderLabel: TLabel;
    ParList: TCheckListBox;

    procedure process_enabled_controls;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);

    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure StartMessageEditChange(Sender: TObject);
    procedure EndMessageEditChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    {procedure ParRadioButton1Click(Sender: TObject);
    procedure ParRadioButton2Click(Sender: TObject);
    procedure ParRadioButton3Click(Sender: TObject);
    procedure ParRadioButton4Click(Sender: TObject);
    procedure ParRadioButton5Click(Sender: TObject);
    procedure ParRadioButton6Click(Sender: TObject);
    procedure ParRadioButton7Click(Sender: TObject);
    procedure ParRadioButton8Click(Sender: TObject);
    procedure ParRadioButton9Click(Sender: TObject);}
    procedure ParDeltaTrackBarChange(Sender: TObject);
    procedure ParViewActionRGClick(Sender: TObject);
    procedure DeltaValueRadioBtnClick(Sender: TObject);
    procedure DeltaPercentRadioBtnClick(Sender: TObject);
    procedure ParCriticalMessageMemoChange(Sender: TObject);
    procedure MinGateEditChange(Sender: TObject);
    procedure MaxGateEditChange(Sender: TObject);

    procedure GetBitmaskInfo;
    procedure ShowBitmaskInfo;

    {procedure ProcessParTab(nt:integer);
    procedure ProcessTabParSelect(nt:integer);}

    procedure DrawStatistics;
    procedure RedrawStatistsicsTimerTimer(Sender: TObject);
    procedure RedrawParTrackBar;
    procedure TrackBarGroundShapeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarGroundShapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarGroundShapeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarLeftImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarRightImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarLeftImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarRightImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    function GetSelectedParameter:integer;

    procedure ProcessParRadioButtonClick;
    procedure AlwaysShowWhenPlayCheckBoxClick(Sender: TObject);
    procedure PassTimesValueEditChange(Sender: TObject);
    {procedure ParRadioButton10Click(Sender: TObject);
    procedure ParRadioButton11Click(Sender: TObject);
    procedure ParRadioButton12Click(Sender: TObject);}
    procedure BMCheck0Click(Sender: TObject);
    procedure BMCheck1Click(Sender: TObject);
    procedure BMCheck2Click(Sender: TObject);
    procedure BMCheck3Click(Sender: TObject);
    procedure BMCheck4Click(Sender: TObject);
    procedure BMCheck5Click(Sender: TObject);
    procedure BMCheck6Click(Sender: TObject);
    procedure BMCheck7Click(Sender: TObject);
    procedure BMCheck8Click(Sender: TObject);
    procedure CostOneDayCheckBoxClick(Sender: TObject);
    procedure ChangeValueGateNegationImgClick(Sender: TObject);
    procedure ChangeModZeroeGateNegationImgClick(Sender: TObject);
    procedure ValueGateEditChange(Sender: TObject);
    procedure ModZeroeGateEditChange(Sender: TObject);
    procedure ProbabilityEditChange(Sender: TObject);
    procedure DeltaApprRadioBtnClick(Sender: TObject);
    //procedure ParTabSetChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    //procedure ParTabSetClick(Sender: TObject);
    procedure DeltaExprRadioBtnClick(Sender: TObject);
    procedure ExpressionEditChange(Sender: TObject);
    {procedure ParRadioButton13Click(Sender: TObject);
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
    procedure ParRadioButton24Click(Sender: TObject);}
    procedure LogicExpressionEditChange(Sender: TObject);

    procedure ProcessFormShow;
    procedure ProcessFormClose;

    procedure InitSameQuestionInfo;
    procedure NextOQPButtonClick(Sender: TObject);
    procedure DefUnlPathGoTimesCheckClick(Sender: TObject);
    procedure ShowOrderTrackBarChange(Sender: TObject);

    procedure ParListClick(Sender: TObject);
    function ParListGetItem(i: integer): string;
    procedure ParListSetItem(i: integer; s: string);
    procedure ParListClickCheck(Sender: TObject);
   

  private
    { Private declarations }
  public
    { Public declarations }
    M:PM;

    FormPath,OldPath: TPath;
    is_ok_pressed:boolean;
    is_next_pressed:boolean;

    //ParRadioButtons:array [1..maxparameters] of TRadioButton;
    //ParGateLabels: array [1..maxparameters] of TLabel;
    //ParDeltaLabels:array [1..maxparameters] of TLabel;
    ParMaxes, ParMins: array [1..maxparameters] of integer;
    SameQuestionPathIndexes: array [1..100] of integer;
    SameQuestionPathCount:integer;
    SameQuestionCurPos:integer;
    //LPEA: array [1..maxparameters] of TLabel;

    tempDPars: array [1..maxparameters] of TParameterDelta;
    SelectedParameter:integer;

    WeMakingANewPath: boolean;
    FormJustOpened: boolean;

    QuestPathIndex: integer;

    FormShowFlag: boolean;
end;

var
  Form3: TForm3;

implementation

{$R *.DFM}

uses StatisticsForm, MainForm, StrUtils;



procedure Tform3.InitSameQuestionInfo;
var i:integer;
begin
  SameQuestionPathCount:=0;
  SameQuestionCurPos:=0;
  for i:=1 to Form2.Game.PathesValue do begin
    if(Form2.Game.Pathes[i].FromLocation=Form2.Game.Pathes[QuestPathIndex].FromLocation) and (trim(Form2.Game.Pathes[i].StartPathMessage.Text)=trim(Form2.Game.Pathes[QuestPathIndex].StartPathMessage.Text)) then begin
      inc(SameQuestionPathCount);
      SameQuestionPathIndexes[SameQuestionPathCount]:=i;
    end;
  end;
  for i:=1 to SameQuestionPathCount do begin
    if SameQuestionPathIndexes[i]=QuestPathIndex then begin
      SameQuestionCurPos:=i;
    end
  end;
  if SameQuestionPathCount>1 then begin
    NextOQPButton.Visible:=true;
  end else begin
    NextOQPButton.Visible:=false;
  end;
end;

procedure Tform3.ProcessFormClose;
begin
//
end;

procedure Tform3.ProcessFormShow;
var
  i:integer;
  //f1_12par,f13_24par:boolean;
begin
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
  for i:=1 to maxparameters do
    if(ParList.ItemEnabled[i-1]) then ParList.Checked[i-1]:=true;

  FormPath.CopyDataFrom(Form2.Game.Pathes[QuestPathIndex]);
  is_ok_pressed:=false;

  FormShowFlag:=true;
  ProbabilityEdit.Text:=floattostr(FormPath.Probability);
  ModZeroeGateEdit.Text:='';
  ValueGateEdit.Text:='';
    
  OldPath.CopyDataFrom(FormPath);

  if FormPath.PassTimesValue=0 then begin
    DefUnlPathGoTimesCheck.Checked:=true;
  end else begin
    DefUnlPathGoTimesCheck.Checked:=false;
  end;
  SelectedParameter:=0;
  for i:=1 to maxparameters do tempDPars[i].CopyDataFrom(FormPath.DPars[i]);

  StartMessageEdit.Text:=trim(FormPath.StartPathMessage.Text);
  EndMessageedit.Text:=trim(FormPath.EndPathMessage.Text);
  FormJustOpened:=true;

  AlwaysShowWhenPlayCheckBox.Checked:=FormPath.AlwaysShowWhenPlaying;

  if WeMakingANewPath then DrawStatistics;
  process_enabled_controls;

  LogicExpressionEdit.Text:=trim(FormPath.LogicExpression.Text);
  if SelectedParameter>0 then begin
    ExpressionEdit.Text:=trim(FormPath.DPars[SelectedParameter].Expression.Text);
  end;

  ShowOrderTrackBar.Position:=FormPath.ShowOrder;
  ShowOrderGauge.Progress:=FormPath.ShowOrder;
  ShowOrderLabel.Caption:=inttostr(FormPath.ShowOrder);
  ActiveControl:=CancelButton;

  FormShowFlag:=false;
end;

{procedure Tform3.ProcessParTab(nt:integer);
begin
  if nt=0 then begin
    ParselectPanel.Visible:=true;
    ParselectPanel1.Visible:=false;
  end else begin
    ParselectPanel.Visible:=false;
    ParselectPanel1.Visible:=true;
  end;
end;

procedure Tform3.ProcessTabParSelect(nt:integer);
var flag:boolean;
begin
        flag:=SelectedParameter<>0;

        if ((SelectedParameter>=13) and (nt=0))
        	or
           ((SelectedParameter<13) and (nt=1))then flag:=false;

        ParCustomizePanel.Visible:=flag;
end;}


procedure TForm3.GetBitmaskInfo;
var  bitmask:integer;
begin
///
  bitmask:=0;
  if BMCheck0.Checked then bitmask:=bitmask+1;
  if BMCheck1.Checked then bitmask:=bitmask+2;
  if BMCheck2.Checked then bitmask:=bitmask+4;
  if BMCheck3.Checked then bitmask:=bitmask+8;
  if BMCheck4.Checked then bitmask:=bitmask+16;
  if BMCheck5.Checked then bitmask:=bitmask+32;
  if BMCheck6.Checked then bitmask:=bitmask+64;
  if BMCheck7.Checked then bitmask:=bitmask+128;
  if BMCheck8.Checked then bitmask:=bitmask+256;

  FormPath.DPars[SelectedParameter].bitmask:=bitmask;
end;

procedure TForm3.ShowBitmaskInfo;
var bitmask:integer;
    test:integer;
begin
///
    bitmask:=FormPath.DPars[SelectedParameter].bitmask;

    test:=bitmask;
    asm
      mov eax,1
      and eax,test
      mov test,eax
    end;
    if test<>0 then BMCheck0.Checked:=true else BMCheck0.Checked:=false;

    test:=bitmask;
    asm
      mov eax,2
      and eax,test
      mov test,eax
    end;
    if test<>0 then BMCheck1.Checked:=true else BMCheck1.Checked:=false;

        test:=bitmask;
    asm
      mov eax,4
      and eax,test
      mov test,eax
    end;
    if test<>0 then BMCheck2.Checked:=true else BMCheck2.Checked:=false;

   test:=bitmask;
    asm
      mov eax,8
      and eax,test
      mov test,eax
    end;
    if test<>0 then BMCheck3.Checked:=true else BMCheck3.Checked:=false;

    test:=bitmask;
    asm
      mov eax,16
      and eax,test
      mov test,eax
    end;
    if test<>0 then BMCheck4.Checked:=true else BMCheck4.Checked:=false;

        test:=bitmask;
    asm
      mov eax,32
      and eax,test
      mov test,eax
    end;
    if test<>0 then BMCheck5.Checked:=true else BMCheck5.Checked:=false;

   test:=bitmask;
    asm
      mov eax,64
      and eax,test
      mov test,eax
    end;
    if test<>0 then BMCheck6.Checked:=true else BMCheck6.Checked:=false;

    test:=bitmask;
    asm
      mov eax,128
      and eax,test
      mov test,eax
    end;
    if test<>0 then BMCheck7.Checked:=true else BMCheck7.Checked:=false;

        test:=bitmask;
    asm
      mov eax,256
      and eax,test
      mov test,eax
    end;
    if test<>0 then BMCheck8.Checked:=true else BMCheck8.Checked:=false;


end;

function TForm3.GetSelectedParameter(): integer;
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

procedure Tform3.ProcessParRadioButtonClick;
begin
//FormJustOpened:=true;
  SelectedParameter:=GetSelectedParameter;
  if SelectedParameter<>0 then begin
    MinGateEdit.text:=inttostr(FormPath.dpars[SelectedParameter].Min);
    MaxGateEdit.text:=inttostr(FormPath.dpars[SelectedParameter].Max);
  end;
  if SelectedParameter<>0 then 
  ExpressionEdit.Text:=FormPath.DPars[SelectedParameter].Expression.Text;
  Process_enabled_controls;
end;

procedure Tform3.DrawStatistics;
begin
  if not Form2.Game.Pathes[QuestPathIndex].IsEqualWith(FormPath) then begin
    Form2.Game.Pathes[QuestPathIndex].CopyDataFrom(FormPath);
    Form2.TraceForClosedLocations;
    Process_Enabled_Controls;
  end;
end;

procedure Tform3.RedrawParTrackBar;
var
  range:integer;
  currentposition:integer;
  dmax:integer;
  dmin:integer;
begin
if FormPath.DPars[SelectedParameter].DeltaApprFlag then begin

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

	if FormPath.DPars[SelectedParameter].DeltaPercentFlag then dmax:=100
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


procedure TForm3.FormCreate(Sender: TObject);
var
  i:integer;
begin
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
  FormPath:=TPath.Create(0,0,0,0,1,0,1,0,1,PathClass.PM(M));
  OldPath:=TPath.Create(0,0,0,0,1,0,1,0,1,PathClass.PM(M));

  M:=@MessageText.M;

  //ProcessParTab(ParTabSet.TabIndex);
  //ProcessTabParSelect(ParTabSet.TabIndex);

  for i:=1 to maxparameters do ParList.AddItem(IntToStr(i), Sender); // added by Koc
  ParList.ItemIndex:=0;

  for i:=1 to maxparameters do tempDPars[i]:=TParameterDelta.Create(i);
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

  Caption:=M.Par_Get('Form3Caption');

  OkButton.Caption:=M.Par_Get('Form3OkButtonCaption');
  CancelButton.Caption:=M.Par_Get('Form3CancelButtonCaption');
  OkButton.Hint:=M.Par_Get('Form3OkButtonCaptionHint');
  CancelButton.Hint:=M.Par_Get('Form3CancelButtonCaptionHint');

  Label3.Caption:=M.PAr_Get('Form3StartPathMessage');
  Label4.Caption:=M.Par_Get('Form3EndPathMessageLabel');

  EndMessageEdit.Hint:=M.Par_Get('Form3EndMessageEditHint');
end;


procedure TForm3.process_enabled_controls;
var
  flag: boolean;
  tstr, temp: string;
  tvl: TValuesList;
  parse: TCalcParse;
  i,t,cmin,cmax,value: integer;
begin
  tvl:=TValuesList.Create;
    
  if (trim(ProbabilityEdit.Text)='')or(FormPath.Probability<>strtofloat(trim(ProbabilityEdit.Text))) then ProbabilityEdit.Text:=floattostr(FormPath.Probability);
  if FormPath.DaysCost=1 then CostOneDayCheckBox.checked:=true else CostOneDayCheckBox.checked:=false;

  if Form2.CalculateNoStatisticsToolButton.Down then begin
    Statisticslabel.Caption:='P '+inttostr(FormPath.PathNumber);
  end else begin
    StatisticsLabel.Caption:=
      Form2.myinttostr(form8.PathReaches[QuestPathIndex]) + ' -> ' +
      Form2.myinttostr(form8.PathSuccessReaches[QuestPathIndex]);
  end;

  VoidFlagPanel.Visible:=true;
  SelectedParameter:=GetSelectedParameter();
  PassTimesValueEdit.text:=inttostr(FormPath.PassTimesValue);
  if trim(PassTimesValueEdit.text)=inttostr(Form2.Game.DefPathGoTimesValue) then PassTimesValueEdit.Font.Color:=clGray else PassTimesValueEdit.Font.Color:=clBlack;

	for i:=1 to maxparameters do begin
		with FormPath.DPars[i] do begin
      tstr:=trim(Form2.Game.Pars[i].Name.Text);

      if(min = Parmins[i]) and (max = Parmaxes[i]) then temp:=''
      else temp:='  [ ' + IntToStr(Min) + ' .. ' + IntToStr(Max) + ' ]';
      if(FormPath.DPars[i].ValuesGate.Count <> 0) then begin
        if FormPath.DPars[i].ValuesGate.Negation then temp:=temp + ' ='
        else temp:=temp + ' <>';
        temp:=temp + FormPath.DPars[i].ValuesGate.GetString;
      end;
      if FormPath.DPars[i].ModZeroesGate.Count<>0 then begin
        if FormPath.DPars[i].ModZeroesGate.Negation then temp:=temp + ' /'
        else temp:=temp + ' X';
        temp:=temp + FormPath.DPars[i].ModZeroesGate.GetString;
      end;
      if(temp <> '') then tstr:=tstr + temp;

      if DeltaExprFlag then begin
        //ParDeltaLabels[i].Visible:=true;
        //ParDeltaLabels[i].Enabled:=true;
        temp:=trim(Expression.Text);
        if temp<>'' then tstr:=tstr + '  = ' + temp;
        //ParDeltaLabels[i].Caption:=temp;
      end else begin
        {if(t>0) and (not DeltaApprFlag) then ParDeltaLabels[i].Caption:='+'+inttostr(t)
        else ParDeltaLabels[i].Caption:=inttostr(t);
        if DeltaPercentFlag then ParDeltaLabels[i].Caption:=ParDeltaLabels[i].Caption+'%';

        if(Delta=0) and (not DeltaApprFlag) then ParDeltaLabels[i].Visible:=false else ParDeltaLabels[i].Visible:=true;
        if  DeltaApprFlag then ParDeltaLabels[i].Caption:=':= '+ParDeltaLabels[i].Caption;}

        if(delta <> 0) or (DeltaApprFlag) then begin
          t:=delta;
          if DeltaPercentFlag then begin
            if(t > 100) then t:=100;
            if(t <-100) then t:=-100;
          end;
          
          temp:='  ';
          if DeltaApprFlag then temp:=temp + '=';

          if(t > 0) and (not DeltaApprFlag) then temp:=temp + '+';
          temp:=temp + IntToStr(t);
          if DeltaPercentFlag then temp:=temp + '%';

          if(temp <> '') then tstr:=tstr + temp;
        end;
      end;
    
      case ParameterViewAction of
        ShowParameter: tstr:=tstr + ' (показать)'; //ParRadioButtons[i].Caption:=trim(Form2.Game.Pars[i].Name.Text)+' (показать)';
        HideParameter: tstr:=tstr + ' (скрыть)'; //ParRadioButtons[i].Caption:=trim(Form2.Game.Pars[i].Name.Text)+' (скрыть)';
        //StayAsIs: tstr:=trim(Form2.Game.Pars[i].Name.Text); //ParRadioButtons[i].Caption:=trim(Form2.Game.Pars[i].Name.Text);
      end;

      case Form8.ParameterActivePathes[QuestPathIndex][i] of
        FailParType : begin
          tstr:='#' + tstr;
        end;
        SuccessParType: begin
          tstr:='^' + tstr;
        end;
      end;
      
      ParListSetItem(i, tstr);

      {if(min=Parmins[i])and(max=Parmaxes[i]) then tstr:=''
      else tstr:='[ ' + inttostr(Min) + ' .. ' + inttostr(Max) + ' ]';

      if FormPath.DPars[i].ValuesGate.Count<>0 then begin
        if FormPath.DPars[i].ValuesGate.Negation then tstr:=tstr+' ='
        else tstr:=tstr+' <>';
        tstr:=tstr+FormPath.DPars[i].ValuesGate.GetString;
      end;
      if FormPath.DPars[i].ModZeroesGate.Count<>0 then begin
        if FormPath.DPars[i].ModZeroesGate.Negation then tstr:=tstr+' /'
        else tstr:=tstr+' X';
        tstr:=tstr+FormPath.DPars[i].ModZeroesGate.GetString;
      end;
      ParGateLabels[i].Caption:=tstr;}
    end;
	end;

  {for i:=1 to maxparameters do begin
    case Form8.ParameterActivePathes[QuestPathIndex][i] of
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

  parse:=TCalcParse.Create;
  tstr:=trim(FormPath.LogicExpression.Text);
  parse.AssignAndPreprocess(trim(LogicExpressionEdit.Text),1);
  if ((tstr<>parse.ConvertToExternal(parse.internal_str))and(not parse.default_expression)) then LogicExpressionEdit.Text:=trim(FormPath.LogicExpression.Text);
  parse.Destroy;


  if SelectedParameter<>0 then begin
    parse:=TCalcParse.Create;
    tstr:=trim(FormPath.DPars[SelectedParameter].Expression.Text);
    parse.AssignAndPreprocess(trim(ExpressionEdit.Text),SelectedParameter);
    if ((tstr<>parse.ConvertToExternal(parse.internal_str))and(not parse.default_expression)) then ExpressionEdit.Text:=FormPath.DPars[SelectedParameter].Expression.Text;
    parse.Destroy;

    tvl.SetFromString(trim(ValueGateEdit.Text));
    if not tvl.IsEqualWith(FormPath.DPars[SelectedParameter].ValuesGate) then
    ValueGateEdit.Text:=FormPath.DPars[SelectedParameter].ValuesGate.GetString;

    if tvl.Count=0 then ValueGateNegationLabel.Font.Color:=clGray
    else ValueGateNegationLabel.Font.Color:=clBlack;

    tvl.SetFromString(trim(ModZeroeGateEdit.Text));
    if not tvl.IsEqualWith(FormPath.DPars[SelectedParameter].ModZeroesGate) then
    ModZeroeGateEdit.Text:=FormPath.DPars[SelectedParameter].ModZeroesGate.GetString;

    if tvl.Count=0 then ModZeroeGateNegationLabel.Font.Color:=clGray
    else ModZeroeGateNegationLabel.Font.Color:=clBlack;

    if FormPath.DPars[SelectedParameter].ValuesGate.Negation then ValueGateNegationLabel.Caption:='Принимает значения'
    else ValueGateNegationLabel.Caption:='Не принимает значения';
    if FormPath.DPars[SelectedParameter].ModZeroesGate.Negation then ModZeroeGateNegationLabel.Caption:='Кратно значениям'
    else ModZeroeGateNegationLabel.Caption:='Не кратно значениям';

    with FormPath.DPars[SelectedParameter] do begin
      if FormJustOpened then begin
        MinGateEdit.text:=inttostr(min);
        MaxGateEdit.Text:=inttostr(max);
        FormJustOpened:=false;
      end;

      ShowBitmaskInfo;

      if MinGateEdit.text=inttostr(Form2.Game.Pars[SelectedParameter].GetDefaultMinGate) then
      MinGateEdit.Font.Color:=clGray else MinGateEdit.Font.Color:=clBlack;

      if MaxGateEdit.text=inttostr(Form2.Game.Pars[SelectedParameter].GetDefaultMaxGate) then
      MaxGateEdit.Font.Color:=clGray else MaxGateEdit.Font.Color:=clBlack;

      if (MaxGateEdit.Font.Color=clGray)and(MinGateEdit.Font.Color=clGray) then Label11.Font.Color:=clGray
      else Label11.Font.Color:=clBlack;

      ParCriticalMessageMemo.Text:=CriticalMessage.text;
      if (trim(CriticalMessage.text)='') or (trim( ParCriticalMessageMemo.Text)='') then begin
        ParCriticalMessageMemo.text:='';

        ParCriticalMessageMemo.text:=trim(Form2.Game.Pars[SelectedParameter].CriticalMessage.Text);
        ParCriticalMessageMemo.Font.Color:=clGray;
      end else ParCriticalMessageMemo.Font.Color:=clBlack;

      flag:=not (Form2.Game.Pars[SelectedParameter].ParType=NoCriticalParType);
      case Form8.ParameterActivePathes[QuestPathIndex][SelectedParameter] of
        FailParType : ParCriticalMessageMemo.Font.Color:=clRed; //ParCritcalTypeShape.Pen.Color:=clRed;
        SuccessParType: ParCriticalMessageMemo.Font.Color:=clGreen; //ParCritcalTypeShape.Pen.Color:=clGreen;
        NoCriticalParType: begin
          //              flag:=false;
          //ParCritcalTypeShape.Pen.Color:=clGray;
          ParCriticalMessageMemo.Font.Color:=clBlack;
        end;
      end;
      //ParCritcalTypeShape.Visible:=flag;
      ParCriticalMessageMemo.Visible:=flag;
      //CriticalMessageBackgroundShape.Visible:=flag;
    {
    ParCritcalTypeShape.Visible:=true;
    ParCriticalMessageMemo.Visible:=true;
    CriticalMessageBackgroundShape.Visible:=true;
    }

    //   ParCriticalMessageMemo.Visible:=CriticalMessageVisible;
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

  if not WeMakingANewPath then begin
    flag:=not OldPath.IsEqualWith(FormPath);
    OkButton.Enabled:=flag
  end else OkButton.Enabled:=true;

  tvl.Destroy;
end;


procedure TForm3.FormShow(Sender: TObject);
begin
  is_next_pressed:=false;
  InitSameQuestionInfo;
  ProcessFormShow;
end;


procedure TForm3.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TForm3.OKButtonClick(Sender: TObject);
var
  i:integer;
begin
  is_ok_pressed:=true;

  for i:=1 to maxparameters do begin
    if FormPath.Dpars[i].min>FormPath.Dpars[i].max then begin
      FormPath.Dpars[i].min:=Form2.Game.Pars[i].GetDefaultMinGate;
      FormPath.Dpars[i].max:=Form2.Game.Pars[i].GetDefaultMaxGate;
    end;
  end;
  Form2.Game.Pathes[QuestPathIndex].CopyDataFrom(FormPath);
  Close;
end;


procedure TForm3.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //if Key=VK_ESCAPE then begin is_ok_pressed:=false; close; end;
  if Key=VK_ESCAPE then CancelButton.OnClick(sender);
end;


procedure TForm3.StartMessageEditChange(Sender: TObject);
begin
  FormPath.StartPathMessage.Text:=trim(StartMessageEdit.Text);
  process_enabled_controls;
end;

procedure TForm3.EndMessageEditChange(Sender: TObject);
begin
  FormPath.EndPathMessage.Text:=trim(EndMessageEdit.Text);

  if trim(FormPath.EndPathMessage.text)='' then FormPath.VoidPathFlag:=true
  else FormPath.VoidPathFlag:=false;

  process_enabled_controls;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=true;
  if not is_ok_pressed then begin
    CanClose:=false;
    if OldPath.IsEqualWith(FormPath) then begin
      is_ok_pressed:=false;
      CanClose:=true;
      exit;
    end;
    if MessageDlg('Отменить изменения?',mtConfirmation,[mbYes, mbNo],0)=mrYes then begin
      is_ok_pressed:=false;
      CanClose:=true;
    end;
  end;
end;

procedure TForm3.ParDeltaTrackBarChange(Sender: TObject);
begin
  FormPath.DPars[SelectedParameter].delta:=ParDeltaTrackBar.Position;
  ParValueLabel.Caption:=inttostr(ParDeltaTrackBar.Position);

  RedrawParTrackBar;

  Process_Enabled_Controls;
end;

procedure TForm3.ParViewActionRGClick(Sender: TObject);
begin
  FormPath.DPars[SelectedParameter].ParameterViewAction:=ParViewActionRG.ItemIndex;
  Process_Enabled_Controls;
end;

procedure TForm3.DeltaValueRadioBtnClick(Sender: TObject);
begin
  FormPath.DPars[SelectedParameter].DeltaPercentFlag:=false;
  FormPath.DPars[SelectedParameter].DeltaApprFlag:=false;
  FormPath.DPars[SelectedParameter].DeltaExprFlag:=false;

  RedrawParTrackBar;
  RedrawStatistsicsTimer.Enabled:=true;
  Process_Enabled_Controls;
end;

procedure TForm3.DeltaPercentRadioBtnClick(Sender: TObject);
begin
  FormPath.DPars[SelectedParameter].DeltaPercentFlag:=true;
  FormPath.DPars[SelectedParameter].DeltaApprFlag:=false;
  FormPath.DPars[SelectedParameter].DeltaExprFlag:=false;

  RedrawParTrackBar;
  RedrawStatistsicsTimer.Enabled:=true;
  Process_Enabled_Controls;
end;

procedure TForm3.ParCriticalMessageMemoChange(Sender: TObject);
begin
//   if trim(ParCriticalMessageMemo.text)='' then
   //   ParCriticalMessageMemo.text:='';

  if trim(ParCriticalMessageMemo.text) <> trim(Form2.Game.Pars[SelectedParameter].CriticalMessage.text) then begin
    FormPath.DPars[SelectedParameter].CriticalMessage.text:=(ParCriticalMessageMemo.text);
    Process_Enabled_Controls;
  end;
end;

procedure TForm3.MinGateEditChange(Sender: TObject);
begin
  if (MinGateEdit.text='') then
    FormPath.DPars[SelectedParameter].min:=Form2.Game.Pars[SelectedParameter].GetDefaultMinGate
  else
    FormPath.DPars[SelectedParameter].min:=strtoint(MinGateEdit.text);

  //if MinGateEdit.text=inttostr(tempDPars[SelectedParameter].min) then
  //MinGateEdit.Font.Color:=clGray else MinGateEdit.Font.Color:=clBlack;

  if MinGateEdit.text=inttostr(Form2.Game.Pars[SelectedParameter].GetDefaultMinGate) then
    MinGateEdit.Font.Color:=clGray else MinGateEdit.Font.Color:=clBlack;

  RedrawStatistsicsTimer.Enabled:=true;
  Process_Enabled_Controls;
  //end;
end;

procedure TForm3.MaxGateEditChange(Sender: TObject);
begin
  if (MaxGateEdit.text='')  then
    FormPath.DPars[SelectedParameter].max:=Form2.Game.Pars[SelectedParameter].GetDefaultMaxGate
  else
    FormPath.DPars[SelectedParameter].max:=strtoint(MaxGateEdit.text);

  //if maxGateEdit.text=inttostr(tempDPars[SelectedParameter].max) then
  //maxGateEdit.Font.Color:=clGray else maxGateEdit.Font.Color:=clBlack;

  if MaxGateEdit.text=inttostr(Form2.Game.Pars[SelectedParameter].GetDefaultMaxGate) then
    MaxGateEdit.Font.Color:=clGray else MaxGateEdit.Font.Color:=clBlack;

  RedrawStatistsicsTimer.Enabled:=true;
  Process_Enabled_Controls;
end;

{procedure TForm3.ParRadioButton1Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton2Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton3Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton4Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton5Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton6Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton7Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton8Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton9Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;}

procedure TForm3.RedrawStatistsicsTimerTimer(Sender: TObject);
begin
  RedrawStatistsicsTimer.Enabled:=false;
  DrawStatistics;
end;

procedure TForm3.TrackBarGroundShapeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  range:integer;
  currentposition:integer;
  dmax:integer;
begin
  if ssLeft in Shift then begin
    if FormPath.DPars[SelectedParameter].DeltaApprFlag then begin
       range:=Form2.Game.Pars[SelectedParameter].max-Form2.Game.Pars[SelectedParameter].min;
       currentposition:=
       round(range*(X)/TrackBarGroundShape.Width);
       ParDeltaTrackBar.Position:=Form2.Game.Pars[SelectedParameter].min+currentposition;

    end else begin
      if FormPath.DPars[SelectedParameter].DeltaPercentFlag then dmax:=100
        else dmax:=Math.max(abs(Form2.Game.Pars[SelectedParameter].min),
                      abs(Form2.Game.Pars[SelectedParameter].max));
         range:=2*abs(dmax);
         currentposition:=
           round(range*(X)/TrackBarGroundShape.Width)
           -
           abs(dmax);
         ParDeltaTrackBar.Position:=currentposition;
    end;
  end;

end;

procedure TForm3.TrackBarGroundShapeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TrackBarGroundShape.OnMouseMove(Sender,Shift,x,y);
end;

procedure TForm3.TrackBarGroundShapeMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
DrawStatistics;
end;

procedure TForm3.TrackBarLeftImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var dmin:integer;
begin
  if FormPath.DPars[SelectedParameter].DeltaApprFlag then begin
    dmin:=Form2.Game.Pars[SelectedParameter].min;

    if(FormPath.DPars[SelectedParameter].delta>dmin) then begin
      dec(FormPath.DPars[SelectedParameter].delta);
      Process_Enabled_Controls;
    end;
  end else begin
    if FormPath.DPars[SelectedParameter].DeltaPercentFlag then dmin:=100
    else dmin:=Math.max(abs(Form2.Game.Pars[SelectedParameter].min),abs(Form2.Game.Pars[SelectedParameter].max));

    if(abs(FormPath.DPars[SelectedParameter].delta)<dmin) then begin
      dec(FormPath.DPars[SelectedParameter].delta);
      Process_Enabled_Controls;
    end;
  end;
end;

procedure TForm3.TrackBarRightImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  dmax:integer;
begin
  if FormPath.DPars[SelectedParameter].DeltaApprFlag then begin
    dmax:=Form2.Game.Pars[SelectedParameter].max;

    if(FormPath.DPars[SelectedParameter].delta<dmax) then begin
      inc(FormPath.DPars[SelectedParameter].delta);
      Process_Enabled_Controls;
    end;
  end else begin
    if FormPath.DPars[SelectedParameter].DeltaPercentFlag then dmax:=100
    else dmax:=Math.max(abs(Form2.Game.Pars[SelectedParameter].min),abs(Form2.Game.Pars[SelectedParameter].max));

    if(FormPath.DPars[SelectedParameter].delta<dmax) then begin
      inc(FormPath.DPars[SelectedParameter].delta);
      Process_Enabled_Controls;
    end;
  end;
end;

procedure TForm3.TrackBarLeftImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DrawStatistics;
end;

procedure TForm3.TrackBarRightImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DrawStatistics;
end;

procedure TForm3.AlwaysShowWhenPlayCheckBoxClick(Sender: TObject);
begin
  FormPath.AlwaysShowWhenPlaying:=AlwaysShowWhenPlayCheckBox.Checked;
  process_enabled_controls;
end;

procedure TForm3.PassTimesValueEditChange(Sender: TObject);
begin
  if trim(PassTimesValueEdit.text)='' then
  PassTimesValueEdit.text:='0';

  if strtoint(PassTimesValueEdit.text)<0 then
  PassTimesValueEdit.text:='0';

  if trim(PassTimesValueEdit.text)='1' then
    PassTimesValueEdit.Font.Color:=clGray
  else
    PassTimesValueEdit.Font.Color:=clBlack;

  FormPath.PassTimesValue:=strtoint(PassTimesValueEdit.text);
  RedrawStatistsicsTimer.Enabled:=true;
  process_enabled_controls;
end;

{procedure TForm3.ParRadioButton10Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton11Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton12Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;}

procedure TForm3.BMCheck0Click(Sender: TObject);
begin
  GetBitmaskInfo;
  RedrawStatistsicsTimer.Enabled:=true;
  process_enabled_controls;
end;

procedure TForm3.BMCheck1Click(Sender: TObject);
begin
  GetBitmaskInfo;
  RedrawStatistsicsTimer.Enabled:=true;
  process_enabled_controls;
end;

procedure TForm3.BMCheck2Click(Sender: TObject);
begin
  GetBitmaskInfo;
  RedrawStatistsicsTimer.Enabled:=true;
  process_enabled_controls;
end;

procedure TForm3.BMCheck3Click(Sender: TObject);
begin
  GetBitmaskInfo;
  RedrawStatistsicsTimer.Enabled:=true;
  process_enabled_controls;
end;

procedure TForm3.BMCheck4Click(Sender: TObject);
begin
  GetBitmaskInfo;
  RedrawStatistsicsTimer.Enabled:=true;
  process_enabled_controls;
end;

procedure TForm3.BMCheck5Click(Sender: TObject);
begin
  GetBitmaskInfo;
  RedrawStatistsicsTimer.Enabled:=true;
  process_enabled_controls;
end;

procedure TForm3.BMCheck6Click(Sender: TObject);
begin
  GetBitmaskInfo;
  RedrawStatistsicsTimer.Enabled:=true;
  process_enabled_controls;
end;

procedure TForm3.BMCheck7Click(Sender: TObject);
begin
  GetBitmaskInfo;
  RedrawStatistsicsTimer.Enabled:=true;
  process_enabled_controls;
end;

procedure TForm3.BMCheck8Click(Sender: TObject);
begin
  GetBitmaskInfo;
  RedrawStatistsicsTimer.Enabled:=true;
  process_enabled_controls;
end;

procedure TForm3.CostOneDayCheckBoxClick(Sender: TObject);
var
  i:integer;
begin
  i:=0;
  if CostOneDayCheckBox.checked then i:=1;
  FormPath.DaysCost:=i;
  process_enabled_controls;
end;

procedure TForm3.ChangeValueGateNegationImgClick(Sender: TObject);
begin
  if not FormShowFlag then begin
    FormPath.DPars[SelectedParameter].ValuesGate.Negation:=
    FormPath.DPars[SelectedParameter].ValuesGate.Negation xor true;
    RedrawStatistsicsTimer.Enabled:=true;
    Process_Enabled_Controls;
  end;
end;

procedure TForm3.ChangeModZeroeGateNegationImgClick(Sender: TObject);
begin
  if not FormShowFlag then begin
    FormPath.DPars[SelectedParameter].ModZeroesGate.Negation:=
    FormPath.DPars[SelectedParameter].ModZeroesGate.Negation xor true;
    RedrawStatistsicsTimer.Enabled:=true;
    Process_Enabled_Controls;
  end;
end;

procedure TForm3.ValueGateEditChange(Sender: TObject);
var
  tvg:TValuesList;
begin
  tvg:=TValuesList.Create;
  tvg.CopyDataFrom(FormPath.DPars[SelectedParameter].ValuesGate);

  if not FormShowFlag then  begin
    if tvg.TestString(trim(ValueGateEdit.Text)) then begin
    tvg.SetFromString(trim(ValueGateEdit.Text));
    if not FormPath.DPars[SelectedParameter].ValuesGate.IsEqualWith(tvg) then begin
      FormPath.DPars[SelectedParameter].ValuesGate.CopyDataFrom(tvg);
      RedrawStatistsicsTimer.Enabled:=true;
      Process_Enabled_Controls;
    end;
  end;
end;

tvg.Destroy;
end;

procedure TForm3.ModZeroeGateEditChange(Sender: TObject);
var
  tvm:TValuesList;
begin
  tvm:=TValuesList.Create;
  tvm.CopyDataFrom(FormPath.DPars[SelectedParameter].ModZeroesGate);

  if not FormShowFlag then  begin
    if tvm.TestString(trim(ModZeroeGateEdit.Text)) then begin
      tvm.SetFromString(trim(ModZeroeGateEdit.Text));
      if not FormPath.DPars[SelectedParameter].ModZeroesGate.IsEqualWith(tvm) then begin
        tvm.SetFromString(trim(ModZeroeGateEdit.Text));
        FormPath.DPars[SelectedParameter].ModZeroesGate.CopyDataFrom(tvm);
        RedrawStatistsicsTimer.Enabled:=true;
        Process_Enabled_Controls;
      end;
    end;
  end;

  tvm.Destroy;
end;

procedure TForm3.ProbabilityEditChange(Sender: TObject);
var i:double;
begin
  if trim(probabilityedit.text)='' then exit;

  i:=strtofloat(trim(probabilityedit.text));

  FormPath.Probability:=i;

  if(trim(probabilityedit.text)='0') or
    (trim(probabilityedit.text)='0,') or
    (trim(probabilityedit.text)='0,0') or
    (trim(probabilityedit.text)='0,00') or
    (trim(probabilityedit.text)='') then begin
    exit;
  end;

  if i<0.001 then begin
    probabilityedit.text:='0,001';
    exit;
  end;

  if i<>1 then probabilityedit.Font.Color:=clBlack
  else probabilityedit.Font.Color:=clGray;

  Process_Enabled_Controls;
end;

procedure TForm3.DeltaApprRadioBtnClick(Sender: TObject);
begin
  FormPath.DPars[SelectedParameter].DeltaPercentFlag:=false;
  FormPath.DPars[SelectedParameter].DeltaApprFlag:=true;
  FormPath.DPars[SelectedParameter].DeltaExprFlag:=false;

  ParDeltaTrackBar.Position:=trunc((Form2.Game.Pars[SelectedParameter].min+Form2.Game.Pars[SelectedParameter].max)/2);
  RedrawParTrackBar;
  RedrawStatistsicsTimer.Enabled:=true;
  Process_Enabled_Controls;
end;

{procedure TForm3.ParTabSetChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  ProcessParTab(newtab);
  ProcessTabParSelect(newtab);
end;

procedure TForm3.ParTabSetClick(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;}

procedure TForm3.DeltaExprRadioBtnClick(Sender: TObject);
begin
  FormPath.DPars[SelectedParameter].DeltaPercentFlag:=false;
  FormPath.DPars[SelectedParameter].DeltaApprFlag:=false;
  FormPath.DPars[SelectedParameter].DeltaExprFlag:=true;
  SymWarnLabel.Visible:=false;
  ParenthesErrorLabel.Visible:=false;
  ParameterErrorLabel.Visible:=false;
  ValueErrorLabel.Visible:=false;
  ParseOkLabel.Visible:=false;
  ExpressionEdit.Text:=FormPath.DPars[SelectedParameter].Expression.Text;
  RedrawParTrackBar;
  RedrawStatistsicsTimer.Enabled:=true;
  Process_Enabled_Controls;
end;

procedure TForm3.ExpressionEditChange(Sender: TObject);
var
  ltstr,tstr:string;
  parse:TCalcParse;
begin
  if FormPath.DPars[SelectedParameter].DeltaExprFlag then begin
    parse:=TCalcParse.Create;
    tstr:=trim(ExpressionEdit.Text);
    ltstr:=FormPath.DPars[SelectedParameter].Expression.Text;
    parse.AssignAndPreprocess(tstr,SelectedParameter);

    SymWarnLabel.Visible:=parse.sym_warning;
    ParenthesErrorLabel.Visible:=parse.parentheses_error;
    ParameterErrorLabel.Visible:=parse.parameters_error;
    ValueErrorLabel.Visible:=parse.num_error;
    DiapErrorLabel.Visible:=parse.diapazone_error;
    ParseOkLabel.Visible:=not parse.error;
    if not parse.error then begin
      FormPath.DPars[SelectedParameter].Expression.Text:=parse.ConvertToExternal(parse.internal_str);
      if parse.default_expression then FormPath.DPars[SelectedParameter].Expression.Text:='';
      RedrawStatistsicsTimer.Enabled:=true;
    end;
    parse.Destroy;
  end;
end;

{procedure TForm3.ParRadioButton13Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton14Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton15Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton16Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton17Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton18Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton19Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton20Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton21Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton22Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton23Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;

procedure TForm3.ParRadioButton24Click(Sender: TObject);
begin
  ProcessParRadioButtonClick;
end;}

procedure TForm3.LogicExpressionEditChange(Sender: TObject);
var
  ltstr,tstr:string;
  parse:TCalcParse;
begin
  parse:=TCalcParse.Create;
  tstr:=trim(LogicExpressionEdit.Text);
  ltstr:=FormPath.LogicExpression.Text;
  parse.AssignAndPreprocess(tstr,1);

  LSymWarnLabel.Visible:=parse.sym_warning;
  LParenthesErrorLabel.Visible:=parse.parentheses_error;
  LParameterErrorLabel.Visible:=parse.parameters_error;
  LValueErrorLabel.Visible:=parse.num_error;
  LDiapErrorLabel.Visible:=parse.diapazone_error;
  LParseOkLabel.Visible:=not parse.error;
  if not parse.error then begin
    FormPath.LogicExpression.Text:=parse.ConvertToExternal(parse.internal_str);
    if parse.default_expression then FormPath.LogicExpression.Text:='';
    RedrawStatistsicsTimer.Enabled:=true;
  end;
  parse.Destroy;
end;

procedure TForm3.NextOQPButtonClick(Sender: TObject);
var
  i:integer;
  savechanges:boolean;
begin
  savechanges:=true;
  if (not OldPath.IsEqualWith(FormPath))or(WeMakingANewPath) then begin
    if MessageDlg('Coхранить изменения?',mtConfirmation,[mbYes, mbNo],0)=mrNo then begin
      savechanges:=false;
    end;
  end;
  is_next_pressed:=true;
  WeMakingANewPath:=false;
  for i:=1 to maxparameters do begin
    if FormPath.Dpars[i].min>FormPath.Dpars[i].max then begin
      FormPath.Dpars[i].min:=Form2.Game.Pars[i].GetDefaultMinGate;
      FormPath.Dpars[i].max:=Form2.Game.Pars[i].GetDefaultMaxGate;
    end;
  end;
  if savechanges then Form2.Game.Pathes[QuestPathIndex].CopyDataFrom(FormPath);
  inc(SameQuestionCurPos);
  if SameQuestionCurPos>SameQuestionPathCount then SameQuestionCurPos:=1;
  QuestPathIndex:=SameQuestionPathIndexes[SameQuestionCurPos];
  ProcessFormShow;
end;

procedure TForm3.DefUnlPathGoTimesCheckClick(Sender: TObject);
begin
  if DefUnlPathGoTimesCheck.Checked then begin
    PassTimesValueEdit.Visible:=false;
    PassTimesValueEdit.Text:='0';
    DefUnlPathGoTimesCheck.Caption:='Неограниченная проходимость';
    DefUnlPathGoTimesCheck.Width:=199;
    PTLabel.Visible:=false;
  end else begin
    PassTimesValueEdit.Visible:=true;
    PassTimesValueEdit.Text:=inttostr(OldPath.PassTimesValue);
    DefUnlPathGoTimesCheck.Caption:='Неограниченная';
    DefUnlPathGoTimesCheck.Width:=103;
    PTLabel.Visible:=true;
  end;
end;

procedure TForm3.ShowOrderTrackBarChange(Sender: TObject);
begin
  FormPath.ShowOrder:=ShowOrderTrackBar.Position;
  ShowOrderGauge.Progress:=FormPath.ShowOrder;
  ShowOrderLabel.Caption:=inttostr(FormPath.ShowOrder);
  if FormPath.ShowOrder>4 then begin
    ShowOrderLabel.Font.Color:=clWhite;
  end else begin
    ShowOrderLabel.Font.Color:=clBlack;
  end;
  Process_Enabled_Controls;
end;

procedure TForm3.ParListClick(Sender: TObject);
begin
  ProcessParRadioButtonClick();
end;

procedure TForm3.ParListClickCheck(Sender: TObject);
var
  i: integer;
begin
  for i:=1 to maxparameters do
    if(ParList.ItemEnabled[i-1]) then ParList.Checked[i-1]:=true;
end;

function TForm3.ParListGetItem(i: integer): string;
//var
  //ln: Integer;
begin
  //ln:=Length(ParList.Items[i - 1]);
  //if(i > 9) then result:=RightStr(ParList.Items[i - 1], ln - 3)
  //else result:=RightStr(ParList.Items[i - 1], ln - 4);
  Result:=ParList.Items[i - 1];
end;

procedure TForm3.ParListSetItem(i: integer; s: string);
begin
  s:='[p' + IntToStr(i) + '] ' + s;
  if(ParList.Items[i-1] <> s) then ParList.Items[i-1]:=s; //'p' + IntToStr(i) + ': ' + s;
end;

end.
