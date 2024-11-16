unit ParameterClass;

interface


uses SysUtils,
     TextFieldClass,
     ParViewStringClass,
     ValueListClass,
     CPDiapClass;

const
  FailParType=1;
  SuccessParType=2;
  DeathParType=3;
  NoCriticalParType=0;

  maxparameters=96;
  maxformatviewstrings=10;

type PText=^file;

type TParameter=class
  public
    min:integer;
    max:integer;
    value:integer;
    Name:TTextField;
    GameName:TTextField;
    CriticalMessage:TTextField;
    ParType:integer;
    Hidden:boolean;  //Не активно сечас
    ShowIfZero:boolean;
    LoLimit:boolean;
    Enabled:boolean;
    Money:boolean;

    ViewFormatStrings: array [1..10] of TParWiewString;
    ValueOfViewStrings:integer;

    AltStartValues:TValuesList;
    AltDiapStartValues:TCPDiapazone;

    constructor Create(parameternumber:integer);
    function GetDefaultMinGate:integer;
    function GetDefaultMaxGate:integer;

    function GetVFStringByValue(value:integer):WideString;

    procedure Clear(parameternumber:integer);

    procedure CopyDataFrom(var source:TParameter);

    procedure Save(fileout:ptext);
    procedure Load(filein:ptext);
    procedure Save_3_9_0(fileout:ptext);
    procedure Load_3_9_0(filein:ptext);
    procedure Save_3_9_5(fileout:ptext);
    procedure Load_3_9_5(filein:ptext);
    procedure Save_3_9_6(fileout:ptext);
    procedure Load_3_9_6(filein:ptext);
    procedure Save_4_0_1(fileout:ptext);
    procedure Load_4_0_1(filein:ptext);
end;

implementation

function TParameter.GetVFStringByValue(value:integer):WideString;
var
  i:integer;
  answer:WideString;
begin
  answer:='Can not GetVFString - Out of range';

  for i:=1 to ValueOfViewStrings do begin
    if (value>=ViewFormatStrings[i].min) and (value<=ViewFormatStrings[i].max) then
      answer:=trim(ViewFormatStrings[i].str.Text);
  end;

  GetVFStringByValue:=answer;
end;

function TParameter.GetDefaultMinGate:integer;
var
  answer:integer;
begin
  answer:=Min;

  if(ParType<>NoCriticalParType) and (ParType<>SuccessParType) and LoLimit then answer:=answer+1;

  GetDefaultMinGate:=answer;
end;

function TParameter.GetDefaultMaxGate:integer;
var
  answer:integer;
begin
  answer:=Max;

  if (ParType<>NoCriticalParType) and (ParType<>SuccessParType) and not LoLimit then answer:=answer-1;

  GetDefaultMaxGate:=answer;
end;



procedure TParameter.Load_4_0_1(filein:ptext);
var
  i:integer;
begin
  Money:=false;
  BlockRead(filein^,min,sizeof(min));
  BlockRead(filein^,max,sizeof(max));
  BlockRead(filein^,value,sizeof(value));
  BlockRead(filein^,ParType,sizeof(ParType));
  BlockRead(filein^,Hidden,sizeof(Hidden));
  BlockRead(filein^,ShowIfZero,sizeof(ShowIfZero));
  BlockRead(filein^,LoLimit,sizeof(LoLimit));
  BlockRead(filein^,Enabled,sizeof(Enabled));
  BlockRead(filein^,ValueOfViewStrings,sizeof(ValueOfViewStrings));
  BlockRead(filein^,Money,sizeof(Money));

  Name.Load(TextFieldClass.PText(filein));

  for i:=1 to ValueOfViewStrings do
    ViewFormatStrings[i].Load(ParViewStringClass.ptext(filein));

  CriticalMessage.Load(TextFieldClass.PText(filein));
  AltDiapStartValues.Load(CPDiapClass.PText(filein));
end;

procedure TParameter.Save_4_0_1(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,min,sizeof(min));
  BlockWrite(fileout^,max,sizeof(max));
  BlockWrite(fileout^,value,sizeof(value));
  BlockWrite(fileout^,ParType,sizeof(ParType));
  BlockWrite(fileout^,Hidden,sizeof(Hidden));
  BlockWrite(fileout^,ShowIfZero,sizeof(ShowIfZero));
  BlockWrite(fileout^,LoLimit,sizeof(LoLimit));
  BlockWrite(fileout^,Enabled,sizeof(Enabled));
  BlockWrite(fileout^,ValueOfViewStrings,sizeof(ValueOfViewStrings));
  BlockWrite(fileout^,Money,sizeof(Money));

  Name.Save(TextFieldClass.PText(fileout));

  for i:=1 to ValueOfViewStrings do
    ViewFormatStrings[i].Save(ParViewStringClass.ptext(fileout));

  CriticalMessage.Save(TextFieldClass.PText(fileout));
  AltDiapStartValues.Save(CPDiapClass.PText(fileout));
end;

procedure TParameter.Load_3_9_6(filein:ptext);
var
  i:integer;
begin
  Money:=false;
  BlockRead(filein^,min,sizeof(min));
  BlockRead(filein^,max,sizeof(max));
  BlockRead(filein^,value,sizeof(value));
  BlockRead(filein^,ParType,sizeof(ParType));
  BlockRead(filein^,Hidden,sizeof(Hidden));
  BlockRead(filein^,ShowIfZero,sizeof(ShowIfZero));
  BlockRead(filein^,LoLimit,sizeof(LoLimit));
  BlockRead(filein^,Enabled,sizeof(Enabled));
  BlockRead(filein^,ValueOfViewStrings,sizeof(ValueOfViewStrings));
  BlockRead(filein^,Money,sizeof(Money));

  Name.Load(TextFieldClass.PText(filein));

  for i:=1 to ValueOfViewStrings do
    ViewFormatStrings[i].Load(ParViewStringClass.ptext(filein));

  CriticalMessage.Load(TextFieldClass.PText(filein));
  AltStartValues.Load(ValueListClass.PText(filein));
  AltDiapStartValues.CopyDataFrom(AltStartValues);
  AltStartValues.Clear;
end;

procedure TParameter.Save_3_9_6(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,min,sizeof(min));
  BlockWrite(fileout^,max,sizeof(max));
  BlockWrite(fileout^,value,sizeof(value));
  BlockWrite(fileout^,ParType,sizeof(ParType));
  BlockWrite(fileout^,Hidden,sizeof(Hidden));
  BlockWrite(fileout^,ShowIfZero,sizeof(ShowIfZero));
  BlockWrite(fileout^,LoLimit,sizeof(LoLimit));
  BlockWrite(fileout^,Enabled,sizeof(Enabled));
  BlockWrite(fileout^,ValueOfViewStrings,sizeof(ValueOfViewStrings));
  BlockWrite(fileout^,Money,sizeof(Money));

  Name.Save(TextFieldClass.PText(fileout));

  for i:=1 to ValueOfViewStrings do
    ViewFormatStrings[i].Save(ParViewStringClass.ptext(fileout));

  CriticalMessage.Save(TextFieldClass.PText(fileout));
  AltStartValues.Save(ValueListClass.PText(fileout));
end;

procedure TParameter.Load_3_9_5(filein:ptext);
var
  i:integer;
begin
  Money:=false;
  BlockRead(filein^,min,sizeof(min));
  BlockRead(filein^,max,sizeof(max));
  BlockRead(filein^,value,sizeof(value));
  BlockRead(filein^,ParType,sizeof(ParType));
  BlockRead(filein^,Hidden,sizeof(Hidden));
  BlockRead(filein^,ShowIfZero,sizeof(ShowIfZero));
  BlockRead(filein^,LoLimit,sizeof(LoLimit));
  BlockRead(filein^,Enabled,sizeof(Enabled));
  BlockRead(filein^,ValueOfViewStrings,sizeof(ValueOfViewStrings));
  BlockRead(filein^,Money,sizeof(Money));

  Name.Load(TextFieldClass.PText(filein));

  for i:=1 to ValueOfViewStrings do
    ViewFormatStrings[i].Load(ParViewStringClass.ptext(filein));

  CriticalMessage.Load(TextFieldClass.PText(filein));
  AltDiapStartValues.Clear;
  AltDiapStartValues.Add(value,value);
end;

procedure TParameter.Save_3_9_5(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,min,sizeof(min));
  BlockWrite(fileout^,max,sizeof(max));
  BlockWrite(fileout^,value,sizeof(value));
  BlockWrite(fileout^,ParType,sizeof(ParType));
  BlockWrite(fileout^,Hidden,sizeof(Hidden));
  BlockWrite(fileout^,ShowIfZero,sizeof(ShowIfZero));
  BlockWrite(fileout^,LoLimit,sizeof(LoLimit));
  BlockWrite(fileout^,Enabled,sizeof(Enabled));
  BlockWrite(fileout^,ValueOfViewStrings,sizeof(ValueOfViewStrings));
  BlockWrite(fileout^,Money,sizeof(Money));

  Name.Save(TextFieldClass.PText(fileout));

  for i:=1 to ValueOfViewStrings do
    ViewFormatStrings[i].Save(ParViewStringClass.ptext(fileout));

  CriticalMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TParameter.Save_3_9_0(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,min,sizeof(min));
  BlockWrite(fileout^,max,sizeof(max));
  BlockWrite(fileout^,value,sizeof(value));
  BlockWrite(fileout^,ParType,sizeof(ParType));
  BlockWrite(fileout^,Hidden,sizeof(Hidden));
  BlockWrite(fileout^,ShowIfZero,sizeof(ShowIfZero));
  BlockWrite(fileout^,LoLimit,sizeof(LoLimit));
  BlockWrite(fileout^,Enabled,sizeof(Enabled));
  BlockWrite(fileout^,ValueOfViewStrings,sizeof(ValueOfViewStrings));

  Name.Save(TextFieldClass.PText(fileout));

  for i:=1 to ValueOfViewStrings do
    ViewFormatStrings[i].Save(ParViewStringClass.ptext(fileout));

  CriticalMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TParameter.Load_3_9_0(filein:ptext);
var
  i:integer;
begin
  Money:=false;
  BlockRead(filein^,min,sizeof(min));
  BlockRead(filein^,max,sizeof(max));
  BlockRead(filein^,value,sizeof(value));
  BlockRead(filein^,ParType,sizeof(ParType));
  BlockRead(filein^,Hidden,sizeof(Hidden));
  BlockRead(filein^,ShowIfZero,sizeof(ShowIfZero));
  BlockRead(filein^,LoLimit,sizeof(LoLimit));
  BlockRead(filein^,Enabled,sizeof(Enabled));
  BlockRead(filein^,ValueOfViewStrings,sizeof(ValueOfViewStrings));

  Name.Load(TextFieldClass.PText(filein));

  for i:=1 to ValueOfViewStrings do
    ViewFormatStrings[i].Load(ParViewStringClass.ptext(filein));

  CriticalMessage.Load(TextFieldClass.PText(filein));
  AltDiapStartValues.Clear;
  AltDiapStartValues.Add(value,value);
end;

procedure TParameter.Save(fileout:ptext);
begin
  BlockWrite(fileout^,min,sizeof(min));
  BlockWrite(fileout^,max,sizeof(max));
  BlockWrite(fileout^,value,sizeof(value));
  BlockWrite(fileout^,ParType,sizeof(ParType));
  BlockWrite(fileout^,Hidden,sizeof(Hidden));
  BlockWrite(fileout^,ShowIfZero,sizeof(ShowIfZero));
  BlockWrite(fileout^,LoLimit,sizeof(LoLimit));
  BlockWrite(fileout^,Enabled,sizeof(Enabled));

  Name.Save(TextFieldClass.PText(fileout));
  GameName.Save(TextFieldClass.PText(fileout));
  CriticalMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TParameter.Load(filein:ptext);
begin
  Money:=false;
  BlockRead(filein^,min,sizeof(min));
  BlockRead(filein^,max,sizeof(max));
  BlockRead(filein^,value,sizeof(value));
  BlockRead(filein^,ParType,sizeof(ParType));
  BlockRead(filein^,Hidden,sizeof(Hidden));
  BlockRead(filein^,ShowIfZero,sizeof(ShowIfZero));
  BlockRead(filein^,LoLimit,sizeof(LoLimit));
  BlockRead(filein^,Enabled,sizeof(Enabled));

  Name.Load(TextFieldClass.PText(filein));
  GameName.Load(TextFieldClass.PText(filein));
  CriticalMessage.Load(TextFieldClass.PText(filein));

  ValueOfViewStrings:=1;
  ViewFormatStrings[1].max:=max;
  ViewFormatStrings[1].min:=min;
  ViewFormatStrings[1].str.text:=trim(GameName.text);
        
  AltDiapStartValues.Clear;
  AltDiapStartValues.Add(value,value);
end;

constructor TParameter.Create(parameternumber:integer);
var
  i:integer;
begin
  for i:=1 to maxformatviewstrings do
    ViewFormatStrings[i]:=TParWiewString.Create('Имя присвоенное при создании '+ inttostr(parameternumber));


  Name:=TTextField.Create;
  GameName:=TTextField.Create;
  CriticalMessage:=TTextField.Create;
  AltStartValues:=TValuesList.Create;
  AltDiapStartValues:=TCPDiapazone.Create;
  Clear(parameternumber);
  // Name.Text:=trim(Name.text) + inttostr(parameternumber);
  // CriticalMessage.Text:= trim(CriticalMessage.Text) + inttostr(parameternumber);
end;

procedure TParameter.Clear(parameternumber:integer);
var
  i:integer;
begin
  Money:=false;
  Enabled:=false;
  Hidden:=false;
  ShowIfZero:=true;
  LoLimit:=true;
  Min:=0;
  Max:=1;

  AltStartValues.Clear;
  AltDiapStartValues.Clear;
  ValueOfViewStrings:=1;
  for i:=1 to maxformatviewstrings do
  ViewFormatStrings[i].str.text:='Параметр номер '+inttostr(parameternumber)+': <>';

  ViewFormatStrings[1].min:=Min;
  ViewFormatStrings[1].max:=Max;

  Value:=0;
  ParType:=NoCriticalParType;
  Name.Text:='Параметр номер '+inttostr(parameternumber);
  GameName.Text:='Параметр номер '+inttostr(parameternumber)+': <>';//!
  CriticalMessage.Text:='Сообщение достижения критического значения параметром '
                        +inttostr(parameternumber);
end;

procedure TParameter.CopyDataFrom(var source:TParameter);
var
  i:integer;
begin
  ValueOfViewStrings:=source.ValueOfViewStrings;

  for i:=1 to ValueOfViewStrings do
    ViewFormatStrings[i].CopyDataFrom(source.ViewFormatStrings[i]);

  Money:=source.Money; 
  Enabled:=source.Enabled;
  Hidden:=source.Hidden;
  ShowIfZero:=Source.ShowIfZero;
  LoLimit:=source.LoLimit;
  Min:=source.Min;
  Max:=source.Max;
  Value:=source.Value;
  ParType:=source.ParType;
  Name.Text:=trim(source.Name.text);
  GameName.Text:=source.GameName.text;
  CriticalMessage.text:=source.CriticalMessage.text;
  AltStartValues.CopyDataFrom(source.AltStartValues);
  AltDiapStartValues.CopyDataFrom(source.AltDiapStartValues);
end;
end.
