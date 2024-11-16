unit ParameterDeltaClass;

interface

uses SysUtils,
     ValueListClass,
     TextFieldClass;

const
  StayAsIs=0;
  HideParameter=2;
  ShowParameter=1;

  maxparameters=96;

type PText=^file;

type TParameterDelta=class
  public
  ValuesGate:TValuesList;
  ModZeroesGate:TValuesList;

  bitmask:integer;
  min:integer;
  max:integer;
  delta:integer;
  DeltaPercentFlag:boolean;
  DeltaApprFlag:boolean;
  DeltaExprFlag:boolean;
  Expression:TTextField;
  CriticalMessage:TTextField;
  ParameterViewAction:integer;
  CriticalMessageVisible:boolean;

  constructor Create(parameternumber:integer);
  procedure Clear;

  procedure CopyDataFrom(var source:TParameterDelta);
  function IsEqualWith(var source:TParameterDelta):boolean;

  procedure Save(fileout:ptext);
  procedure Load(filein:ptext);

  procedure Save_v3_9_3(fileout:ptext);
  procedure Load_v3_9_3(filein:ptext);

  procedure Save_v3_9_4(fileout:ptext);
  procedure Load_v3_9_4(filein:ptext);

  procedure Save_v3_9_6(fileout:ptext);
  procedure Load_v3_9_6(filein:ptext);
end;

implementation

procedure TParameterDelta.Save(fileout:ptext);
begin
  BlockWrite(fileout^,min,sizeof(min));
  BlockWrite(fileout^,max,sizeof(max));
  BlockWrite(fileout^,delta,sizeof(delta));
  BlockWrite(fileout^,ParameterViewAction,sizeof(ParameterViewAction));
  BlockWrite(fileout^,CriticalMessageVisible,sizeof(CriticalMessageVisible));
  BlockWrite(fileout^,DeltaPercentFlag,sizeof(DeltaPercentFlag));

  CriticalMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TParameterDelta.Load(filein:ptext);
begin
  Clear;
  BlockRead(filein^,min,sizeof(min));
  BlockRead(filein^,max,sizeof(max));
  BlockRead(filein^,delta,sizeof(delta));
  BlockRead(filein^,ParameterViewAction,sizeof(ParameterViewAction));
  BlockRead(filein^,CriticalMessageVisible,sizeof(CriticalMessageVisible));
  BlockRead(filein^,DeltaPercentFlag,sizeof(DeltaPercentFlag));

  CriticalMessage.Load(TextFieldClass.PText(filein));
end;



procedure TParameterDelta.Save_v3_9_3(fileout:ptext);
begin
  BlockWrite(fileout^,bitmask,sizeof(bitmask));
  BlockWrite(fileout^,min,sizeof(min));
  BlockWrite(fileout^,max,sizeof(max));
  BlockWrite(fileout^,delta,sizeof(delta));
  BlockWrite(fileout^,ParameterViewAction,sizeof(ParameterViewAction));
  BlockWrite(fileout^,CriticalMessageVisible,sizeof(CriticalMessageVisible));
  BlockWrite(fileout^,DeltaPercentFlag,sizeof(DeltaPercentFlag));

  ValuesGate.Save(ValueListClass.PText(fileout));
  ModZeroesGate.Save(ValueListClass.PText(fileout));

  CriticalMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TParameterDelta.Load_v3_9_3(filein:ptext);
begin
  Clear;
  BlockRead(filein^,bitmask,sizeof(bitmask));
  BlockRead(filein^,min,sizeof(min));
  BlockRead(filein^,max,sizeof(max));
  BlockRead(filein^,delta,sizeof(delta));
  BlockRead(filein^,ParameterViewAction,sizeof(ParameterViewAction));
  BlockRead(filein^,CriticalMessageVisible,sizeof(CriticalMessageVisible));
  BlockRead(filein^,DeltaPercentFlag,sizeof(DeltaPercentFlag));

  ValuesGate.Load(ValueListClass.PText(filein));
  ModZeroesGate.Load(ValueListClass.PText(filein));

  CriticalMessage.Load(TextFieldClass.PText(filein));
end;

procedure TParameterDelta.Save_v3_9_4(fileout:ptext);
begin
  BlockWrite(fileout^,bitmask,sizeof(bitmask));
  BlockWrite(fileout^,min,sizeof(min));
  BlockWrite(fileout^,max,sizeof(max));
  BlockWrite(fileout^,delta,sizeof(delta));
  BlockWrite(fileout^,ParameterViewAction,sizeof(ParameterViewAction));
  BlockWrite(fileout^,CriticalMessageVisible,sizeof(CriticalMessageVisible));
  BlockWrite(fileout^,DeltaPercentFlag,sizeof(DeltaPercentFlag));
  BlockWrite(fileout^,DeltaApprFlag,sizeof(DeltaApprFlag));

  ValuesGate.Save(ValueListClass.PText(fileout));
  ModZeroesGate.Save(ValueListClass.PText(fileout));

  CriticalMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TParameterDelta.Load_v3_9_4(filein:ptext);
begin
  Clear;
  BlockRead(filein^,bitmask,sizeof(bitmask));
  BlockRead(filein^,min,sizeof(min));
  BlockRead(filein^,max,sizeof(max));
  BlockRead(filein^,delta,sizeof(delta));
  BlockRead(filein^,ParameterViewAction,sizeof(ParameterViewAction));
  BlockRead(filein^,CriticalMessageVisible,sizeof(CriticalMessageVisible));
  BlockRead(filein^,DeltaPercentFlag,sizeof(DeltaPercentFlag));
  BlockRead(filein^,DeltaApprFlag,sizeof(DeltaApprFlag));

  ValuesGate.Load(ValueListClass.PText(filein));
  ModZeroesGate.Load(ValueListClass.PText(filein));

  CriticalMessage.Load(TextFieldClass.PText(filein));
end;

procedure TParameterDelta.Save_v3_9_6(fileout:ptext);
begin
  BlockWrite(fileout^,bitmask,sizeof(bitmask));
  BlockWrite(fileout^,min,sizeof(min));
  BlockWrite(fileout^,max,sizeof(max));
  BlockWrite(fileout^,delta,sizeof(delta));
  BlockWrite(fileout^,ParameterViewAction,sizeof(ParameterViewAction));
  BlockWrite(fileout^,CriticalMessageVisible,sizeof(CriticalMessageVisible));
  BlockWrite(fileout^,DeltaPercentFlag,sizeof(DeltaPercentFlag));
  BlockWrite(fileout^,DeltaApprFlag,sizeof(DeltaApprFlag));
  BlockWrite(fileout^,DeltaExprFlag,sizeof(DeltaApprFlag));

  Expression.Save(TextFieldClass.PText(fileout));
  ValuesGate.Save(ValueListClass.PText(fileout));
  ModZeroesGate.Save(ValueListClass.PText(fileout));

  CriticalMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TParameterDelta.Load_v3_9_6(filein:ptext);
begin
  Clear;
  BlockRead(filein^,bitmask,sizeof(bitmask));
  BlockRead(filein^,min,sizeof(min));
  BlockRead(filein^,max,sizeof(max));
  BlockRead(filein^,delta,sizeof(delta));
  BlockRead(filein^,ParameterViewAction,sizeof(ParameterViewAction));
  BlockRead(filein^,CriticalMessageVisible,sizeof(CriticalMessageVisible));
  BlockRead(filein^,DeltaPercentFlag,sizeof(DeltaPercentFlag));
  BlockRead(filein^,DeltaApprFlag,sizeof(DeltaApprFlag));
  BlockRead(filein^,DeltaExprFlag,sizeof(DeltaApprFlag));

  Expression.Load(TextFieldClass.PText(filein));
  ValuesGate.Load(ValueListClass.PText(filein));
  ModZeroesGate.Load(ValueListClass.PText(filein));

  CriticalMessage.Load(TextFieldClass.PText(filein));
end;



constructor TParameterDelta.Create(parameternumber:integer);
begin
  CriticalMessage:=TTextField.Create;
  ValuesGate:=TValuesList.Create;
  ModZeroesGate:=TValuesList.Create;
  Expression:=TTextField.Create;
  Clear;
end;

procedure TParameterDelta.Clear;
begin
   bitmask:=0;
   Min:=0;
   Max:=1;
   delta:=0;
   ParameterViewAction:=StayAsIs;
   CriticalMessage.Text:=''; //;'Сообщение достижения критического значения параметром ';
   CriticalMessageVisible:=false;
   DeltaPercentFlag:=false;
   DeltaApprFlag:=false;
   DeltaExprFlag:=false;
   ValuesGate.Clear;
   ModZeroesGate.Clear;
   Expression.Text:='';
end;

function TParameterDelta.IsEqualWith(var source:TParameterDelta):boolean;
label yes,no;
var
  answer:boolean;
begin
  answer:=false;

  if(not ValuesGate.IsEqualWith(source.ValuesGate)) or
    (not ModZeroesGate.IsEqualWith(source.ModZeroesGate))
  then goto no;

  if bitmask<>source.bitmask then goto no;
  if Min<>source.Min then  goto no;
  if Max<>source.Max then  goto no;
  if Delta<>source.Delta then  goto no;
  if ParameterViewAction<>source.ParameterViewAction then  goto no;
  if trim(CriticalMessage.Text)<>trim(source.CriticalMessage.text) then  goto no;
  if CriticalMessageVisible<>source.CriticalMessageVisible then  goto no;
  if DeltaPercentFlag<>source.DeltaPercentFlag then  goto no;
  if DeltaApprFlag<>source.DeltaApprFlag then  goto no;
  if DeltaExprFlag<>source.DeltaExprFlag then goto no;
  if trim(Expression.Text)<>trim(source.Expression.Text) then goto no;

  yes:
  answer:=true;

  no:
  IsEqualWith:=answer;
end;

procedure TParameterDelta.CopyDataFrom(var source:TParameterDelta);
begin
  bitmask:=source.bitmask;
  Min:=source.Min;
  Max:=source.Max;
  Delta:=source.Delta;
  ParameterViewAction:=source.ParameterViewAction;
  CriticalMessage.Text:=trim(source.CriticalMessage.text);
  CriticalMessageVisible:=source.CriticalMessageVisible;
  DeltaPercentFlag:=source.DeltaPercentFlag;
  DeltaApprFlag:=source.DeltaApprFlag;

  ValuesGate.CopyDataFrom(source.ValuesGate);
  ModZeroesGate.CopyDataFrom(source.ModZeroesGate);
  DeltaExprFlag:=source.DeltaExprFlag;
  Expression.Text:=trim(source.Expression.Text);
end;

end.
