 unit LocationClass;

interface

Uses TextFieldClass, ParameterDeltaClass,
     Classes,SysUtils,
     EC_BlockPar,MessageText,
     CalcParseClass;

const
  MaxLocationDescriptions=10;

type PText=^file;
type PM=^TBlockParEC;
type TParValues=array [1..maxparameters] of integer;

type TLocation=class
  public
    M:PM;
    screenx,screeny:integer; // Координаты локации на экране

    DaysCost:integer; // сколько дне прошло

    LocationNumber:integer;      //Номер локации
    LocationName:TTextField;    //Краткое описание локации
    LocationDescription:TTextField; //Длинное описание локации

    LocationDescriptions: array [1..MaxLocationDescriptions] of TTextField;
    RandomShowLocationDescriptions:boolean;
    LocDescrOrder:integer;
    LocDescrExprOrder:TTextField;
    VoidLocation:boolean;

    ClosedLocationFlag:boolean;
    NoWay2LocationFlag:boolean;

    DPars: array [1..maxparameters] of TParameterDelta;

    PlayerDeath:boolean;

    Money:boolean;

    StartLocationFlag:boolean; //Флаг, говорящий о том, что локация является стартовой
    EndLocationFlag:boolean; //Флаг, говорящий о том, что локация является конечной
    FailLocationFlag:boolean; //Флаг, говорящий о том, что локация является провальной

    constructor Create(init_number:integer; IM:PM);
    procedure Clear;

    procedure Save(fileout:ptext);
    procedure Load(filein:ptext);

    procedure Save_v3_9_2(fileout:ptext);
    procedure Load_v3_9_2(filein:ptext);

    procedure Save_v3_9_3(fileout:ptext);
    procedure Load_v3_9_3(filein:ptext);

    procedure Save_v3_9_4(fileout:ptext);
    procedure Load_v3_9_4(filein:ptext; xScreenResolution,YScreenResolution:integer);

    procedure Save_v3_9_6(fileout:ptext);
    procedure Load_v3_9_6(filein:ptext; xScreenResolution,YScreenResolution:integer);

    procedure Save_v4_0_1(fileout:ptext);
    procedure Load_v4_0_1(filein:ptext; xScreenResolution,YScreenResolution:integer);

    procedure Save_v4_2_0(fileout:ptext);
    procedure Load_v4_2_0(filein:ptext; xScreenResolution,YScreenResolution:integer);

    procedure Save_v4_3_0(fileout:ptext);
    procedure Load_v4_3_0(filein:ptext; xScreenResolution,YScreenResolution:integer);
    
    procedure CopyDataFrom(var source:TLocation);
    function  IsEqualWith(var source:TLocation):boolean;

    procedure FindLocationDescription(panel:boolean); overload;
    procedure FindLocationDescription(var pars:TParValues); overload;

    function ValueOfLocationDescriptions:integer;
end;

implementation


function TLocation.ValueOfLocationDescriptions:integer;
var
  i,c:integer;
begin
  c:=0;
  for i:=1 to MaxLocationDescriptions do begin
    if trim(LocationDescriptions[i].Text)<>'' then inc(c);
  end;

  ValueOfLocationDescriptions:=c;
end;

procedure TLocation.FindLocationDescription(panel:boolean);
var
  i,c:integer;
  found:boolean;
  text:WideString;
begin
  found:=false;
  if (RandomShowLocationDescriptions)and(not panel) then begin
    c:=0;
    while not found do begin
      i:=Random(10)+1;
      text:=trim(LocationDescriptions[i].Text);
      if text<>'' then begin
        found:=true;
        LocationDescription.Text:=text;
      end else inc(c);
      if c>MaxLocationDescriptions*2 then begin text:=''; found:=true; end;
    end;
  end else begin
    i:=locdescrorder;
    if panel then i:=1;
    c:=0;
    while not found do begin
      text:=trim(LocationDescriptions[i].Text);
      if text<>'' then begin
        found:=true;
        LocationDescription.Text:=text;
        locdescrorder:=i+1;
      end else inc(c);
      inc(i);
      if i>MaxLocationDescriptions then i:=1;
      if c>MaxLocationDescriptions then begin
        text:='';
        found:=true;
        locdescrorder:=i;
      end;
    end;
  end;

  LocationDescription.Text:=text;
end;

procedure TLocation.FindLocationDescription(var pars:TParValues);
var
  i,c:integer;
  found:boolean;
  text:WideString;
  parse:TCalcParse;
  flag:boolean;
begin
  found:=false;
  if (RandomShowLocationDescriptions) then begin
    flag:=true;
    parse:=TCalcParse.Create;
    parse.AssignAndPreprocess(LocDescrExprOrder.Text,1);
    if parse.error or parse.default_expression then flag:=false;
    if flag then begin
      parse.Parse(CalcParseClass.TParValues(pars));
      if parse.calc_error then flag:=false;
    end;
    if flag then begin
      if (parse.answer>10)or(parse.answer<1) then flag:=false;
    end;
    if flag then begin
      if trim(LocationDescriptions[parse.answer].Text)='' then flag:=false;
    end;
    if flag then begin
      text:=trim(LocationDescriptions[parse.answer].Text);
    end;
    parse.Destroy;
    if not flag then begin
    c:=0;
      while not found do begin
        i:=Random(10)+1;
        text:=trim(LocationDescriptions[i].Text);
        if text<>'' then begin
          found:=true;
          LocationDescription.Text:=text;
        end else inc(c);
        if c>MaxLocationDescriptions*2 then begin text:=''; found:=true; end;
      end;
    end;
  end else begin
    i:=locdescrorder;
    c:=0;
    while not found do begin
      text:=trim(LocationDescriptions[i].Text);
      if text<>'' then begin
        found:=true;
        LocationDescription.Text:=text;
        locdescrorder:=i+1;
      end else inc(c);
      inc(i);
      if i>MaxLocationDescriptions then i:=1;
      if c>MaxLocationDescriptions then begin
        text:='';
        found:=true;
        locdescrorder:=i;
      end;
    end;
  end;

  LocationDescription.Text:=text;
end;

procedure TLocation.Clear;
var
  i:integer;
begin
  screenx:=100;
  screeny:=100;
  VoidLocation:=false;
  DaysCost:=0;
  for i:=1 to maxparameters do DPars[i].Clear;

  for i:=1 to MaxLocationDescriptions do LocationDescriptions[i].Clear;
  RandomShowLocationDescriptions:=false;
  LocDescrOrder:=1;
  LocDescrExprOrder.Clear;
  FailLocationFlag:=False;
  ClosedLocationFlag:=False;
  NoWay2LocationFlag:=false;
  PlayerDeath:=false;
  LocationNumber:=0;
  LocationName.Clear;
  LocationName.Text:=(M.Par_Get('LocationClassNewLocationName'));
  LocationDescription.Clear;
  LocationDescription.Text:=(M.Par_Get('LocationClassNewLocationText'));
  StartLocationFlag:=false;
  EndLocationFlag:=false;
end;

function  TLocation.IsEqualWith(var source:TLocation):boolean;
label yes,no;
var
  answer:boolean;
  i:integer;
begin
  answer:=false;

  for i:=1 to maxparameters do
  if not DPars[i].IsEqualWith(source.DPars[i]) then  goto no;


  for i:=1 to MaxLocationDescriptions do begin
    if trim(LocationDescriptions[i].Text) <> trim(source.LocationDescriptions[i].Text) then goto no;
  end;
  if RandomShowLocationDescriptions <> source.RandomShowLocationDescriptions then goto no;

  if LocDescrOrder<>source.LocDescrOrder then goto no;
  if RandomShowLocationDescriptions=source.RandomShowLocationDescriptions then begin
    if trim(LocDescrExprOrder.Text)<>trim(source.LocDescrExprOrder.Text) then goto no;
  end;
  if dayscost<>source.dayscost then goto no;
  if screenx<>source.screenx then  goto no;
  if screeny<>source.screeny then  goto no;
  if ClosedLocationFlag<>source.ClosedLocationFlag then  goto no;
  if NoWay2LocationFlag<>source.NoWay2LocationFlag then  goto no;
  if PlayerDeath<>source.PlayerDeath then  goto no;
  if LocationNumber<>source.LocationNumber then  goto no;
  if StartLocationFlag<>source.StartLocationFlag then  goto no;
  if EndLocationFlag<>source.EndLocationFlag then  goto no;
  if FailLocationFlag<>source.FailLocationFlag then  goto no;
  if VoidLocation<>source.VoidLocation then goto no;
           
  if trim(LocationName.text)<>trim(source.LocationName.text) then  goto no;
  //       if trim(LocationDescription.text)<>trim(source.LocationDescription.text) then  goto no;

  yes:
  answer:=true;

  no:
  IsEqualWith:=answer;
end;

procedure TLocation.CopyDataFrom(var source:TLocation);
var
  i:integer;
begin
  screenx:=source.screenx;
  screeny:=source.screeny;

  for i:=1 to maxparameters do DPars[i].CopyDataFrom(source.DPars[i]);

  for i:=1 to MaxLocationDescriptions do
    LocationDescriptions[i].CopyDataFrom(TTextField(source.LocationDescriptions[i]));

  RandomShowLocationDescriptions:=source.RandomShowLocationDescriptions;
  LocDescrOrder:=source.LocDescrOrder;
  LocDescrExprOrder.CopyDataFrom(source.LocDescrExprOrder);
  VoidLocation:=source.VoidLocation;
  dayscost:=source.DaysCost;

  ClosedLocationFlag:=source.ClosedLocationFlag;
  NoWay2LocationFlag:=source.NoWay2LocationFlag;
  PlayerDeath:=source.PlayerDeath;
  LocationNumber:=source.LocationNumber;
  LocationName.CopyDataFrom(TTextField(source.LocationName));
  LocationDescription.CopyDataFrom(TTextField(source.LocationDescription));
  LocationDescription.Text:='';

  StartLocationFlag:=source.StartLocationFlag;
  EndLocationFlag:=source.EndLocationFlag;
  FailLocationFlag:=source.FailLocationFlag;
end;

constructor TLocation.Create(init_number:integer; IM:PM);
var
  i:integer;
begin
  M:=@MessageText.M;

  for i:=1 to MaxLocationDescriptions do
    LocationDescriptions[i]:=TTextField.Create;

  LocationNumber:=init_number;
  LocationDescription:=TTextField.Create;
  LocationName:=TTextField.Create;
  LocDescrExprOrder:=TTextField.Create;

  for i:=1 to maxparameters do DPars[i]:=TParameterDelta.Create(i);
  Clear;
end;


procedure TLocation.Save_v4_3_0(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,dayscost,sizeof(dayscost));
  BlockWrite(fileout^,screenx,sizeof(screenx));
  BlockWrite(fileout^,screeny,sizeof(screeny));
  BlockWrite(fileout^,LocationNumber,sizeof(LocationNumber));

  BlockWrite(fileout^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockWrite(fileout^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockWrite(fileout^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockWrite(fileout^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!
  BlockWrite(fileout^,VoidLocation,sizeof(VoidLocation)); //!!!!!

  for i:=1 to maxparameters do DPars[i].Save_v3_9_6(ParameterDeltaClass.PText(fileout));
  for i:=1 to MaxLocationDescriptions do LocationDescriptions[i].Save(TextFieldClass.Ptext(fileout));

  BlockWrite(fileout^,RandomShowLocationDescriptions,sizeof(RandomShowLocationDescriptions));
  BlockWrite(fileout^,LocDescrOrder,sizeof(LocDescrOrder));

  LocationName.Save(TextFieldClass.Ptext(fileout));
  LocationDescription.Save(TextFieldClass.Ptext(fileout));
  LocDescrExprOrder.Save(TextFieldClass.Ptext(fileout));
end;

procedure TLocation.Load_v4_3_0(filein:ptext; xScreenResolution,YScreenResolution:integer);
var
  i:integer;
begin
  Clear;
  BlockRead(filein^,dayscost,sizeof(dayscost));
  BlockRead(filein^,screenx,sizeof(screenx));
  BlockRead(filein^,screeny,sizeof(screeny));
  BlockRead(filein^,LocationNumber,sizeof(LocationNumber));
  BlockRead(filein^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockRead(filein^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockRead(filein^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockRead(filein^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!
  BlockRead(filein^,VoidLocation,sizeof(VoidLocation)); //!!!!!

  for i:=1 to maxparameters do DPars[i].Load_v3_9_6(ParameterDeltaClass.PText(filein));
  for i:=1 to MaxLocationDescriptions do LocationDescriptions[i].Load(TextFieldClass.Ptext(filein));

  BlockRead(filein^,RandomShowLocationDescriptions,sizeof(RandomShowLocationDescriptions));
  BlockRead(filein^,LocDescrOrder,sizeof(LocDescrOrder));

  LocationName.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Load(TextFieldClass.Ptext(filein));
  LocDescrExprOrder.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Text:='';
end;



procedure TLocation.Save_v4_2_0(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,dayscost,sizeof(dayscost));
  BlockWrite(fileout^,screenx,sizeof(screenx));
  BlockWrite(fileout^,screeny,sizeof(screeny));
  BlockWrite(fileout^,LocationNumber,sizeof(LocationNumber));

  BlockWrite(fileout^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockWrite(fileout^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockWrite(fileout^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockWrite(fileout^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!
  BlockWrite(fileout^,VoidLocation,sizeof(VoidLocation)); //!!!!!

  for i:=1 to 48 do DPars[i].Save_v3_9_6(ParameterDeltaClass.PText(fileout));
  for i:=1 to MaxLocationDescriptions do LocationDescriptions[i].Save(TextFieldClass.Ptext(fileout));

  BlockWrite(fileout^,RandomShowLocationDescriptions,sizeof(RandomShowLocationDescriptions));
  BlockWrite(fileout^,LocDescrOrder,sizeof(LocDescrOrder));

  LocationName.Save(TextFieldClass.Ptext(fileout));
  LocationDescription.Save(TextFieldClass.Ptext(fileout));
  LocDescrExprOrder.Save(TextFieldClass.Ptext(fileout));
end;

procedure TLocation.Load_v4_2_0(filein:ptext; xScreenResolution,YScreenResolution:integer);
var
  i:integer;
begin
  Clear;
  BlockRead(filein^,dayscost,sizeof(dayscost));
  BlockRead(filein^,screenx,sizeof(screenx));
  BlockRead(filein^,screeny,sizeof(screeny));
  BlockRead(filein^,LocationNumber,sizeof(LocationNumber));
  BlockRead(filein^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockRead(filein^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockRead(filein^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockRead(filein^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!
  BlockRead(filein^,VoidLocation,sizeof(VoidLocation)); //!!!!!

  for i:=1 to 48 do DPars[i].Load_v3_9_6(ParameterDeltaClass.PText(filein));
  for i:=1 to MaxLocationDescriptions do LocationDescriptions[i].Load(TextFieldClass.Ptext(filein));

  BlockRead(filein^,RandomShowLocationDescriptions,sizeof(RandomShowLocationDescriptions));
  BlockRead(filein^,LocDescrOrder,sizeof(LocDescrOrder));

  LocationName.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Load(TextFieldClass.Ptext(filein));
  LocDescrExprOrder.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Text:='';
end;



procedure TLocation.Save_v4_0_1(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,dayscost,sizeof(dayscost));
  BlockWrite(fileout^,screenx,sizeof(screenx));
  BlockWrite(fileout^,screeny,sizeof(screeny));
  BlockWrite(fileout^,LocationNumber,sizeof(LocationNumber));

  BlockWrite(fileout^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockWrite(fileout^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockWrite(fileout^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockWrite(fileout^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!
  BlockWrite(fileout^,VoidLocation,sizeof(VoidLocation)); //!!!!!

  for i:=1 to 24 do DPars[i].Save_v3_9_6(ParameterDeltaClass.PText(fileout));
  for i:=1 to MaxLocationDescriptions do LocationDescriptions[i].Save(TextFieldClass.Ptext(fileout));

  BlockWrite(fileout^,RandomShowLocationDescriptions,sizeof(RandomShowLocationDescriptions));
  BlockWrite(fileout^,LocDescrOrder,sizeof(LocDescrOrder));

  LocationName.Save(TextFieldClass.Ptext(fileout));
  LocationDescription.Save(TextFieldClass.Ptext(fileout));
  LocDescrExprOrder.Save(TextFieldClass.Ptext(fileout));
end;

procedure TLocation.Load_v4_0_1(filein:ptext; xScreenResolution,YScreenResolution:integer);
var
  i:integer;
begin
  Clear;
  BlockRead(filein^,dayscost,sizeof(dayscost));
  BlockRead(filein^,screenx,sizeof(screenx));
  BlockRead(filein^,screeny,sizeof(screeny));
  BlockRead(filein^,LocationNumber,sizeof(LocationNumber));
  BlockRead(filein^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockRead(filein^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockRead(filein^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockRead(filein^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!
  BlockRead(filein^,VoidLocation,sizeof(VoidLocation)); //!!!!!

  for i:=1 to 24 do DPars[i].Load_v3_9_6(ParameterDeltaClass.PText(filein));

  for i:=1 to MaxLocationDescriptions do
    LocationDescriptions[i].Load(TextFieldClass.Ptext(filein));

  BlockRead(filein^,RandomShowLocationDescriptions,sizeof(RandomShowLocationDescriptions));
  BlockRead(filein^,LocDescrOrder,sizeof(LocDescrOrder));

  LocationName.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Load(TextFieldClass.Ptext(filein));
  LocDescrExprOrder.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Text:='';
end;


procedure TLocation.Save_v3_9_6(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,dayscost,sizeof(dayscost));
  BlockWrite(fileout^,screenx,sizeof(screenx));
  BlockWrite(fileout^,screeny,sizeof(screeny));
  BlockWrite(fileout^,LocationNumber,sizeof(LocationNumber));

  BlockWrite(fileout^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockWrite(fileout^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockWrite(fileout^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockWrite(fileout^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!
  BlockWrite(fileout^,VoidLocation,sizeof(VoidLocation)); //!!!!!

  for i:=1 to 24 do DPars[i].Save_v3_9_6(ParameterDeltaClass.PText(fileout));

  for i:=1 to MaxLocationDescriptions do
    LocationDescriptions[i].Save(TextFieldClass.Ptext(fileout));

  BlockWrite(fileout^,RandomShowLocationDescriptions,sizeof(RandomShowLocationDescriptions));
  BlockWrite(fileout^,LocDescrOrder,sizeof(LocDescrOrder));

  LocationName.Save(TextFieldClass.Ptext(fileout));
  LocationDescription.Save(TextFieldClass.Ptext(fileout));
end;

procedure TLocation.Load_v3_9_6(filein:ptext; xScreenResolution,YScreenResolution:integer);
var
  i:integer;
begin
  Clear;
  BlockRead(filein^,dayscost,sizeof(dayscost));
  BlockRead(filein^,screenx,sizeof(screenx));
  BlockRead(filein^,screeny,sizeof(screeny));
  BlockRead(filein^,LocationNumber,sizeof(LocationNumber));
  BlockRead(filein^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockRead(filein^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockRead(filein^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockRead(filein^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!
  BlockRead(filein^,VoidLocation,sizeof(VoidLocation)); //!!!!!

  for i:=1 to 24 do DPars[i].Load_v3_9_6(ParameterDeltaClass.PText(filein));

  for i:=1 to MaxLocationDescriptions do
    LocationDescriptions[i].Load(TextFieldClass.Ptext(filein));

  BlockRead(filein^,RandomShowLocationDescriptions,sizeof(RandomShowLocationDescriptions));
  BlockRead(filein^,LocDescrOrder,sizeof(LocDescrOrder));

  LocationName.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Text:='';
end;



procedure TLocation.Save_v3_9_4(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,dayscost,sizeof(dayscost));
  BlockWrite(fileout^,screenx,sizeof(screenx));
  BlockWrite(fileout^,screeny,sizeof(screeny));
  BlockWrite(fileout^,LocationNumber,sizeof(LocationNumber));

  BlockWrite(fileout^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockWrite(fileout^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockWrite(fileout^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockWrite(fileout^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!

  for i:=1 to 12 do DPars[i].Save_v3_9_4(ParameterDeltaClass.PText(fileout));

  for i:=1 to MaxLocationDescriptions do
    LocationDescriptions[i].Save(TextFieldClass.Ptext(fileout));

  BlockWrite(fileout^,RandomShowLocationDescriptions,sizeof(RandomShowLocationDescriptions));
  BlockWrite(fileout^,LocDescrOrder,sizeof(LocDescrOrder));

  LocationName.Save(TextFieldClass.Ptext(fileout));
  LocationDescription.Save(TextFieldClass.Ptext(fileout));
end;

procedure TLocation.Load_v3_9_4(filein:ptext; xScreenResolution,YScreenResolution:integer);
var
  i:integer;
begin
  Clear;

  BlockRead(filein^,dayscost,sizeof(dayscost));
  BlockRead(filein^,screenx,sizeof(screenx));
  BlockRead(filein^,screeny,sizeof(screeny));
  BlockRead(filein^,LocationNumber,sizeof(LocationNumber));

  BlockRead(filein^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockRead(filein^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockRead(filein^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockRead(filein^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!

  for i:=1 to 12 do DPars[i].Load_v3_9_4(ParameterDeltaClass.PText(filein));

  for i:=1 to MaxLocationDescriptions do
    LocationDescriptions[i].Load(TextFieldClass.Ptext(filein));

  BlockRead(filein^,RandomShowLocationDescriptions,sizeof(RandomShowLocationDescriptions));
  BlockRead(filein^,LocDescrOrder,sizeof(LocDescrOrder));

  LocationName.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Text:='';
end;



procedure TLocation.Save_v3_9_2(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,screenx,sizeof(screenx));
  BlockWrite(fileout^,screeny,sizeof(screeny));
  BlockWrite(fileout^,LocationNumber,sizeof(LocationNumber));

  BlockWrite(fileout^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockWrite(fileout^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockWrite(fileout^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockWrite(fileout^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!

  for i:=1 to 12 do DPars[i].Save(ParameterDeltaClass.PText(fileout));

  LocationName.Save(TextFieldClass.Ptext(fileout));
  LocationDescription.Save(TextFieldClass.Ptext(fileout));
end;

procedure TLocation.Load_v3_9_2(filein:ptext);
var
  i:integer;
begin
  Clear;

  BlockRead(filein^,screenx,sizeof(screenx));
  BlockRead(filein^,screeny,sizeof(screeny));
  BlockRead(filein^,LocationNumber,sizeof(LocationNumber));

  BlockRead(filein^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockRead(filein^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockRead(filein^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockRead(filein^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!

  for i:=1 to 12 do DPars[i].Load(ParameterDeltaClass.PText(filein));

  LocationName.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Load(TextFieldClass.Ptext(filein));
  LocationDescriptions[1].Text:=trim(LocationDescription.text);
  LocationDescription.Text:='';
end;



procedure TLocation.Save_v3_9_3(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,dayscost,sizeof(dayscost));
  BlockWrite(fileout^,screenx,sizeof(screenx));
  BlockWrite(fileout^,screeny,sizeof(screeny));
  BlockWrite(fileout^,LocationNumber,sizeof(LocationNumber));

  BlockWrite(fileout^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockWrite(fileout^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockWrite(fileout^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockWrite(fileout^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!

  for i:=1 to 12 do DPars[i].Save_v3_9_3(ParameterDeltaClass.PText(fileout));

  for i:=1 to MaxLocationDescriptions do
    LocationDescriptions[i].Save(TextFieldClass.Ptext(fileout));

  BlockWrite(fileout^,RandomShowLocationDescriptions,sizeof(RandomShowLocationDescriptions));
  BlockWrite(fileout^,LocDescrOrder,sizeof(LocDescrOrder));

  LocationName.Save(TextFieldClass.Ptext(fileout));
  LocationDescription.Save(TextFieldClass.Ptext(fileout));
end;

procedure TLocation.Load_v3_9_3(filein:ptext);
var
  i:integer;
begin
  Clear;

  BlockRead(filein^,dayscost,sizeof(dayscost));
  BlockRead(filein^,screenx,sizeof(screenx));
  BlockRead(filein^,screeny,sizeof(screeny));
  BlockRead(filein^,LocationNumber,sizeof(LocationNumber));

  BlockRead(filein^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockRead(filein^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockRead(filein^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockRead(filein^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!

  for i:=1 to 12 do DPars[i].Load_v3_9_3(ParameterDeltaClass.PText(filein));

  for i:=1 to MaxLocationDescriptions do
    LocationDescriptions[i].Load(TextFieldClass.Ptext(filein));

  BlockRead(filein^,RandomShowLocationDescriptions,sizeof(RandomShowLocationDescriptions));
  BlockRead(filein^,LocDescrOrder,sizeof(LocDescrOrder));

  LocationName.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Text:='';
  //  LocationDescriptions[1].Text:=trim(LocationDescription.Text);
end;



procedure TLocation.Save(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,screenx,sizeof(screenx));
  BlockWrite(fileout^,screeny,sizeof(screeny));
  BlockWrite(fileout^,LocationNumber,sizeof(LocationNumber));

  BlockWrite(fileout^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockWrite(fileout^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockWrite(fileout^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockWrite(fileout^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!

  for i:=1 to 9 do DPars[i].Save(ParameterDeltaClass.PText(fileout));

  LocationName.Save(TextFieldClass.Ptext(fileout));
  LocationDescription.Save(TextFieldClass.Ptext(fileout));
end;

procedure TLocation.Load(filein:ptext);
var
  i:integer;
begin
  Clear;

  BlockRead(filein^,screenx,sizeof(screenx));
  BlockRead(filein^,screeny,sizeof(screeny));
  BlockRead(filein^,LocationNumber,sizeof(LocationNumber));

  BlockRead(filein^,StartLocationFlag,sizeof(StartLocationFlag));
  BlockRead(filein^,EndLocationFlag,sizeof(EndLocationFlag));
  BlockRead(filein^,FailLocationFlag,sizeof(FailLocationFlag));
  BlockRead(filein^,PlayerDeath,sizeof(PlayerDeath)); //!!!!!

  for i:=1 to 9 do DPars[i].Load(ParameterDeltaClass.PText(filein));

  LocationName.Load(TextFieldClass.Ptext(filein));
  LocationDescription.Load(TextFieldClass.Ptext(filein));
  LocationDescriptions[1].Text:=trim(LocationDescription.text);
end;

end.
