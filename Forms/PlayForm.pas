unit PlayForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,
  GameContent,
  ValueListClass,
  LocationClass,
  CalcParseClass,
  ParameterClass,
  ParameterDeltaClass,
  ExtCtrls, EC_BlockPar, Buttons, ActnList, StdActns, ExtActns, ActnMan,
  ComCtrls, XPStyleActnCtrls;


type TParValues=array [1..maxparameters] of integer;
type TParameterDeltas= array [1..maxparameters] of TParameterDelta;
type TParameterVisibleState=array [1..maxparameters] of boolean;
type AInt=array of integer;

type TAnswer=record
  i:integer;
  so:integer;
  GatesOk:boolean;
  text:WideString;
end;

type TButtonCalback=procedure of object;

type ColoredTextRegion=record
  text_start:integer;
  length:integer;
end;

type SituationDescriptionText=record
  text:widestring;
  col_regions:array [1..150] of ColoredTextRegion;
  cr_count:integer;
  need_click:boolean;
end;

type ATAnswer=array of TAnswer;

const
  UndoMax=20000;

  GameStateOK=1;
  GameStateAFail=2;
  GameStateBFail=3;
  GameStateCFail=4;
  GameStateSuccess=5;
  GameStateGoPath=6;
  GameStateStart=7;
  GameStateFail=8;

  MaxGoPathDeep=2401;

  MaxAnswer=32;

Type PM=^TBlockParEC;


type
  TForm6 = class(TForm)
    CancelButton: TButton;
    MakeUndoButton: TButton;
    AnswersGroupBox: TGroupBox;

    ScrollBox1: TScrollBox;

    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;

    Shape4: TShape;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ParLabel1: TLabel;
    ProgressLabel: TLabel;
    SDTRichEdit: TRichEdit;
    ActionManager1: TActionManager;
    RichEditBold1: TRichEditBold;
    StartGameTimer: TTimer;
    Panel1: TPanel;
    LabelWait: TLabel;

    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure Button2Click(Sender: TObject);
    procedure ProcessAction;

    function StringStartsFrom(var str:widestring;pos:integer;start:widestring):boolean;
    procedure MakeSDT(txt:widestring);
    procedure ExecSDT;
    procedure SDTcall(txt:widestring; need_not_proceed:boolean);

    procedure Proceed;

    function StringReplaceEC(str:WideString; sold:WideString; snew:WideString):WideString;

    procedure MakeDo;
    procedure MakeUndo;
    procedure MakeUndoButtonClick(Sender: TObject);

    procedure ShowFail;
    procedure ShowSuccess;

    procedure StartGame;

    procedure WeAreInTheLocation; overload;
    procedure WeAreFailForPars;
    procedure MakeGoPath; overload;

    function WeHaveSavingPath(Location,ParameterNumber:integer; var Pars:TParValues):boolean;

    function IsGameLocationParameterFail(Location:integer; var pars,oldpars:TParValues):boolean;
    function IsGameLocationParameterSuccess(Location:integer; var pars,oldpars:TParValues):boolean;
    function IsGamePathParameterFail(Path:integer;var pars,oldpars:TParValues):boolean;
    function IsGamePathParameterSuccess(Path:integer; var pars,oldpars:TParValues):boolean;

    function IsParametersGatesOk(var pars:TParValues; pathindex:integer):boolean;
    function IsParametersBitmaskOk(parametervalue, bitmask:integer):boolean;

    function IsValueGatesOk(parametervalue:integer;valuegate:TValuesList):boolean;
    function IsModZeroeGatesOk(parametervalue:integer;valuegate:TValuesList):boolean;

    function GetPathByProbability(pathes:ATAnswer; count:integer):TAnswer;

    procedure ProcessParametersWithDelta(var pars:TParValues; var delta:TParameterDeltas);

    procedure ProcessParVisualOpions(delta:TParameterDeltas);

    function ShowPathes(testmode:boolean):integer;
    procedure ProcessShowParameters;

    procedure CheckLocationType;

    function FixStringParameters(txt:wideString;SDT:boolean):WideString;
    function FixStringValueParameters(txt:wideString;SDT:boolean):WideString;

    procedure AddAnswer(PathIndex:integer; txt:widestring; enabled:boolean);
    procedure ClearAnswers;
    procedure ProcessCheckAnswer;

    function ArePathesStillFromHere(Location:integer):boolean;
    function NeverHadPathes(Location:integer):boolean;

    function GetDayPassedStr:string;

    procedure LabelClick(Sender: TObject);
    procedure LabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

    {procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Label2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Label3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Label4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Label5MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Label6MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Label7MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Label8MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);}
    procedure StartGameTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);

  private
    procedure MakeGoPath(deep:integer); overload;
    procedure WeAreInTheLocation(deep:integer); overload;
    { Private declarations }
  public
    { Public declarations }
    M:PM;
    PlayGame:TGame;
    current_location_number:integer;
    GameState:integer;

    UndoIndex:integer;

    ParVisState: TParameterVisibleState;
    UndoParVis:array [0..UndoMax] of TParameterVisibleState;
    UndoPar:array [0..UndoMax] of TParValues;
    UndoLocation,UndoPathX,UndoPathY:array [0..UndoMax] of integer;
    UndoDaysPassed: array [0..UndoMax] of integer;

    CurrPathX, CurrPathY:integer;

    ButtonCalback:TButtonCalback;

    PathesWeCanGo: array [1..maxlocations,1..maxpathes] of integer;

    accessible_pathes: array[1..50] of integer;
    accessible_pathes_count:integer;

    CustomCriticalMessage:widestring;
    CurrentCriticalParameter:integer;

    CheckedAnswer:integer;
    AnswerLabels: array[1..MaxAnswer] of TLabel;
    oldcheckanswer:integer;
    lastpathindex:integer;
    GamePars:TParValues;
    LastCommandIsUndo:boolean;
    dayspassed:integer;
    voidpathindex:integer;

    ProgressString:string; 
    ProgressCount:integer;
    StopWalkingPressed:boolean;

    SDT:SituationDescriptionText;
    proceed_clicked:boolean;
  end;

var
  Form6: TForm6;

implementation

{$R *.DFM}

uses MainForm;


procedure Tform6.Proceed;
begin
	Proceed_Clicked:=true;
end;


function Tform6.StringStartsFrom(var str:widestring;pos:integer;start:widestring):boolean;
var
  i:integer;
	answer:boolean;
begin
  answer:=true;
  if length(str)>=pos then begin
    if (length(start)+pos-1)>length(str) then begin
      answer:=false;
    end else begin
      for i:=1 to length(start) do begin
        if str[i+pos-1]<>start[i] then begin
          answer:=false;
          break;
        end;
      end;
    end;
  end else begin
    answer:=false;
  end;
  StringStartsFrom:=answer;
end;

procedure Tform6.MakeSDT(txt:widestring);
label next,next1,next2;
var
  tstr:widestring;
  sl:integer;
  i,sr_diff:integer;
begin
  SDT.cr_count:=0;
  sr_diff:=0;
  tstr:='';
  for i:=1 to 50 do begin
    SDT.col_regions[i].text_start:=0;
    SDT.col_regions[i].length:=0;
  end;
  i:=1;
  sl:=length(txt);
  while i<=sl do begin
    if StringStartsFrom(txt,i,'<clr>') then goto next1;
    while not StringStartsFrom(txt,i,'<clr>') and (i<=sl) do  begin
      tstr:=tstr+txt[i];
      inc(i);
      next1:
      if StringStartsFrom(txt,i,'<clr>') then begin
        inc(SDT.cr_count);
        i:=i+5;
        sr_diff:=sr_diff+5;
        SDT.col_regions[SDT.cr_count].text_start:=i-sr_diff;
        if StringStartsFrom(txt,i,'<clrEnd>') then goto next2;
        while not StringStartsFrom(txt,i,'<clrEnd>') and (i<=sl) do begin
          tstr:=tstr+txt[i];
          inc(i);
          inc(SDT.col_regions[SDt.cr_count].length);
          if i>sl then goto next;
          next2:
          if StringStartsFrom(txt,i,'<clrEnd>') then begin
            i:=i+8;
            sr_diff:=sr_diff+8;
            goto next;
          end;
        end
      end;
    end;

    next:
  end;

  SDT.text:=tstr;

  if(tstr=trim(SDTRichEdit.Text)) or (tstr='')then begin
    SDT.need_click:=false;
  end else begin
    SDT.need_click:=true;
  end;
end;

procedure Tform6.ExecSDT;
var
	i:integer;
begin
  SDTRichEdit.Text:=SDT.text;
  SDTRichEdit.SelStart:=0;
  SDTRichEdit.SelLength:=length(SDT.text);
  SDTRichEdit.SelAttributes.Color:=clBlack;
  SDTRichEdit.SelStart:=-1;
  SDTRichEdit.SelLength:=0;
  for i:=1 to SDT.cr_count do begin
    SDTRichEdit.SelStart:=SDT.col_regions[i].text_start-1;
    SDTRichEdit.SelLength:=SDT.col_regions[i].length;
    SDTRichEdit.SelAttributes.Color:=clBlue;
  end;
  SDTRichEdit.SelStart:=-1;
  SDTRichEdit.SelLength:=0;
  SDTRichEdit.SelAttributes.Color:=clBlack;

  SDT.cr_count:=0;
end;

procedure Tform6.SDTcall(txt:widestring; need_not_proceed:boolean);
begin
  SpeedButton1.Visible:=false;
  SpeedButton1.Update;

  txt:=trim(txt);
  proceed_clicked:=false;
  if need_not_proceed then SDT.need_click:=false;
  if SDT.need_click then begin
    proceed_clicked:=false;
    ClearAnswers;
    AddAnswer(0,'Далее',true);
    ButtonCalback:=Proceed;
    while not proceed_clicked do begin
      Application.ProcessMessages;
      if StopWalkingPressed then exit;
    end;
  end;

  SpeedButton1.Visible:=true;
  SpeedButton1.Update;

  MakeSDT(txt);
  ExecSDT;
end;

procedure Tform6.WeAreInTheLocation;
begin
  StopWalkingPressed:=false;
  ProgressCount:=0;
  ProgressLabel.Caption:='';
  WeAreInTheLocation(0);
  StopWalkingPressed:=true;
end;

procedure Tform6.MakeGoPath;
begin
  StopWalkingPressed:=false;
  ProgressCount:=0;
  ProgressLabel.Caption:='';
  MakeGoPath(0);
  StopWalkingPressed:=true;
end;

function Tform6.IsValueGatesOk(parametervalue:integer;valuegate:TValuesList):boolean;
var
  i:integer;
  answer:boolean;
begin

  if not valuegate.Negation then begin
    answer:=true;
    for i:=1 to valuegate.Count do begin
      if valuegate.Values[i]=parametervalue then begin answer:=false;
        break;
      end;
    end;
  end else begin
    answer:=false;
    for i:=1 to valuegate.Count do begin
      if valuegate.Values[i]=parametervalue then begin answer:=true;
        break;
      end;
    end;
  end;

  if valuegate.Count=0 then answer:=true;

  IsValueGatesOk:=answer;
end;

function Tform6.IsModZeroeGatesOk(parametervalue:integer;valuegate:TValuesList):boolean;
var
  i:integer;
  answer:boolean;
begin

  if not valuegate.Negation then begin
    answer:=true;
    for i:=1 to valuegate.Count do begin
      if (parametervalue mod valuegate.Values[i])=0 then begin answer:=false;
        break;
      end;
    end;
  end else begin
    answer:=false;
    for i:=1 to valuegate.Count do begin
      if (parametervalue mod valuegate.Values[i])=0 then begin answer:=true;
        break;
      end;
    end;
  end;


  if valuegate.Count=0 then answer:=true;

  IsModZeroeGatesOk:=answer;
end;

function Tform6.GetPathByProbability(pathes:ATAnswer; count:integer):TAnswer;
label done;
var
  i:integer;
  PAnswer:TAnswer;
  ClearedAnswers:array [1..50] of TAnswer;
  C_count:integer;
  maxrnd:integer;
  custom_maxrnd: array [1..50] of integer;
  cur_rndvalue:integer;
  l,t,k:integer;
  always_show_enabled:boolean;
begin
 //   if count=4 then showmessage('!!!');
  PAnswer.i:=-1;
  if (count=1)and
  (
  ((not pathes[1].GatesOk)and(PlayGame.Pathes[pathes[1].i].AlwaysShowWhenPlaying))
  or
  (pathes[1].GatesOk)
  )
  then begin

    if PlayGame.Pathes[pathes[1].i].Probability<1 then begin
      k:=random(1000);
      t:=trunc(PlayGame.Pathes[pathes[1].i].Probability*1000);
      if k<=t then begin
        PAnswer:=pathes[1];
        goto done;
      end else begin
        PAnswer.i:=-1;
        goto done;
      end;
    end else begin
      PAnswer:=pathes[1];
      goto done;
    end;
  end;
  C_count:=0;
  always_show_enabled:=true;
  for i:=1 to count do begin
    if pathes[i].GatesOk then always_show_enabled:=false;
  end;
  for i:=1 to count do begin
    if pathes[i].GatesOk or (always_show_enabled and PlayGame.Pathes[pathes[i].i].AlwaysShowWhenPlaying) then begin
      inc(C_count);
      ClearedAnswers[C_count]:=pathes[i];
    end;
  end;

  maxrnd:=0;
  for i:=1 to C_count do begin
    custom_maxrnd[i]:=round(PlayGame.Pathes[ClearedAnswers[i].i].Probability*1000);
    maxrnd:=maxrnd+custom_maxrnd[i];
  end;

  cur_rndvalue:=random(maxrnd);

  l:=0;
  for i:=1 to C_count do begin
    if cur_rndvalue<(custom_maxrnd[i]+l) then begin
      PAnswer:=ClearedAnswers[i];
      goto done;
    end;
    l:=l+(custom_maxrnd[i]);
  end;

  done:
  GetPathByProbability:=PAnswer;
end;

function Tform6.GetDayPassedStr:string;
var
  dayspassedstr:string;
begin
  dayspassedstr:=#13#10+'Квест длился дней: ' + inttostr(dayspassed);

  if dayspassed >=10 then
    dayspassedstr:=dayspassedstr+#13#10'Рекомендуется понизить длительность '+
      'до 10 дней или меньше.';

  GetDayPassedStr:=dayspassedstr;
end;


function TForm6.IsGamePathParameterFail(Path:integer; var pars,oldpars:TParValues): boolean;
label done;
var
  i:integer;
  answer:boolean;
begin
  answer:=false;

  if path<=0 then goto done;

  for i:=1 to maxparameters do
    if (oldpars[i]<>pars[i])and(PlayGame.Pars[i].Enabled)and
      ((PlayGame.Pars[i].ParType=FailParType)or(PlayGame.Pars[i].ParType=DeathParType)) and
      (((PlayGame.Pars[i].LoLimit)and
      (pars[i]<=PlayGame.Pars[i].min)) or
      ((not PlayGame.Pars[i].LoLimit)and
      (pars[i]>=PlayGame.Pars[i].max)))
    then begin answer:=true;
      CustomCriticalMessage:=
      trim(PlayGame.Pathes[path].dpars[i].CriticalMessage.text);
      CurrentCriticalParameter:=i;
      break;
    end;
  done:
  IsGamePathParameterFail:=answer;
end;


function TForm6.IsGamePathParameterSuccess(Path:integer; var pars,oldpars:TParValues):boolean;
label done;
var
  i:integer;
  answer:boolean;
begin
  answer:=false;

  if path<=0 then goto done;

  for i:=1 to maxparameters do
    if (oldpars[i]<>pars[i])and(PlayGame.Pars[i].Enabled)and
      ((PlayGame.Pars[i].ParType=SuccessParType)) and
      (((PlayGame.Pars[i].LoLimit)and(pars[i]<=PlayGame.Pars[i].min))
      or ((not PlayGame.Pars[i].LoLimit)and(pars[i]>=PlayGame.Pars[i].max)))
    then begin answer:=true;
      CustomCriticalMessage:=
      trim(PlayGame.Pathes[path].dpars[i].CriticalMessage.text);
      CurrentCriticalParameter:=i;
      break;
    end;
  done:
  IsGamePathParameterSuccess:=answer;
end;

function TForm6.WeHaveSavingPath(Location,ParameterNumber:integer;var Pars:TParValues):boolean;
var
  answer:boolean;
  i:integer;
begin

  answer:=false;
  // WeGoSavingPath:=false;
  for i:=1 to PlayGame.PathesValue do begin
    if (PathesWeCanGo[Location][i]>=1) and (IsParametersGatesOk(pars,i)) then begin
      //WeGoSavingPath:=true;
      answer:=true; break;
    end;
  end;

  WeHaveSavingPath:=answer;
end;

function TForm6.IsGameLocationParameterFail(Location:integer;var pars,oldpars:TParValues):boolean;
var
  i:integer;
  answer:boolean;
begin
  answer:=false;
  for i:=1 to maxparameters do
    if(oldpars[i]<>pars[i])and(PlayGame.Pars[i].Enabled)and
      (not WeHaveSavingPath(Location,i,pars))and
      ((PlayGame.Pars[i].ParType=FailParType)or(PlayGame.Pars[i].ParType=DeathParType)) and
      (((PlayGame.Pars[i].LoLimit)and
      (pars[i]<=PlayGame.Pars[i].min)) or
      ((not PlayGame.Pars[i].LoLimit)and
      (pars[i]>=PlayGame.Pars[i].max)))
    then begin answer:=true;
      CustomCriticalMessage:=trim(PlayGame.Locations[location].dpars[i].CriticalMessage.text);
      CurrentCriticalParameter:=i;
      break;
    end;
  IsGameLocationParameterFail:=answer;
end;

function TForm6.IsGameLocationParameterSuccess(Location:integer;var pars,oldpars:TParValues):boolean;
var
  i:integer;
  answer:boolean;
begin
  answer:=false;
  for i:=1 to maxparameters do
    if (oldpars[i]<>pars[i])and(PlayGame.Pars[i].Enabled)and
      ((PlayGame.Pars[i].ParType=SuccessParType)) and
      (((PlayGame.Pars[i].LoLimit)and(pars[i]<=PlayGame.Pars[i].min)) or
      ((not PlayGame.Pars[i].LoLimit)and(pars[i]>=PlayGame.Pars[i].max)))
    then begin answer:=true;
      CustomCriticalMessage:=trim(PlayGame.Locations[location].dpars[i].CriticalMessage.text);
      CurrentCriticalParameter:=i;
      break;
    end;
  IsGameLocationParameterSuccess:=answer;
end;

function TForm6.IsParametersGatesOk(var pars:TParValues; pathindex:integer):boolean;
var
  i:integer;
  answer:boolean;
  parse:TCalcParse;
  tstr:string;
begin
  answer:=true;
  with PlayGame.Pathes[pathindex] do begin
    tstr:=trim(LogicExpression.Text);
    if tstr<>'' then begin
      parse:=TCalcParse.Create;
      //         	parse.AssignAndPreprocess(tstr,1); // 1 - не имееет значения
      parse.internal_str:=parse.ConvertToInternal(tstr);
      if not parse.default_expression then begin
        if not parse.error then begin
          parse.Parse(CalcParseClass.TParValues(pars));
          if (not parse.calc_error)and(parse.answer=0) then begin
            answer:=false;
          end;
        end;
      end;
      parse.Destroy;
    end;

    for i:=1 to maxparameters do begin
      if PlayGame.Pars[i].Enabled then begin
        if pars[i]>DPars[i].max then begin answer:=false; break; end;
        if pars[i]<DPars[i].min then begin answer:=false; break; end;
        if not IsParametersBitmaskOk(pars[i],DPars[i].bitmask) then begin
          answer:=false;
          break;
        end;
        if not IsValueGatesOk(pars[i],DPars[i].ValuesGate) then begin
          answer:=false;
          break;
        end;
        if not IsModZeroeGatesOk(pars[i],DPars[i].ModZeroesGate) then begin
          answer:=false;
          break;
        end;
      end;
    end;
  end;
  IsParametersGatesOk:=answer;
end;


function TForm6.IsParametersBitmaskOk(parametervalue, bitmask:integer):boolean;
label done;
var
  answer:boolean;
  c:integer;
begin
  answer:=true;

  for c:=1 to 9 do begin
    if((parametervalue and 1)=0) and ((bitmask and 1)=1) then begin
      answer:=false;
      goto done;
    end;
    parametervalue:=parametervalue shr 1;
    bitmask:=bitmask shr 1;
  end;

  done:
  IsParametersBitmaskOk:=answer;
end;

procedure Tform6.ProcessParVisualOpions(delta:TParameterDeltas);
var
  i:integer;
begin
  for i:=1 to maxparameters do begin
    if delta[i].ParameterViewAction=HideParameter then begin
      ParVisState[i]:=false;
    end;
    if delta[i].ParameterViewAction=ShowParameter then
      ParVisState[i]:=true;

    //if PlayGame.Pars[i].Hidden then ParVisState[i]:=false;
  end;
end;


procedure TForm6.ProcessParametersWithDelta(var pars:TParValues;var delta:TParameterDeltas);
var
  i:integer;
  parse:TCalcParse;
  tstr:string;
  tpars:TParValues;
begin
  for i:=1 to maxparameters do begin
    if PlayGame.Pars[i].Enabled then begin
      tstr:=trim(delta[i].Expression.Text);
      if (delta[i].DeltaExprFlag) then begin
        if (tstr<>'') then begin
          parse:=TCalcParse.Create;
          //	            	parse.AssignAndPreprocess(tstr,i);
          parse.internal_str:=parse.ConvertToInternal(tstr);
          parse.Parse(CalcParseClass.TParValues(pars));
          if (not parse.error) then begin
          tpars[i]:=parse.answer;
          end;
          parse.Destroy;
        end else begin
          tpars[i]:=pars[i];
        end;
      end else begin
        if delta[i].DeltaApprFlag then begin
          tpars[i]:=delta[i].delta;
        end else begin
          if delta[i].DeltaPercentFlag then tpars[i]:=pars[i] + round((pars[i]/100)*(delta[i].delta))
          else tpars[i]:=pars[i] + delta[i].delta;
        end;
      end;
      if tpars[i]>PlayGame.Pars[i].max then tpars[i]:=PlayGame.Pars[i].max;
      if tpars[i]<PlayGame.Pars[i].min then tpars[i]:=PlayGame.Pars[i].min;
    end;
  end;
  for i:=1 to maxparameters do begin
    if PlayGame.Pars[i].Enabled then begin
      pars[i]:=tpars[i];
    end;
  end;
end;


function TForm6.ArePathesStillFromHere(Location:integer):boolean;
label alldone;
var i:integer;
begin
  with PlayGame.Locations[Location] do
    if EndLocationFlag or FailLocationFlag then begin
      ArePathesStillFromHere:=true;
      goto alldone;
    end;

  if NeverHadPathes(location) then begin
    ArePathesStillFromHere:=true;
    goto alldone;
  end;


  for i:=1 to PlayGame.PathesValue do
    if PathesWeCanGo[Location][i]>=1 then begin ArePathesStillFromHere:=true;
      goto alldone;
    end;
  ArePathesStillFromHere:=false;
  alldone:
end;

function Tform6.NeverHadPathes(Location:integer):boolean;
var i:integer;
    yes:boolean;
begin
        yes:=true;

    for i:=1 to PlayGame.PathesValue do

       if PlayGame.Pathes[i].FromLocation=PlayGame.Locations[location].LocationNumber then
        begin
           yes:=false;
           break;
        end;

        NeverHadPathes:=yes;
end;

procedure Tform6.ProcessCheckAnswer;
var
  i:integer;
begin
  if(checkedanswer <> oldcheckanswer) then begin
    for i:=1 to MaxAnswer do begin
      AnswerLabels[i].Font.Color:=clBlack;
      AnswerLabels[i].Font.Style:=[];
    end;
    if(CheckedAnswer > 0) and (CheckedAnswer <= MaxAnswer) then begin
      AnswerLabels[CheckedAnswer].Font.Color:=clNavy;
      AnswerLabels[CheckedAnswer].Font.Style:=[fsUnderline];
    end;
    //else ShowMessage('Erropr while ProcessCheckAnswer');
  end;
  oldcheckanswer:=checkedanswer;
end;

procedure Tform6.ClearAnswers;
var
  i:integer;
begin
  accessible_pathes_count:=0;
  for i:=1 to MaxAnswer do begin
    AnswerLabels[i].Visible:=false;
    AnswerLabels[i].Enabled:=true;
  end;
  CheckedAnswer:=-1;
end;

procedure Tform6.AddAnswer(PathIndex:integer; txt:widestring; enabled:boolean);
var
  i{, theight, height, stdwidth}:integer;
begin
  if(accessible_pathes_count > MaxAnswer) then exit;

  //stdwidth:=490;
  for i:=1 to MaxAnswer do AnswerLabels[i].Visible:=false;

  inc(accessible_pathes_count);
  accessible_pathes[accessible_pathes_count]:=PathIndex;

  AnswerLabels[accessible_pathes_count].Caption:='- '+txt;
  AnswerLabels[accessible_pathes_count].Enabled:=enabled;

  //height:=(AnswersGroupBox.Height-10) div accessible_pathes_count;

  for i:=1 to accessible_pathes_count do begin
    AnswerLabels[i].AutoSize:=true;
    AnswerLabels[i].Caption:=AnswerLabels[i].Caption;
    AnswerLabels[i].AutoSize:=false;
    AnswerLabels[i].Width:=950;//490; //stdwidth;
    //theight:=AnswerLabels[i].height;
    //AnswerLabels[i].Top:=9 + height*(i-1) + (height-theight) div 2;
    AnswerLabels[i].Visible:=true;
  end;
end;


function TForm6.StringReplaceEC(str:WideString; sold:WideString; snew:WideString):WideString;
var
  strlen,soldlen,i,u:integer;
begin
  Result:='';
  strlen:=Length(str);
  soldlen:=Length(sold);
  if (strlen<soldlen) or (strlen<1) or (soldlen<1) then begin Result:=str; Exit; end;

  i:=0;
  while i<=strlen-soldlen do begin
    u:=0;
    while u<soldlen do begin
      if str[i+u+1]<>sold[u+1] then break;
      inc(u);
    end;

    if u>=soldlen then begin
      Result:=Result+snew;
      i:=i+soldlen;
    end else begin
      Result:=Result+str[i+1];
      inc(i);
    end;
  end;

  if i<strlen then begin
    Result:=Result+Copy(str,i+1,strlen-i);
  end;
end;

procedure TForm6.CheckLocationType;
var
  locationindex:integer;
begin
  locationindex:=PlayGame.GetLocationIndex(current_location_number);
  if (PlayGame.Locations[locationindex].EndLocationFlag) then begin
    //Проверка на достижение финальной локации
    GameState:=GameStateSuccess;
    ClearAnswers;
    AddAnswer(0,'Конец квеста'+GetDayPassedStr,true);
    ButtonCalback:=WeAreInTheLocation;
  end else if (PlayGame.Locations[locationindex].FailLocationFlag) then begin
    //Проверка на достижение провальной локации
    GameState:=GameStateFail;
    ClearAnswers;
    AddAnswer(0,'Игра кончилась',true);
    ButtonCalback:=WeAreInTheLocation;
  end else begin
    GameState:=GameStateGoPath;
    // ClearAnswers;
    // Button2.Caption:='Совершить действие';
    ButtonCalback:=MakeGOpath;
  end;
end;

procedure TForm6.ShowFail;
begin
  if trim(CustomCriticalMessage)='' then begin
    SDTcall(FixStringValueParameters(PlayGame.Pars[CurrentCriticalParameter].CriticalMessage.text,true),false);
  end else begin
    SDTcall(FixStringValueParameters(CustomCriticalMessage,true),false);
  end;
  ClearAnswers;
  AddAnswer(0,'Игра кончилась',true);
  ButtonCalback:=WeAreInTheLocation;
  GameState:=GameStateFail;
end;

procedure TForm6.ShowSuccess;
begin
  if trim(CustomCriticalMessage)='' then begin
    SDTcall(FixStringValueParameters(trim(PlayGame.Pars[CurrentCriticalParameter].CriticalMessage.text),true),false);
  end else begin
    SDTcall(FixStringValueParameters(CustomCriticalMessage,true),false);
  end;
  ClearAnswers;
  AddAnswer(0,'Квест успешно завершен'+GetDayPassedStr,true);
  ButtonCalback:=WeAreInTheLocation;
  GameState:=GameStateSuccess;
end;


procedure TForm6.WeAreInTheLocation(deep:integer);
label again,done;
var
  locationindex,i:integer;
  successflag,failflag:boolean;
  delta:TParameterDeltas;
  tpars:TParValues;
begin
  if 	StopWalkingPressed then exit;
  voidpathindex:=0;
  ProcessShowParameters;
  //Проверяем на критическую ситуацию после перехода
  successflag:=false;
  failflag:=IsGamePathParameterFail(lastpathindex,GamePars,UndoPar[UndoIndex]);
  if not failflag then begin
    successflag:=IsGamePathParameterSuccess(lastpathindex,GamePars,UndoPar[UndoIndex])
  end;
  if successflag then begin ShowSuccess; goto done; end;
  if failflag then begin ShowFail; goto done; end;
  //Изменяем параметры в локации
  locationindex:=PlayGame.GetLocationIndex(current_location_number);
  for i:=1 to maxparameters do begin
    delta[i]:=PlayGame.Locations[locationindex].Dpars[i];
    tpars[i]:=GamePars[i];
  end;
  if (not LastCommandIsUndo) or (UndoIndex=0) then begin
    ProcessParametersWithDelta(GamePars,delta);
  end;
  ProcessParVisualOpions(delta);
  //Печатаем текст локации,если все нормально
  if not (PlayGame.Locations[locationindex].VoidLocation) then begin
    PlayGame.Locations[locationindex].FindLocationDescription(LocationClass.TParValues(GamePars));
    SDTcall(FixStringValueParameters(trim(PlayGame.Locations[locationindex].LocationDescription.text),true),false);
  end;
  dayspassed:=PlayGame.Locations[locationindex].DaysCost+dayspassed;
  ProcessShowParameters;
  LastCommandIsUndo:=false;
  //Проверяем на критическую ситуацию в локации
  successflag:=false;
  failflag:=IsGameLocationParameterFail(locationindex,GamePars,tpars);
  if not failflag then begin
    successflag:=IsGameLocationParameterSuccess(locationindex,GamePars,tpars);
  end;
///
  ProcessShowParameters;
  if successflag then begin
    ShowSuccess;
    exit;
  end;
  if failflag then begin
    ShowFail;
    exit;
  end;
  ClearAnswers;
  CheckLocationType;  // Обработать особые локации
  if (GameState<>GameStateGoPath) then exit;
  voidpathindex:=ShowPathes(true);
  if voidpathindex>0 then begin
    inc(deep);
    if deep<MaxGoPathDeep then begin
      if deep mod 20 = 0 then begin
        inc(ProgressCount);
        ProgressLabel.Caption:=ProgressString+inttostr(ProgressCount);
        Application.ProcessMessages;
      end;
      if not StopWalkingPressed then MakeGoPath(deep);
    end else begin
    end;
  end else begin
    //Обрабатываем особый случай печати текста локации
    if (PlayGame.Locations[locationindex].VoidLocation)and
      (trim(PlayGame.Pathes[lastpathindex].EndPathMessage.Text)='') then begin
      PlayGame.Locations[locationindex].FindLocationDescription(LocationClass.TParValues(GamePars));
      SDTcall(FixStringValueParameters(trim(PlayGame.Locations[locationindex].LocationDescription.text),true),false);
    end;
    ShowPathes(false);
  end;
done:
end;


procedure Tform6.WeAreFailForPars;
begin
  if gamestate=gamestatesuccess then close;
  if gamestate=gamestateAFail then close;
  if gamestate=gamestateBFail then close;
  if gamestate=gamestateCFail then close;
  if gamestate=gamestateFail then close;

  ButtonCalback:=WeareIntheLocation;
///
end;


procedure Tform6.MakeGoPath(deep:integer);
label goout;
var
  pathindex,i:integer;
  delta:TParameterDeltas;
begin
  if  (accessible_pathes_count>0)or(voidpathindex>0) then begin
    //Выполнение перехода, если выбран переход
    pathindex:=0;
    if voidpathindex>0 then begin
      pathindex:=voidpathindex;
    end else begin
      if (CheckedAnswer>0)then pathindex:=accessible_pathes[CheckedAnswer];
    end;
    if pathindex=0 then begin
      //ShowMessage('Ошибка перехода');
      goto  goout;
    end;
    CurrPathX:=PlayGame.GetLocationIndex(current_location_number);
    CurrPathY:=pathindex;
    dec(PathesWeCanGo[CurrPathX][CurrPathY]);
    dayspassed:=PlayGame.Pathes[pathindex].dayscost+dayspassed;
    makedo;
    current_location_number:=PlayGame.Pathes[pathindex].ToLocation;
    for i:=1 to maxparameters do delta[i]:=PlayGame.Pathes[pathindex].DPars[i];
    ProcessParametersWithDelta(GamePars,delta);
    ProcessParVisualOpions(delta);
    if not PlayGame.PathIsVoid(pathindex) then begin
      ProcessShowParameters;
    end;
    lastpathindex:=pathindex;
    if (trim(PlayGame.Pathes[pathindex].EndPathMessage.Text)='') then begin
      GameState:=GAmeStateGOPath;
      ButtonCalback:=MakeGOpath;
      WeAreInTheLocation(deep);
    end else begin
      SDTcall(FixStringValueParameters(trim(PlayGame.Pathes[pathindex].EndPathMessage.text),true),false);
      GameState:=GAmeStateGOPath;
      ButtonCalback:=MakeGOpath;
      WeAreInTheLocation(deep);
    end;
  end;
  goout:
end;


procedure Tform6.MakeDo;
var
  i:integer;
begin
  if UndoIndex>=(UndoMax-2) then begin
    //SpeedButton1.Visible:=false;
    UndoIndex:=0;
  end else begin
    SpeedButton1.Visible:=true;
    inc(UndoIndex);
    for i:=1 to maxparameters do begin
      UndoPar[UndoIndex][i]:=GamePars[i];
      UndoParVis[UndoIndex][i]:=ParVisState[i];
    end;
    UndoPathY[UndoIndex]:=CurrPathY;
    UndoPathX[UndoIndex]:=CurrPathX;
    UndoLocation[UndoIndex]:=current_location_number;
    UndoDaysPassed[UndoIndex]:=dayspassed;

    if UndoIndex>0 then MakeUndoButton.Enabled:=true
    else MakeUndoButton.Enabled:=false;
  end;
end;


procedure Tform6.MakeUndo;
var
  i,c:integer;
begin
  for i:=1 to maxparameters do begin
    ParVisState[i]:=UndoParVis[UndoIndex][i];
    GamePars[i]:=UndoPar[UndoIndex][i];
  end;
  dayspassed:=UndoDaysPassed[UndoIndex];
  inc(PathesWeCanGo[UndoPathX[UndoIndex]][UndoPathY[UndoIndex]]);//:=true;
  current_location_number:=UndoLocation[UndoIndex];
  lastpathindex:=UndoPathY[UndoIndex];
  if UndoIndex>0 then dec(UndoIndex);

  if UndoIndex<=0 then begin
    MakeUndoButton.Enabled:=false;
    //Инициализируем матрицу переходов куда можно пойти
    for i:=1 to PlayGame.LocationsValue do
    for c:=1 to PlayGame.PathesValue do PathesWeCanGo[i][c]:=0;//false;
    for i:=1 to PlayGame.PathesValue do begin
      if PlayGame.Pathes[i].PassTimesValue=0 then begin
        PathesWeCanGo[PlayGame.GetLocationIndex(PlayGame.Pathes[i].FromLocation)][i]:=2000000000
      end else begin
        PathesWeCanGo[PlayGame.GetLocationIndex(PlayGame.Pathes[i].FromLocation)][i]:=PlayGame.Pathes[i].PassTimesValue;
      end;
    end;
    //
    for i:=1 to maxparameters do begin
      if PlayGame.Pars[i].AltDiapStartValues.count>0 then begin
        c:=trunc(PlayGame.Pars[i].AltDiapStartValues.GetRandom);
        GamePars[i]:=c;
      end else begin
        GamePars[i]:=PlayGame.Pars[i].value;
      end;
    end;
  end;

  if (ShowPathes(true)<>0)and(UndoIndex>0) then MakeUndo;
end;


procedure TForm6.CancelButtonClick(Sender: TObject);
begin
  Proceed_clicked:=true;
  StopWalkingPressed:=true;
  Close;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  PlayGame:=TGame.Create(GameContent.PM(m));
  //ActionListRadioGroup.ItemIndex:=-1;
  AnswerLabels[1]:=Label1;
  AnswerLabels[2]:=Label2;
  AnswerLabels[3]:=Label3;
  AnswerLabels[4]:=Label4;
  AnswerLabels[5]:=Label5;
  AnswerLabels[6]:=Label6;
  AnswerLabels[7]:=Label7;
  AnswerLabels[8]:=Label8;
  AnswerLabels[9]:=Label9;
  AnswerLabels[10]:=Label10;

  AnswerLabels[11]:=Label11;
  AnswerLabels[12]:=Label12;
  AnswerLabels[13]:=Label13;
  AnswerLabels[14]:=Label14;
  AnswerLabels[15]:=Label15;
  AnswerLabels[16]:=Label16;
  AnswerLabels[17]:=Label17;
  AnswerLabels[18]:=Label18;
  AnswerLabels[19]:=Label19;
  AnswerLabels[20]:=Label20;

  AnswerLabels[21]:=Label21;
  AnswerLabels[22]:=Label22;
  AnswerLabels[23]:=Label23;
  AnswerLabels[24]:=Label24;
  AnswerLabels[25]:=Label25;
  AnswerLabels[26]:=Label26;
  AnswerLabels[27]:=Label27;
  AnswerLabels[28]:=Label28;
  AnswerLabels[29]:=Label29;
  AnswerLabels[30]:=Label30;

  AnswerLabels[31]:=Label31;
  AnswerLabels[32]:=Label32;
end;


function TForm6.FixStringParameters(txt:wideString;SDT:boolean):Widestring;
var
  ttxt:WideString;
  cle,cls:widestring;
  sr:widestring;
begin
  if not SDT then begin
    cls:='';
    cle:='';
  end else begin
    cls:='<clr>';
    cle:='<clrEnd>';
  end;
  sr:=trim(PlayGame.RToStar.Text);
  tTxt:=StringReplaceEC(txt,'<ToStar>',cls+sr+cle);
  sr:=trim(PlayGame.RParsec.Text);
  tTxt:=StringReplaceEC(tTxt,'<Parsec>',cls+sr+cle);
  sr:=trim(PlayGame.RArtefact.Text);
  tTxt:=StringReplaceEC(tTxt,'<Artefact>',cls+sr+cle);
  sr:=trim(PlayGame.RToPlanet.Text);
  tTxt:=StringReplaceEC(tTxt,'<ToPlanet>',cls+sr+cle);
  sr:=trim(PlayGame.RDate.Text);
  tTxt:=StringReplaceEC(tTxt,'<Date>',cls+sr+cle);
  sr:=trim(PlayGame.RMoney.Text);
  tTxt:=StringReplaceEC(tTxt,'<Money>',cls+sr+cle);
  sr:=trim(PlayGame.RFromPLanet.Text);
  tTxt:=StringReplaceEC(tTxt,'<FromPlanet>',cls+sr+cle);
  sr:=trim(PlayGame.RFromStar.Text);
  tTxt:=StringReplaceEC(tTxt,'<FromStar>',cls+sr+cle);
  sr:=trim(PlayGame.RRanger.Text);
  tTxt:=StringReplaceEC(tTxt,'<Ranger>',cls+sr+cle);
  sr:=trim('1 января 3000 г.');
  tTxt:=StringReplaceEC(tTxt,'<CurDate>',cls+sr+cle);

  sr:=#13#10;
  tTxt:=StringReplaceEC(tTxt,'<br>',sr);

  FixStringParameters:=ttxt;
end;

function TForm6.FixStringValueParameters(txt:wideString;SDT:boolean):Widestring;
var
  i,c:integer;
  tstr,tstr1:widestring;
  parse:TCalcParse;
  cle,cls:widestring;
begin
  txt:=FixStringParameters(txt,SDT);
  if not SDT then begin
    cls:='';
    cle:='';
  end else begin
    cls:='<clr>';
    cle:='<clrEnd>';
  end;
  parse:=TCalcParse.Create;
  tstr:='';
  i:=1;
  c:=length(txt);
  while i<=c do begin
    if txt[i]<>'{' then begin
      tstr:=tstr+txt[i];
      inc(i);
    end else begin
      inc(i);
      tstr1:='';
      while (i<=c)and(txt[i]<>'}') do begin
        tstr1:=tstr1+txt[i];
        inc(i);
      end;
      if tstr1<>'' then begin
        parse.Clear;
        parse.AssignAndPreprocess(tstr1,1);
        if not (parse.error or parse.default_expression)then begin
          parse.Parse(CalcParseClass.TParValues(GamePars));
          if not parse.error then begin
            tstr:=tstr+cls+inttostr(parse.answer)+cle;
          end else begin
            tstr:=tstr+'{'+tstr1;
          end;
        end else begin
          tstr:=tstr+'{'+tstr1;
        end;
      end;
      inc(i);
    end;
  end;
  txt:=tstr;
  for i:=1 to maxparameters do begin
    txt:=StringReplaceEC(txt,'[p'+inttostr(i)+']',cls+inttostr(GamePars[i])+cle);
  end;
  FixStringValueParameters:=txt;
end;

procedure TForm6.StartGame;
label goout;
var
  i,c:integer;
  flag:boolean;
begin
  ProgressString:='Время пошло: ';
  ProgressCount:=0;
  StopWalkingPressed:=false;

  Panel1.Visible:=true;
  Panel1.Repaint;
  SpeedButton1.Visible:=true;

  LastCommandIsUndo:=false;
  oldcheckanswer:=0;
  lastpathindex:=0;
  dayspassed:=0;

  for i:=1 to maxparameters do begin
    ParVisState[i]:=true;
//     for c:=1 to PlayGame.Pars[i].ValueOfViewStrings do
//        PlayGame.Pars[i].ViewFormatStrings[c].str.text:=
//            FixStringParameters(PlayGame.Pars[i].ViewFormatStrings[c].str.text,false);

//     PlayGame.Pars[i].GameName.Text:=FixStringParameters(PlayGame.Pars[i].GameName.Text,false);
//     PlayGame.Pars[i].CriticalMessage.Text:=FixStringParameters(PlayGame.Pars[i].CriticalMessage.Text,true);
  end;
{
     for i:=1 to PlayGame.PathesValue do begin
      PlayGame.Pathes[i].StartPathMessage.Text:=FixStringParameters(PlayGame.Pathes[i].StartPathMessage.Text,false);
      PlayGame.Pathes[i].EndPathMessage.Text:=FixStringParameters(PlayGame.Pathes[i].EndPathMessage.Text,true);

      for c:=1 to maxparameters do begin
       PlayGame.Pathes[i].DPars[c].CriticalMessage.Text
        :=FixStringParameters(PlayGame.Pathes[i].DPars[c].CriticalMessage.Text,true);
      end;
     end;
}{
     for i:=1 to PlayGame.LocationsValue do begin

      PlayGame.Locations[i].locdescrorder:=1;
      PlayGame.Locations[i].LocationDescription.Text:=FixStringParameters(PlayGame.Locations[i].LocationDescription.Text,true);

      for c:=1 to MaxLocationDescriptions do begin

        PlayGame.Locations[i].LocationDescriptions[c].Text:=
         FixStringParameters(PlayGame.Locations[i].LocationDescriptions[c].Text,true);

      end;
 }
 {     for c:=1 to maxparameters do begin
       PlayGame.Locations[i].DPars[c].CriticalMessage.Text:=FixStringParameters(PlayGame.Locations[i].DPars[c].CriticalMessage.Text,true);
      end;

     end;
  }
     //Инициализируем матрицу переходов куда можно пойти
  for i:=1 to PlayGame.LocationsValue do
    for c:=1 to PlayGame.PathesValue do PathesWeCanGo[i][c]:=0;//false;

  for i:=1 to PlayGame.PathesValue do begin
    if PlayGame.Pathes[i].PassTimesValue=0 then begin
      PathesWeCanGo[PlayGame.GetLocationIndex(PlayGame.Pathes[i].FromLocation)][i]:=2000000000
    end else begin
      PathesWeCanGo[PlayGame.GetLocationIndex(PlayGame.Pathes[i].FromLocation)][i]:=PlayGame.Pathes[i].PassTimesValue;
    end;
  end;
    //

    //    Button2.Caption:='Совершить действие';

  MakeUndoButton.Enabled:=false;
  UndoIndex:=-1;
  UndoLocation[0]:=-100;
  UndoDaysPassed[0]:=0;

  for i:=1 to maxparameters do begin
    flag:=PlayGame.Pars[i].Enabled and not PlayGame.Pars[i].Hidden;
    ParVisState[i]:=flag;
  end;

  c:=0;
  current_location_number:=0;

// Ищем стартовую локацию
  for i:=1 to PlayGame.LocationsValue do
    if PlayGame.Locations[i].StartLocationFlag then begin
      current_location_number:=PlayGame.Locations[i].LocationNumber;

      inc(c);
    end;
// Если не нашли, то обработать ошибку
  if c>1 then current_location_number:=-1;

  if current_location_number=0 then begin
    ShowMessage('Не могу найти стартовую локацию');
    Close; showmessage('d');  goto goout;
  end else
// Если стартовых локаций больше одной, то обработать ошибку
  if current_location_number=-1 then begin
    ShowMessage('Слишком много начальных локаций');
    Close;   goto goout;
  end else  begin
    GameState:=GameStateStart;
    for i:=1 to maxparameters do begin
      if PlayGame.Pars[i].AltDiapStartValues.count>0 then begin
        c:=trunc(PlayGame.Pars[i].AltDiapStartValues.GetRandom);
        GamePars[i]:=c;
      end else begin
        GamePars[i]:=PlayGame.Pars[i].value;
      end;
    end;
    ProcessShowParameters;
    UndoPathY[0]:=0;
    ButtonCalback:=MakeGoPath;
    MakeDo;

    SDT.cr_count:=0;
    SDT.need_click:=false;
    SDT.text:='';
    SDTRichEdit.Text:='';
    ClearAnswers;
    ParLabel1.Caption:='';

    Panel1.Visible:=false;
    Panel1.Update;
    SpeedButton1.Visible:=true;
    SpeedButton1.Update;
    WeAreInTheLocation;

  end;
  goout:
	Panel1.Visible:=false;
	Panel1.Update;
end;

function Tform6.ShowPathes(testmode:boolean):integer;
var
  i,c:integer;
  found_answers:array [1..50] of TAnswer;
  maxprobfix_answers:array [1..50] of TAnswer;
  mixed_answers:array [1..50] of TAnswer;
  mixed_answers_flags: array [1..50] of boolean;
  found_answers_value,
  maxprobfix_answers_value,
  mixed_answers_value:integer;
  SameTextPathes:ATAnswer;
  STP_count:integer;
  found:integer;
  t_answer:TAnswer;
  PAnswer:TAnswer;
  maxprob:extended;
  answer:integer;
//        d:integer;
begin
  answer:=0;
  if current_location_number>0 then begin

    if not testmode then ClearAnswers;
    if not testmode then ProcessShowParameters;

    if (GameState=GamestateGoPath) or (GameState=GameStateStart) then begin

      SetLength(SameTextPathes,51);
      for i:=1 to 50 do begin
        accessible_pathes[i]:=-1;
        found_answers[i].i:=-1;
        mixed_answers[i].i:=-1;
      end;

      found_answers_value:=0;
      mixed_answers_value:=0;

      for i:= 1 to PlayGame.PathesValue do
        if (PlayGame.Pathes[i].FromLocation=current_location_number)
        and
        (
        (PathesWeCanGo[PlayGame.getlocationindex(current_location_number)][i]>=1) and
        (ArePathesStillFromHere(PlayGame.getlocationindex(PlayGame.Pathes[i].ToLocation)))
        )
        then
        begin
          if IsParametersGatesOk(GamePars,i) then begin
            inc(found_answers_value);
            found_answers[found_answers_value].i:=i;
            found_answers[found_answers_value].so:=PlayGame.Pathes[i].ShowOrder;
            found_answers[found_answers_value].GatesOk:=true;
            found_answers[found_answers_value].text:=FixStringValueParameters(trim(PlayGame.Pathes[i].StartPathMessage.text),false);
          end else begin
            if PlayGame.Pathes[i].AlwaysShowWhenPlaying then  begin
              inc(found_answers_value);
              found_answers[found_answers_value].i:=i;
              found_answers[found_answers_value].so:=PlayGame.Pathes[i].ShowOrder;
              found_answers[found_answers_value].GatesOk:=false;
              found_answers[found_answers_value].text:=FixStringValueParameters(trim(PlayGame.Pathes[i].StartPathMessage.text),false);
            end;
          end;
        end;
{
    for i:=1 to found_answers_value do begin
		d:=random(found_answers_value)+1;
		t_answer:=found_answers[d];
		found_answers[d]:=found_answers[i];
		found_answers[i]:=t_answer;
    end;
}
   	  for i:=1 to 50 do mixed_answers_flags[i]:=true;

      for i:=1 to found_answers_value do begin
        STP_Count:=0;
        maxprobfix_answers_value:=0;
        found:=0;
        maxprob:=0;
        PAnswer.i:=-1;
        if mixed_answers_flags[i] then found:=i;

        if found<>0 then begin
          for c:=1 to found_answers_value do begin
            if trim(found_answers[found].text)=trim(found_answers[c].text) then begin
              mixed_answers_flags[c]:=false;
              inc(maxprobfix_answers_value);
              maxprobfix_answers[maxprobfix_answers_value]:=found_answers[c];
              if maxprob<PlayGame.Pathes[found_answers[c].i].Probability then
                maxprob:=PlayGame.Pathes[found_answers[c].i].Probability;
            end;
          end;
        end;
        for c:=1 to maxprobfix_answers_value do begin
          if maxprob<=100*PlayGame.Pathes[maxprobfix_answers[c].i].Probability then begin
            inc(STP_Count);
            SameTextPathes[STP_Count]:=maxprobfix_answers[c];
          end;
        end;

        PAnswer:=GetPathByProbability(SameTextPathes,STP_Count);
        PAnswer.text:=StringReplace(PAnswer.text,'<clr>','');
        PAnswer.text:=StringReplace(PAnswer.text,'<clrEnd>','');
        if PAnswer.i<>-1 then begin
          inc(mixed_answers_value);
          mixed_answers[mixed_answers_value]:=PAnswer;
        end;

      end;

    //Перемешиваем переходы по свойству ShowOrder
      if not testmode then begin
        for c:=1 to mixed_answers_value  do begin
          for i:=1 to mixed_answers_value-1 do begin
            if mixed_answers[i].so>mixed_answers[i+1].so then begin
              t_answer:=mixed_answers[i+1];
              mixed_answers[i+1]:=mixed_answers[i];
              mixed_answers[i]:=t_answer;
            end;
          end;
        end;
      end;

      if (mixed_answers_value=1)and(PlayGame.PathIsVoid(mixed_answers[1].i)) then begin
        answer:=mixed_answers[1].i;
      end else begin
        for i:=1 to mixed_answers_value do begin
          if (trim(PlayGame.Pathes[mixed_answers[i].i].StartPathMessage.Text)<>'') then begin
            if not testmode then AddAnswer(mixed_answers[i].i,mixed_answers[i].text,mixed_answers[i].GatesOk);
          end;
        end;
      end;
      if accessible_pathes_count>0 then CheckedAnswer:=1 else CheckedAnswer:=-1;
      ProcessCheckAnswer;
    end;

  end else Close; // if current_location_number>0
  ShowPathes:=answer;
end;

procedure TForm6.ProcessShowParameters;
var
  i:integer;
  temp,temp1:widestring;
  flag:boolean;
begin
  temp1:='';
  for i:=1 to maxparameters do begin
    flag:=ParVisState[i];
    if (not PlayGame.Pars[i].Enabled)
    or
    (PlayGame.Pars[i].Hidden) then flag:=false;

    if (GamePars[i]=0)
    and
    (not PlayGame.Pars[i].ShowIfZero) then flag:=false;

    if flag then begin
      temp:=PlayGame.Pars[i].GetVFStringByValue(GamePars[i]);
      temp:=StringReplaceEC(temp,'<>',inttostr(GamePars[i]));
      temp1:=temp1+temp+#13#10;
    end;
  end;
  ParLabel1.Caption:=FixStringValueParameters(temp1,false);
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  ProcessAction;
end;

procedure TForm6.ProcessAction;
label done;
begin
  if gamestate=gamestatesuccess then begin
    close;
    goto done;
  end;
  if gamestate=gamestateFail then begin close; goto done; end;
  if gamestate=gamestateStart then gamestate:=gamestateGoPath;
  SDT.need_click:=false;
  ButtonCalback;
  done:
end;

procedure TForm6.MakeUndoButtonClick(Sender: TObject);
var li:integer;
begin
	StopWalkingPressed:=true;
//	if not StopWalkingPressed then exit;
	MakeUndo;
	GameState:=GameStateOk;
	LastCommandIsUndo:=true;
  SDT.need_click:=false;
	WeAreInTheLocation;
	ProcessShowParameters;
	ShowPathes(false);

  li:=PlayGame.GetLocationIndex(current_location_number);
  with PlayGame.Locations[li] do begin
    if VoidLocation then begin
      FindLocationDescription(LocationClass.TParValues(GamePars));
      if (trim(LocationDescription.Text)='') then begin
        SDT.Text:=' Пустая локация ';
        SDTRichEdit.Text:=' Пустая локация ';
      end;
    end;
  end;
end;

procedure TForm6.LabelClick(Sender: TObject);
begin
	CheckedAnswer:=(Sender as TLabel).Tag;
	ProcessCheckAnswer;
	ProcessAction;
end;
procedure TForm6.LabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  CheckedAnswer:=(Sender as TLabel).Tag;
  ProcessCheckAnswer;
end;

{procedure TForm6.Label1Click(Sender: TObject);
begin
	CheckedAnswer:=1;
	ProcessCheckAnswer;
	ProcessAction;
end;

procedure TForm6.Label2Click(Sender: TObject);
begin
	CheckedAnswer:=2;
	ProcessCheckAnswer;
	ProcessAction;
end;

procedure TForm6.Label3Click(Sender: TObject);
begin
	CheckedAnswer:=3;
	ProcessCheckAnswer;
	ProcessAction;
end;

procedure TForm6.Label4Click(Sender: TObject);
begin
	CheckedAnswer:=4;
	ProcessCheckAnswer;
	ProcessAction;
end;

procedure TForm6.Label5Click(Sender: TObject);
begin
	CheckedAnswer:=5;
	ProcessCheckAnswer;
	ProcessAction;
end;

procedure TForm6.Label6Click(Sender: TObject);
begin
	CheckedAnswer:=6;
	ProcessCheckAnswer;
	ProcessAction;
end;

procedure TForm6.Label7Click(Sender: TObject);
begin
	CheckedAnswer:=7;
	ProcessCheckAnswer;
	ProcessAction;
end;

procedure TForm6.Label8Click(Sender: TObject);
begin
	CheckedAnswer:=8;
	ProcessCheckAnswer;
	ProcessAction;
end;}

{procedure TForm6.Label1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  CheckedAnswer:=1;
  ProcessCheckAnswer;
end;

procedure TForm6.Label2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  CheckedAnswer:=2;
  ProcessCheckAnswer;
end;

procedure TForm6.Label3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  CheckedAnswer:=3;
  ProcessCheckAnswer;
end;

procedure TForm6.Label4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  CheckedAnswer:=4;
  ProcessCheckAnswer;
end;

procedure TForm6.Label5MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  CheckedAnswer:=5;
  ProcessCheckAnswer;
end;

procedure TForm6.Label6MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  CheckedAnswer:=6;
  ProcessCheckAnswer;
end;

procedure TForm6.Label7MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  CheckedAnswer:=7;
  ProcessCheckAnswer;
end;

procedure TForm6.Label8MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  CheckedAnswer:=8;;
  ProcessCheckAnswer;
  //(Sender as TLabel).Tag
end;}

procedure TForm6.StartGameTimerTimer(Sender: TObject);
begin
  StartGameTimer.Enabled:=false;
  StartGame;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  SDTRichEdit.Text:='';
  ClearAnswers;
  ParLabel1.Caption:='';
  ProgressLabel.Caption:='';
  StartGameTimer.Enabled:=true;
end;

procedure TForm6.FormResize(Sender: TObject);
var
  w, h: integer;
begin
  w:=Form6.Width;
  h:=Form6.Height;
  if (w < 1021) then w:=1021;
  if (h < 749) then h:=749;

  ParLabel1.Left:=w - 268;
  ParLabel1.Height:=h - 361;

  SpeedButton1.Top:=h - 68;

  SpeedButton2.Left:=w - 117;
  SpeedButton2.Top:=h - 68;

  MakeUndoButton.Top:=h - 68;

  CancelButton.Top:=h - 68;

  ProgressLabel.Top:=h - 62;

  AnswersGroupBox.Width:=w - 25;
  AnswersGroupBox.Top:=h - 341;

  //Shape4.Width:=w - 25;

  SDTRichEdit.Width:=w - 281;
  SDTRichEdit.Height:=h - 361;

  Form6.Width:=w;
  Form6.Height:=h;
end;

end.



