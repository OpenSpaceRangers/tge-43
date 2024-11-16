unit PathClass;

interface

uses Classes,SysUtils,
     TextFieldClass,
     ParameterDeltaClass,
     EC_BlockPar, MessageText;

type PText=^file;

type PM=^TBlockParEC;

const
  maxpathcoords=20;

type TPath=class
  public
    M:PM;

    Probability:double;

    VoidPathFlag:boolean; // Флаг пустого пути

    AlwaysShowWhenPlaying:boolean; // Показывать путь при игре, даже если он не подходит по диапазонам

    // NoMeanFlag:boolean; //Флаг, говорящий о том, что путь является незначимым. !!!!!

    dayscost:integer;

    ShowOrder:integer;//Порядок показа

    PathNumber:integer; // Номер перехода

    PassTimesValue:integer; // Сколько раз при игре можно пройти данный переход;

    FromLocation:integer; // Номер локации из которой совершается переход
    ToLocation:integer; // Номер локации в которую совершается переход

    StartPathMessage:TTextField; // Сообщение вопроса перехода
    EndPathMessage:TTextField; // Cooбщение в конце перехода

    LogicExpression:TTextField; //Логическое условие возможности совершения перехода

    DPars: array [1..maxparameters] of TParameterDelta;

    //Изображение пути в редакторе

    PathXCoords,PathYCoords: array [0..MaxPathCoords] of integer;

    constructor Create(init_number,
                      init_from,
                      init_to,
                      init_dmax,init_dmin,
                      init_emax,init_emin,
                      init_fmax,init_fmin:integer; IM:PM);

    procedure Clear;

    procedure Save(fileout:ptext);
    procedure Load(filein:ptext);

    procedure Save_v3_8_5(fileout:ptext);
    procedure Load_v3_8_5(filein:ptext);

    procedure Save_v3_9_1(fileout:ptext);
    procedure Load_v3_9_1(filein:ptext);

    procedure Save_v3_9_2(fileout:ptext);
    procedure Load_v3_9_2(filein:ptext);

    procedure Save_v3_9_3(fileout:ptext);
    procedure Load_v3_9_3(filein:ptext);

    procedure Save_v3_9_4(fileout:ptext);
    procedure Load_v3_9_4(filein:ptext);

    procedure Save_v3_9_6(fileout:ptext);
    procedure Load_v3_9_6(filein:ptext);

    procedure Save_v4_0_2(fileout:ptext);
    procedure Load_v4_0_2(filein:ptext);

    procedure Save_v4_2_0(fileout:ptext);
    procedure Load_v4_2_0(filein:ptext);

    procedure Save_v4_3_0(fileout:ptext);
    procedure Load_v4_3_0(filein:ptext);

    procedure CopyDataFrom(var source:TPath);

    function IsEqualWith(var source:TPath):boolean;
end;


implementation

procedure TPath.Clear;
var
  i:integer;
begin
  dayscost:=0;
  ShowOrder:=5;
  Probability:=1;
  PassTimesValue:=1;
  PathNumber:=0;
  FromLocation:=0;
  ToLocation:=0;
  StartPathMessage.Text:=M.Par_Get('PathClassStartPathMessage');

  EndPathMessage.Text:='';
  LogicExpression.Text:='';
  for i:=1 to maxparameters do DPars[i].Clear;

  VoidPathFlag:=true;

  AlwaysShowWhenPlaying:=false;
end;


function TPath.IsEqualWith(var source:TPath):boolean;
label yes,no;
var
  answer:boolean;
  i:integer;
begin
  answer:=false;

  for i:=0 to maxpathcoords  do begin
    if PathXCoords[i]<>source.PathXCoords[i] then  goto no;
    if PathYCoords[i]<>source.PathYCoords[i] then  goto no;
  end;

  for i:=1 to maxparameters do
  if not DPars[i].IsEqualWith(source.DPars[i]) then  goto no;

  if ShowOrder<>source.ShowOrder then goto no;
  if Probability<>source.Probability then  goto no;
  if dayscost<>source.dayscost then  goto no;
  if PathNumber<>source.PathNumber then  goto no;
  if FromLocation<>source.FromLocation then  goto no;
  if ToLocation<>source.ToLocation then  goto no;
  if VoidPathFlag<>source.VoidPathFlag then  goto no;
  if trim(StartPathMessage.Text)<>trim(source.StartPathMessage.text) then  goto no;
  if trim(EndPathMessage.Text)<>trim(source.EndPathMessage.Text) then  goto no;
  if trim(LogicExpression.Text)<>trim(source.LogicExpression.Text) then  goto no;
  if AlwaysShowWhenPlaying<>source.AlwaysShowWhenPlaying then goto no;
  if PassTimesValue<>source.PassTimesValue then goto no;
yes:
  answer:=true;

no:
  IsEqualWith:=answer;
end;


procedure TPath.CopyDataFrom(var source:TPath);
var
  i:integer;
begin
  for i:=0 to maxpathcoords  do begin
    PathXCoords[i]:=source.PathXCoords[i];
    PathYCoords[i]:=source.PathYCoords[i];
  end;

  dayscost:=source.dayscost;

  ShowOrder:=source.ShowOrder;
  Probability:=source.Probability;
  PathNumber:=source.PathNumber;
  FromLocation:=source.FromLocation;
  ToLocation:=source.ToLocation;

  PassTimesValue:=source.PassTimesValue;
  LogicExpression.Text:=source.LogicExpression.Text;
  StartPathMessage.Text:=source.StartPathMessage.text;
  EndPathMessage.Text:=source.EndPathMessage.Text;

  for i:=1 to maxparameters do DPars[i].CopyDataFrom(source.DPars[i]);

  VoidPathFlag:=source.VoidPathFlag;

  AlwaysShowWhenPlaying:=source.AlwaysShowWhenPlaying;
end;


constructor TPath.Create(init_number, init_from, init_to,
                         init_dmax,init_dmin,
                         init_emax,init_emin,
                         init_fmax,init_fmin:integer; IM:PM);
var
  i:integer;
begin
  M:=IM;
  M:=@MessageText.M;
  StartPathMessage:=TTextField.Create;
  EndPathMessage:=TTextField.Create;
  LogicExpression:=TTextField.Create;
  for i:=1 to maxparameters do DPars[i]:=TParameterDelta.Create(i);

  Clear;

  PathNumber:=init_number;
  ToLocation:=init_to;
  FromLocation:=init_from;
end;



procedure TPath.Save_v4_3_0(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,probability,sizeof(probability));
  BlockWrite(fileout^,dayscost,sizeof(dayscost));
  BlockWrite(fileout^,PathNumber,sizeof(PathNumber));
  BlockWrite(fileout^,FromLocation,sizeof(FromLocation));
  BlockWrite(fileout^,ToLocation,sizeof(ToLocation));
  BlockWrite(fileout^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockWrite(fileout^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockWrite(fileout^,PassTimesValue,sizeof(PassTimesValue));
  BlockWrite(fileout^,ShowOrder,sizeof(ShowOrder));

  for i:=1 to maxparameters do DPars[i].Save_v3_9_6(ParameterDeltaClass.PText(fileout));
  LogicExpression.Save(TextFieldClass.PText(fileout));
  StartPathMessage.Save(TextFieldClass.PText(fileout));
  EndPathMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TPath.Load_v4_3_0(filein:ptext);
var
  i:integer;
begin
  Clear;
  BlockRead(filein^,probability,sizeof(probability));
  BlockRead(filein^,dayscost,sizeof(dayscost));
  BlockRead(filein^,PathNumber,sizeof(PathNumber));
  BlockRead(filein^,FromLocation,sizeof(FromLocation));
  BlockRead(filein^,ToLocation,sizeof(ToLocation));
  BlockRead(filein^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockRead(filein^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockRead(filein^,PassTimesValue,sizeof(PassTimesValue));
  BlockRead(filein^,ShowOrder,sizeof(ShowOrder));

  for i:=1 to maxparameters do DPars[i].Load_v3_9_6(ParameterDeltaClass.PText(filein));
  LogicExpression.Load(TextFieldClass.PText(filein));
  StartPathMessage.Load(TextFieldClass.PText(filein));
  EndPathMessage.Load(TextFieldClass.PText(filein));
end;



procedure TPath.Save_v4_2_0(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,probability,sizeof(probability));
  BlockWrite(fileout^,dayscost,sizeof(dayscost));
  BlockWrite(fileout^,PathNumber,sizeof(PathNumber));
  BlockWrite(fileout^,FromLocation,sizeof(FromLocation));
  BlockWrite(fileout^,ToLocation,sizeof(ToLocation));
  BlockWrite(fileout^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockWrite(fileout^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockWrite(fileout^,PassTimesValue,sizeof(PassTimesValue));
  BlockWrite(fileout^,ShowOrder,sizeof(ShowOrder));

  for i:=1 to 48 do DPars[i].Save_v3_9_6(ParameterDeltaClass.PText(fileout));
  LogicExpression.Save(TextFieldClass.PText(fileout));
  StartPathMessage.Save(TextFieldClass.PText(fileout));
  EndPathMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TPath.Load_v4_2_0(filein:ptext);
var
  i:integer;
begin
  Clear;
  BlockRead(filein^,probability,sizeof(probability));
  BlockRead(filein^,dayscost,sizeof(dayscost));
  BlockRead(filein^,PathNumber,sizeof(PathNumber));
  BlockRead(filein^,FromLocation,sizeof(FromLocation));
  BlockRead(filein^,ToLocation,sizeof(ToLocation));
  BlockRead(filein^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockRead(filein^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockRead(filein^,PassTimesValue,sizeof(PassTimesValue));
  BlockRead(filein^,ShowOrder,sizeof(ShowOrder));

  for i:=1 to 48 do DPars[i].Load_v3_9_6(ParameterDeltaClass.PText(filein));
  LogicExpression.Load(TextFieldClass.PText(filein));
  StartPathMessage.Load(TextFieldClass.PText(filein));
  EndPathMessage.Load(TextFieldClass.PText(filein));
end;



procedure TPath.Save_v4_0_2(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,probability,sizeof(probability));
  BlockWrite(fileout^,dayscost,sizeof(dayscost));
  BlockWrite(fileout^,PathNumber,sizeof(PathNumber));
  BlockWrite(fileout^,FromLocation,sizeof(FromLocation));
  BlockWrite(fileout^,ToLocation,sizeof(ToLocation));
  BlockWrite(fileout^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockWrite(fileout^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockWrite(fileout^,PassTimesValue,sizeof(PassTimesValue));
  BlockWrite(fileout^,ShowOrder,sizeof(ShowOrder));

  for i:=1 to 24 do DPars[i].Save_v3_9_6(ParameterDeltaClass.PText(fileout));
  LogicExpression.Save(TextFieldClass.PText(fileout));
  StartPathMessage.Save(TextFieldClass.PText(fileout));
  EndPathMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TPath.Load_v4_0_2(filein:ptext);
var
  i:integer;
begin
  Clear;
  BlockRead(filein^,probability,sizeof(probability));
  BlockRead(filein^,dayscost,sizeof(dayscost));
  BlockRead(filein^,PathNumber,sizeof(PathNumber));
  BlockRead(filein^,FromLocation,sizeof(FromLocation));
  BlockRead(filein^,ToLocation,sizeof(ToLocation));
  BlockRead(filein^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockRead(filein^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockRead(filein^,PassTimesValue,sizeof(PassTimesValue));
  BlockRead(filein^,ShowOrder,sizeof(ShowOrder));

  for i:=1 to 24 do DPars[i].Load_v3_9_6(ParameterDeltaClass.PText(filein));
  LogicExpression.Load(TextFieldClass.PText(filein));
  StartPathMessage.Load(TextFieldClass.PText(filein));
  EndPathMessage.Load(TextFieldClass.PText(filein));
end;



procedure TPath.Save_v3_9_6(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,probability,sizeof(probability));
  BlockWrite(fileout^,dayscost,sizeof(dayscost));
  BlockWrite(fileout^,PathNumber,sizeof(PathNumber));
  BlockWrite(fileout^,FromLocation,sizeof(FromLocation));
  BlockWrite(fileout^,ToLocation,sizeof(ToLocation));
  BlockWrite(fileout^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockWrite(fileout^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockWrite(fileout^,PassTimesValue,sizeof(PassTimesValue));

  for i:=1 to 24 do DPars[i].Save_v3_9_6(ParameterDeltaClass.PText(fileout));
  LogicExpression.Save(TextFieldClass.PText(fileout));
  StartPathMessage.Save(TextFieldClass.PText(fileout));
  EndPathMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TPath.Load_v3_9_6(filein:ptext);
var
  i:integer;
begin
  Clear;

  BlockRead(filein^,probability,sizeof(probability));
  BlockRead(filein^,dayscost,sizeof(dayscost));
  BlockRead(filein^,PathNumber,sizeof(PathNumber));
  BlockRead(filein^,FromLocation,sizeof(FromLocation));
  BlockRead(filein^,ToLocation,sizeof(ToLocation));
  BlockRead(filein^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockRead(filein^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockRead(filein^,PassTimesValue,sizeof(PassTimesValue));

  for i:=1 to 24 do DPars[i].Load_v3_9_6(ParameterDeltaClass.PText(filein));
  LogicExpression.Load(TextFieldClass.PText(filein));
  StartPathMessage.Load(TextFieldClass.PText(filein));
  EndPathMessage.Load(TextFieldClass.PText(filein));
end;



procedure TPath.Save_v3_9_4(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,probability,sizeof(probability));
  BlockWrite(fileout^,dayscost,sizeof(dayscost));
  BlockWrite(fileout^,PathNumber,sizeof(PathNumber));
  BlockWrite(fileout^,FromLocation,sizeof(FromLocation));
  BlockWrite(fileout^,ToLocation,sizeof(ToLocation));
  BlockWrite(fileout^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockWrite(fileout^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockWrite(fileout^,PassTimesValue,sizeof(PassTimesValue));

  for i:=1 to 12 do DPars[i].Save_v3_9_4(ParameterDeltaClass.PText(fileout));
  LogicExpression.Save(TextFieldClass.PText(fileout));
  StartPathMessage.Save(TextFieldClass.PText(fileout));
  EndPathMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TPath.Load_v3_9_4(filein:ptext);
var
  i:integer;
begin
  Clear;

  BlockRead(filein^,probability,sizeof(probability));
  BlockRead(filein^,dayscost,sizeof(dayscost));
  BlockRead(filein^,PathNumber,sizeof(PathNumber));
  BlockRead(filein^,FromLocation,sizeof(FromLocation));
  BlockRead(filein^,ToLocation,sizeof(ToLocation));
  BlockRead(filein^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockRead(filein^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockRead(filein^,PassTimesValue,sizeof(PassTimesValue));

  for i:=1 to 12 do DPars[i].Load_v3_9_4(ParameterDeltaClass.PText(filein));

  StartPathMessage.Load(TextFieldClass.PText(filein));
  EndPathMessage.Load(TextFieldClass.PText(filein));
end;



procedure TPath.Save_v3_9_3(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,probability,sizeof(probability));
  BlockWrite(fileout^,dayscost,sizeof(dayscost));
  BlockWrite(fileout^,PathNumber,sizeof(PathNumber));
  BlockWrite(fileout^,FromLocation,sizeof(FromLocation));
  BlockWrite(fileout^,ToLocation,sizeof(ToLocation));
  BlockWrite(fileout^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockWrite(fileout^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockWrite(fileout^,PassTimesValue,sizeof(PassTimesValue));

  for i:=1 to 12 do DPars[i].Save_v3_9_3(ParameterDeltaClass.PText(fileout));

  StartPathMessage.Save(TextFieldClass.PText(fileout));
  EndPathMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TPath.Load_v3_9_3(filein:ptext);
var
  i:integer;
begin
  Clear;

  BlockRead(filein^,probability,sizeof(probability));
  BlockRead(filein^,dayscost,sizeof(dayscost));
  BlockRead(filein^,PathNumber,sizeof(PathNumber));
  BlockRead(filein^,FromLocation,sizeof(FromLocation));
  BlockRead(filein^,ToLocation,sizeof(ToLocation));
  BlockRead(filein^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockRead(filein^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockRead(filein^,PassTimesValue,sizeof(PassTimesValue));

  for i:=1 to 12 do DPars[i].Load_v3_9_3(ParameterDeltaClass.PText(filein));

  StartPathMessage.Load(TextFieldClass.PText(filein));
  EndPathMessage.Load(TextFieldClass.PText(filein));
end;



procedure TPath.Save_v3_9_2(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,PathNumber,sizeof(PathNumber));
  BlockWrite(fileout^,FromLocation,sizeof(FromLocation));
  BlockWrite(fileout^,ToLocation,sizeof(ToLocation));
  BlockWrite(fileout^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockWrite(fileout^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockWrite(fileout^,PassTimesValue,sizeof(PassTimesValue));

  for i:=1 to 12 do DPars[i].Save(ParameterDeltaClass.PText(fileout));

  StartPathMessage.Save(TextFieldClass.PText(fileout));
  EndPathMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TPath.Load_v3_9_2(filein:ptext);
var
  i:integer;
begin
  Clear;
  BlockRead(filein^,PathNumber,sizeof(PathNumber));
  BlockRead(filein^,FromLocation,sizeof(FromLocation));
  BlockRead(filein^,ToLocation,sizeof(ToLocation));
  BlockRead(filein^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockRead(filein^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockRead(filein^,PassTimesValue,sizeof(PassTimesValue));

  for i:=1 to 12 do DPars[i].Load(ParameterDeltaClass.PText(filein));

  StartPathMessage.Load(TextFieldClass.PText(filein));
  EndPathMessage.Load(TextFieldClass.PText(filein));
end;



procedure TPath.Save_v3_9_1(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,PathNumber,sizeof(PathNumber));
  BlockWrite(fileout^,FromLocation,sizeof(FromLocation));
  BlockWrite(fileout^,ToLocation,sizeof(ToLocation));
  BlockWrite(fileout^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockWrite(fileout^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockWrite(fileout^,PassTimesValue,sizeof(PassTimesValue));

  for i:=1 to 9 do DPars[i].Save(ParameterDeltaClass.PText(fileout));

  StartPathMessage.Save(TextFieldClass.PText(fileout));
  EndPathMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TPath.Load_v3_9_1(filein:ptext);
var
  i:integer;
begin
  Clear;
  BlockRead(filein^,PathNumber,sizeof(PathNumber));
  BlockRead(filein^,FromLocation,sizeof(FromLocation));
  BlockRead(filein^,ToLocation,sizeof(ToLocation));
  BlockRead(filein^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockRead(filein^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));
  BlockRead(filein^,PassTimesValue,sizeof(PassTimesValue));

  for i:=1 to 9 do DPars[i].Load(ParameterDeltaClass.PText(filein));

  StartPathMessage.Load(TextFieldClass.PText(filein));
  EndPathMessage.Load(TextFieldClass.PText(filein));
end;



procedure TPath.Save_v3_8_5(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,PathNumber,sizeof(PathNumber));
  BlockWrite(fileout^,FromLocation,sizeof(FromLocation));
  BlockWrite(fileout^,ToLocation,sizeof(ToLocation));
  BlockWrite(fileout^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockWrite(fileout^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));

  for i:=1 to 9 do DPars[i].Save(ParameterDeltaClass.PText(fileout));

  StartPathMessage.Save(TextFieldClass.PText(fileout));
  EndPathMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TPath.Load_v3_8_5(filein:ptext);
var
  i:integer;
begin
  Clear;
  BlockRead(filein^,PathNumber,sizeof(PathNumber));
  BlockRead(filein^,FromLocation,sizeof(FromLocation));
  BlockRead(filein^,ToLocation,sizeof(ToLocation));
  BlockRead(filein^,VoidPathFlag,sizeof(VoidPathFlag));
  BlockRead(filein^,AlwaysShowWhenPlaying,sizeof(AlwaysShowWhenPlaying));

  for i:=1 to 9 do DPars[i].Load(ParameterDeltaClass.PText(filein));

  StartPathMessage.Load(TextFieldClass.PText(filein));
  EndPathMessage.Load(TextFieldClass.PText(filein));
end;



procedure TPath.Save(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,PathNumber,sizeof(PathNumber));
  BlockWrite(fileout^,FromLocation,sizeof(FromLocation));
  BlockWrite(fileout^,ToLocation,sizeof(ToLocation));
  BlockWrite(fileout^,VoidPathFlag,sizeof(VoidPathFlag));

  for i:=1 to 9 do DPars[i].Save(ParameterDeltaClass.PText(fileout));

  StartPathMessage.Save(TextFieldClass.PText(fileout));
  EndPathMessage.Save(TextFieldClass.PText(fileout));
end;

procedure TPath.Load(filein:ptext);
var
  i:integer;
begin
  Clear;
  BlockRead(filein^,PathNumber,sizeof(PathNumber));
  BlockRead(filein^,FromLocation,sizeof(FromLocation));
  BlockRead(filein^,ToLocation,sizeof(ToLocation));
  BlockRead(filein^,VoidPathFlag,sizeof(VoidPathFlag));

  for i:=1 to 9 do DPars[i].Load(ParameterDeltaClass.PText(filein));

  StartPathMessage.Load(TextFieldClass.PText(filein));
  EndPathMessage.Load(TextFieldClass.PText(filein));
end;

end.
