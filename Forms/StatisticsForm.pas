unit StatisticsForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GameContent,
  LocationClass,
  PathClass,
  ValueListClass,
  ParameterClass,
  ParameterDeltaClass,
  CalcParseClass,
  StatisticsCalculationStyle,
  StdCtrls, ExtCtrls;

type TParValues=array [1..maxparameters] of integer;
type TParValuesDynArray=array of TParValues;
type TParSuccessFlagsDynArray=array of boolean;

type TParameterDeltas= array [1..maxparameters] of TParameterDelta;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    AllPathesValue: TLabel;
    SuccessPathesValue: TLabel;
    FailPathesValue: TLabel;
    CloseButton: TButton;
    NoPathWayValue: TLabel;
    Label5: TLabel;
    FailLocationPathesValue: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LocationsAtAll: TLabel;
    PathesAtAll: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SuccessParPathesValue: TLabel;
    Label10: TLabel;
    NoPathWay2Value: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    InGeneralLabel: TLabel;
    WeHaveUnPathablePathes: TLabel;
    Shape8: TShape;
    procedure PrepareForTrace(JustLoaded:boolean);
    procedure UnPrepareForTrace;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure PushLocation(i:integer);
    procedure PopLocation;
    procedure UpdateForSuccessReaches;
    procedure UpdateForReaches;

    procedure PushPath(i:integer);
    procedure PopPath;
    procedure UpdatePathesForSuccessReaches;
    procedure UpdatePathesForReaches;
    procedure TraceQuest(Location,pathindex:integer;pars,oldpars:TParValues);
    procedure FormCreate(Sender: TObject);
    function ArePathesStillFromHere(Location:integer):boolean;
    function NeverHadPathes(Location:integer):boolean;
    function WeHaveSavingPath(Location:integer; var Pars:TParValues):boolean;
    procedure AddUniqueLocationParReach(Location:integer; var Pars:TParValues; success:boolean);
    function IsParReachUniqueForLocation(Location:integer; var Pars:TParValues):boolean;
    function IsGameLocationParameterFail(Location:integer; var curpars,oldpars:TParValues):boolean;
    function IsGameLocationParameterSuccess(Location:integer; var curpars,oldpars:TParValues):boolean;
    function IsGamePathParameterFail(Path:integer;var curpars,oldpars:TParValues):boolean;
    function IsGamePathParameterSuccess(Path:integer; var curpars,oldpars:TParValues):boolean;
    function IsParametersGatesOk(var pars:TParValues; pathindex:integer):boolean;
    function IsParametersBitmaskOk(parametervalue, bitmask:integer):boolean;
    function IsValueGatesOk(parametervalue:integer;valuegate:TValuesList):boolean;
    function IsModZeroeGatesOk(parametervalue:integer;valuegate:TValuesList):boolean;
    function IsOneGatesPathes(firstpath,secondpath:integer):boolean;
    procedure ProcessParametersWithDelta(var pars:TParValues; var delta:TParameterDeltas);
    procedure UpDateParMinMax(InTheLocation:boolean;Location:integer; var pars:TParValues);
    procedure SeekOneQuestionPathes;
  private
    { Private declarations }
  public

     deep:integer;

     CalculationBreak:boolean;
     CalculateRedusedStatistics:boolean;
     StopCalculation:boolean;

     IsSameParsPreviousReachSuccess:boolean;

     StatisticsIsCalculating:boolean;
     StatisticsCalculated:boolean;

     ProcessMessagesActivationCounter:integer;

     Quest:TGame;
     allpathes, failpathes, successpathes, successparpathes,
     nopathways, nopath2ways, FailLocationsPathes:integer;

     closedlocations, noway2locations, neverhadpatheslocations : array [1..maxlocations] of boolean;

     OneQuestionPathes: array [1..maxpathes] of boolean;

     LocationReaches,SuccessReaches,SuccessParReaches:array [1..maxlocations] of integer;

     LocationParUniqueReaches: array [1..maxlocations] of TParValuesDynArray;
     LocationParSuccessReachesFlags: array [1..maxlocations] of TParSuccessFlagsDynArray;

     LocationParUniqueReachesValue: array [1..maxlocations] of integer;

     ParameterActivePathes:array [0..maxpathes] of TParValues;
     ParameterActiveLocations:array [1..maxlocations] of TParValues;
     ParameterMins:array [1..maxlocations] of TParValues;
     ParameterMaxes:array [1..maxlocations] of TParValues;

     PathToLocationIndexes:array [1..maxpathes*2] of integer;

     LocationTraceProtocol:array [1..maxlocations*2] of integer;
     LocationTraceLength:integer;

     locationfailflags,finalflags:array [1..maxlocations] of boolean;

     failpath:array [0..maxpathes] of boolean;

     startlocationcount,startlocation:integer;

     PathesWeCanGo: array [1..maxlocations,1..maxpathes] of integer;

     PathReaches, PathSuccessReaches:array [1..maxpathes] of integer;
     PathTraceProtocol:array [1..maxpathes] of integer;
     PathTraceLength:integer;

     JustLoadedFlag:boolean;
    { Public declarations }
  end;

var
  Form8: TForm8;


implementation

Uses MainForm;

{$R *.DFM}


procedure TForm8.AddUniqueLocationParReach(Location:integer; var Pars:TParValues; success:boolean);
var i:integer;
begin

    inc(LocationParUniqueReachesValue[Location]);
    SetLength(LocationParUniqueReaches[Location],
              LocationParUniqueReachesValue[Location]+1);
    SetLength(LocationParSuccessReachesFlags[Location],
              LocationParUniqueReachesValue[Location]+1);

    for i:=1 to maxparameters do
     LocationParUniqueReaches[Location][LocationParUniqueReachesValue[Location]][i]:=Pars[i];

     LocationParSuccessReachesFlags[Location][LocationParUniqueReachesValue[Location]]:=success;

     end;

function  TForm8.IsParReachUniqueForLocation(Location:integer; var Pars:TParValues):boolean;
label done;
var c,i:integer;
    answer,temp:boolean;
begin

    answer:=true;
    for c:=1 to LocationParUniqueReachesValue[Location] do begin

     temp:=false;
      for i:=1 to maxparameters do begin

       if LocationParUniqueReaches[Location][c][i]<>Pars[i] then temp:=true;

      end;

      if temp=false then begin

          answer:=false;

          if LocationParSuccessReachesFlags[Location][c] then
             IsSameParsPreviousReachSuccess:=true else
             IsSameParsPreviousReachSuccess:=false;

          goto done; end;
    end;

done:
    IsParReachUniqueForLocation:=answer;
end;

function Tform8.IsOneGatesPathes(firstpath,secondpath:integer):boolean;
label done;
var i,fmin,fmax,smin,smax:integer;
    answer:boolean;
begin
    answer:=true;

    if firstpath=secondpath then begin answer:=false; goto done; end;


    for i:=1 to maxparameters do begin

     fmin:=quest.pathes[firstpath].DPars[i].min;
     smin:=quest.pathes[secondpath].DPars[i].min;
     fmax:=quest.pathes[firstpath].DPars[i].max;
     smax:=quest.pathes[secondpath].DPars[i].max;

     if (fmin>smax) or (smin>fmax) then begin answer:=false; break; end;

    end;
done:
    IsOneGatesPathes:=answer;
end;

procedure Tform8.SeekOneQuestionPathes;
var i,c,xx,yy:integer;
    pathesVal:integer;
    lpathindexes: array [1..maxpathesfromonelocation] of integer;
begin
    with quest do begin
      for i:=1 to PathesValue do OneQuestionPathes[i]:=false;

      for i:=1 to LocationsValue do begin

          pathesVal:=0;

          for c:=1 to PathesValue do

            if Pathes[c].FromLocation=quest.Locations[i].LocationNumber
               then begin
               		inc(pathesVal);
                    lpathindexes[pathesval]:=c;
               end;

          for xx:=1 to pathesVal do
           for yy:=1 to pathesVal do begin
              if //IsOneGatesPathes(lpathindexes[xx],lpathindexes[yy]) and
                (
                 trim(pathes[lpathindexes[xx]].StartPathMessage.text)
                 =
                 trim(pathes[lpathindexes[yy]].StartPathMessage.text)
                 )and (xx<>yy)
                 //and
                // ( pathes[lpathindexes[xx]].ToLocation=pathes[lpathindexes[yy]].ToLocation
                // )
                 and
                 ( form2.CalculateNoStatisticsToolButton.Down
                   or
                  ((PathReaches[lpathindexes[xx]]>0)and(PathReaches[lpathindexes[yy]]>0))

                  )

               then begin
                  OneQuestionPathes[lpathindexes[xx]]:=true;
                  OneQuestionPathes[lpathindexes[yy]]:=true;
               end;
            end;
      end;
    end;
end;

procedure TForm8.UpdateForSuccessReaches;
var i:integer;
    AlreadyUpdated:array [1..maxlocations] of boolean;
begin
       for i:=1 to quest.LocationsValue do AlreadyUpdated[i]:=false;

       for i:=1 to LocationTraceLength do

       if not AlreadyUpdated[LocationTraceProtocol[i]] then begin
                       inc(SuccessReaches[LocationTraceProtocol[i]]);
                       AlreadyUpdated[LocationTraceProtocol[i]]:=true;
       end;
end;


procedure TForm8.UpdateForReaches;
var i:integer;
    AlreadyUpdated:array [1..maxlocations] of boolean;
begin
       for i:=1 to quest.LocationsValue do AlreadyUpdated[i]:=false;
       for i:=1 to LocationTraceLength do

       if not AlreadyUpdated[LocationTraceProtocol[i]] then begin
                       inc(LocationReaches[LocationTraceProtocol[i]]);
                       AlreadyUpdated[LocationTraceProtocol[i]]:=true;
       end;
end;

procedure TForm8.UpdatePathesForSuccessReaches;
var i:integer;
    AlreadyUpdated:array [1..maxpathes] of boolean;
begin
       for i:=1 to quest.PathesValue do AlreadyUpdated[i]:=false;

       for i:=1 to PathTraceLength do

         if not AlreadyUpdated[PathTraceProtocol[i]]  then begin

                       inc(PathSuccessReaches[PathTraceProtocol[i]]);
                       AlreadyUpdated[PathTraceProtocol[i]]:=true;
         end;
end;

procedure TForm8.UpdatePathesForReaches;
var i:integer;
    AlreadyUpdated:array [1..maxpathes] of boolean;
begin
       for i:=1 to quest.PathesValue do AlreadyUpdated[i]:=false;

       for i:=1 to PathTraceLength do

         if not AlreadyUpdated[PathTraceProtocol[i]]  then begin

                       inc(PathReaches[PathTraceProtocol[i]]);
                       AlreadyUpdated[PathTraceProtocol[i]]:=true;
         end;
end;
procedure TForm8.PushLocation(i:integer);
begin
       inc(LocationTraceLength);
       LocationTraceProtocol[LocationTraceLength]:=i;
end;

procedure Tform8.PopLocation;
begin
       dec(LocationTraceLength);
end;


procedure Tform8.PopPath;
begin
       dec(PathTraceLength);
end;

procedure TForm8.PushPath(i:integer);
begin
       inc(PathTraceLength);
       PathTraceProtocol[PathTraceLength]:=i;
end;


function TForm8.ArePathesStillFromHere(Location:integer):boolean;
label alldone;
var i:integer;
begin
        with quest.Locations[Location] do
        if EndLocationFlag or
           FailLocationFlag then  begin

        ArePathesStillFromHere:=true;
        goto alldone;
        end;

        if NeverHadPathesLocations[location] then begin

        ArePathesStillFromHere:=true;
        goto alldone;

        end;

        for i:=1 to quest.PathesValue do
        if PathesWeCanGo[Location][i]>=1 then begin ArePathesStillFromHere:=true;
                                                 goto alldone;
                                           end;
          ArePathesStillFromHere:=false;
alldone:
end;

function Tform8.NeverHadPathes(Location:integer):boolean;
var i:integer;
    yes:boolean;
begin
        yes:=true;
        for i:=1 to quest.PathesValue do

         if quest.Locations[Location].LocationNumber=quest.Pathes[i].FromLocation
            then begin

              yes:=false;
              break;
           end;
        NeverHadPathes:=yes;
end;

procedure Tform8.UnPrepareForTrace;
var i:integer;
begin
      for i:=1 to maxlocations do begin
                SetLength(LocationParUniqueReaches[i],0);
                SetLength(LocationParSuccessReachesFlags[i],0);
                LocationParUniqueReachesValue[i]:=0;
                 end;
      if StopCalculation=false then StatisticsCalculated:=true
                               else StatisticsCalculated:=false;

      StatisticsIsCalculating:=false;

      Form2.StatisticsTimer.Enabled:=false;
end;

procedure TForm8.PrepareForTrace(JustLoaded:boolean);
    var
        i,c,q:integer;

begin   //Инициализируем переменные-счетчики

        deep:=0;

        JustLoadedFlag:=JustLoaded;

        startlocation:=-1;
        allpathes:=0;
        successpathes:=0;
        successparpathes:=0;
        failpathes:=0;
        nopathways:=0;
        nopath2ways:=0;
        FailLocationsPathes:=0;

        CalculationBreak:=false;

        ProcessMessagesActivationCounter:=0;

        if Form2.CalculateRedusedStatisticsToolButton.Down then begin
          StatisticsCalculationStyleForm.CheckCalculationStyleRadioGroup.ItemIndex:=1;
          CalculateRedusedStatistics:=true;
        end
        else
        if Form2.CalculateFullStatisticsToolButton.Down then begin
          StatisticsCalculationStyleForm.CheckCalculationStyleRadioGroup.ItemIndex:=0;
          CalculateRedusedStatistics:=false;
        end
        else
        if Form2.CalculateNoStatisticsToolButton.Down then begin
          StatisticsCalculationStyleForm.CheckCalculationStyleRadioGroup.ItemIndex:=2;
        end;

        StopCalculation:=false;
        StatisticsCalculated:=false;
        StatisticsIsCalculating:=false;

        //Инициализируем массивы флагов и матрицу инцидентности

       for i:=1 to maxlocations do begin
                SetLength(LocationParUniqueReaches[i],0);
                SetLength(LocationParSuccessReachesFlags[i],0);
                LocationParUniqueReachesValue[i]:=0;
                end;

       for q:=1 to maxparameters do begin
         for i:=1 to quest.PathesValue do begin
              failpath[i]:=false;
              ParameterActivePathes[i][q]:=NoCriticalParType;
         end;

         for i:=1 to quest.LocationsValue do
              ParameterActiveLocations[i][q]:=NoCriticalParType;
       end;

        for i:=1 to quest.LocationsValue do begin
            finalflags[i]:=quest.Locations[i].EndLocationFlag;
            locationfailflags[i]:=quest.Locations[i].FailLocationFlag;
            neverhadpatheslocations[i]:=NeverHadPathes(i);
            closedlocations[i]:=true;
            noway2locations[i]:=false;
            LocationReaches[i]:=0;
            SuccessReaches[i]:=0;
           // WeWasHere[i]:=false;
            for c:=1 to maxparameters do begin
            	ParameterMins[i][c]:=nowayparameterflag;
            	ParameterMaxes[i][c]:=-nowayparameterflag;
            end;

        end;
        for i:=1 to quest.PathesValue do  begin
                PathReaches[i]:=0;
                PathSuccessReaches[i]:=0;
                PathToLocationIndexes[i]:=quest.GetLocationIndex(quest.pathes[i].ToLocation);
        end;
//Инициализируем матрицу переходов куда можно пойти
       for c:=1 to quest.PathesValue do begin
       		q:=quest.GetLocationIndex(quest.Pathes[c].FromLocation);
       		for i:=1 to quest.LocationsValue do  begin
         		if q=i then begin
         			if quest.Pathes[c].PassTimesValue=0 then PathesWeCanGo[i][c]:=2000000000
            		else PathesWeCanGo[i][c]:=quest.Pathes[c].PassTimesValue
         		end
         		else PathesWeCanGo[i][c]:=0;
        	end;
       end;
//
//Ищем стартовую локацию
		startlocationcount:=0;
        for i:=1 to quest.LocationsValue do
                if quest.Locations[i].StartLocationFlag then
                     begin inc(startlocationcount); startlocation:=i;  end;
LocationTraceLength:=0;
PathTraceLength:=0;
Form2.StatisticsTimer.Enabled:=true;
end;

function TForm8.IsGamePathParameterFail(Path:integer; var curpars,oldpars:TParValues):boolean;
label done;
   var i:integer;
       answer:boolean;
begin
      answer:=false;

      if path<=0 then goto done;

     with quest do begin
      for i:=1 to maxparameters do
      if (oldpars[i]<>curpars[i])and
      ((Pars[i].ParType=FailParType)or(Pars[i].ParType=DeathParType)) and
      (
        (
         (Pars[i].LoLimit)and
         (curpars[i]<=Pars[i].min)
        )
         or
        (
         (not Pars[i].LoLimit)and
         (curpars[i]>=Pars[i].max)
        )

      )
      then begin answer:=true; ParameterActivePathes[Path][i]:=FailParType; break; end;
     end;
done:
      IsGamePathParameterFail:=answer;
end;


function TForm8.IsGamePathParameterSuccess(Path:integer; var curpars,oldpars:TParValues):boolean;
label done;
var i:integer;
    answer:boolean;
begin
      answer:=false;

      if path<=0 then goto done;

     with quest do begin
      for i:=1 to maxparameters do

      if (oldpars[i]<>curpars[i])and
      ((Pars[i].ParType=SuccessParType)) and
      (
        ((Pars[i].LoLimit)and(curpars[i]<=Pars[i].min))
         or
        ((not Pars[i].LoLimit)and(curpars[i]>=Pars[i].max))
      )
      then begin answer:=true; ParameterActivePathes[Path][i]:=SuccessParType; break; end;
     end;
done:
      IsGamePathParameterSuccess:=answer;
end;

function TForm8.WeHaveSavingPath(Location:integer;var Pars:TParValues):boolean;
var answer:boolean;
    i:integer;
begin

    answer:=false;
  //  WeGoSavingPath:=false;
    for i:=1 to quest.PathesValue do begin

    if (PathesWeCanGo[Location][i]>=1) and (IsParametersGatesOk(pars,i))
      
      then begin
      //WeGoSavingPath:=true;
       answer:=true; break; end;

    end;

    WeHaveSavingPath:=answer;
end;

function TForm8.IsGameLocationParameterFail(Location:integer;var curpars,oldpars:TParValues):boolean;
   var i:integer;
    answer:boolean;
begin
      answer:=false;
    with quest do begin
      for i:=1 to maxparameters do
      if (oldpars[i]<>curpars[i])and (not WeHaveSavingPath(Location,curpars))and //(not WeGoSavingPath)and
      ((Pars[i].ParType=FailParType)or(Pars[i].ParType=DeathParType)) and
      (
        (
         (Pars[i].LoLimit)and
         (curpars[i]<=Pars[i].min)

         )
         or
        (
         (not Pars[i].LoLimit)and
         (curpars[i]>=Pars[i].max)
        )
      )
      then begin answer:=true; ParameterActiveLocations[Location][i]:=FailParType; break; end;
    end;
      IsGameLocationParameterFail:=answer;
end;

function TForm8.IsGameLocationParameterSuccess(Location:integer;var curpars,oldpars:TParValues):boolean;
var i:integer;
    answer:boolean;
begin
      answer:=false;
    with quest do begin
      for i:=1 to maxparameters do
      if (oldpars[i]<>curpars[i])and
      ((Pars[i].ParType=SuccessParType)) and
      (
        ((Pars[i].LoLimit)and(curpars[i]<=Pars[i].min))
         or
        ((not Pars[i].LoLimit)and(curpars[i]>=Pars[i].max))
      )
      then begin answer:=true; ParameterActiveLocations[Location][i]:=SuccessParType; break; end;
    end;
      IsGameLocationParameterSuccess:=answer;
end;

function TForm8.IsParametersGatesOk(var pars:TParValues; pathindex:integer):boolean;
var i:integer;
    answer:boolean;
	parse:TCalcParse;
begin
    answer:=true;
    with quest.Pathes[pathindex] do begin
       if trim(LogicExpression.Text)<>'' then begin
            parse:=TCalcParse.Create;
         	parse.AssignAndPreprocess(LogicExpression.Text,1); // i - не имееет значения
            if not parse.error then parse.Parse(CalcParseClass.TParValues(pars));
            if (not parse.calc_error)and(parse.answer=0) then begin
            	answer:=false;
            end;
            parse.Destroy;
       end;
       for i:=1 to maxparameters do begin
        if quest.Pars[i].Enabled then begin
         if pars[i]>DPars[i].max then begin answer:=false; break; end;
         if pars[i]<DPars[i].min then begin answer:=false; break; end;
         if not IsParametersBitmaskOk(pars[i],DPars[i].bitmask) then
           begin
               answer:=false;
               break;
           end;
         if not IsValueGatesOk(pars[i],DPars[i].ValuesGate) then
           begin
               answer:=false;
               break;
           end;
         if not IsModZeroeGatesOk(pars[i],DPars[i].ModZeroesGate) then
           begin
               answer:=false;
               break;
           end;

        end;
      end;
    end;
    IsParametersGatesOk:=answer;
end;


function Tform8.IsParametersBitmaskOk(parametervalue, bitmask:integer):boolean;
label done;
var answer:boolean;
    c:integer;
begin
    answer:=true;

    for c:=1 to 9 do begin

       if ((parametervalue and 1)=0) and ((bitmask and 1)=1) then begin

         answer:=false;
         goto done;
       end;

       parametervalue:=parametervalue shr 1;
       bitmask:=bitmask shr 1;

    end;

done:
   IsParametersBitmaskOk:=answer;
end;


function Tform8.IsValueGatesOk(parametervalue:integer;valuegate:TValuesList):boolean;
var i:integer;
    answer:boolean;
begin

    if not valuegate.Negation then begin

     answer:=true;
     for i:=1 to valuegate.Count do begin

        if valuegate.Values[i]=parametervalue then begin answer:=false;
                                                          break;
        end;

     end;
    end
    else begin

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

function Tform8.IsModZeroeGatesOk(parametervalue:integer;valuegate:TValuesList):boolean;
var i:integer;
    answer:boolean;
begin

    if not valuegate.Negation then begin

     answer:=true;
     for i:=1 to valuegate.Count do begin

        if (parametervalue mod valuegate.Values[i])=0 then begin answer:=false;
                                                          break;
        end;

     end;
    end
    else begin

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


procedure TForm8.ProcessParametersWithDelta(var pars:TParValues;var delta:TParameterDeltas);
var i:integer;
	parse:TCalcParse;
    tstr:string;
    tpars:TParValues;
begin
    for i:=1 to maxparameters do begin
      	if Quest.Pars[i].Enabled then begin
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
            if tpars[i]>Quest.Pars[i].max then tpars[i]:=Quest.Pars[i].max;
            if tpars[i]<Quest.Pars[i].min then tpars[i]:=Quest.Pars[i].min;
       	end;
    end;
    for i:=1 to maxparameters do begin
        if Quest.Pars[i].Enabled then begin
            pars[i]:=tpars[i];
       end;
    end;
end;

procedure Tform8.UpDateParMinMax(InTheLocation:boolean;Location:integer; var pars:TParValues);
var i:integer;
begin
        for i:=1 to maxparameters do begin

        if ParameterMins[Location][i]>pars[i] then ParameterMins[Location][i]:=pars[i];
        if ParameterMaxes[Location][i]<pars[i] then ParameterMaxes[Location][i]:=pars[i];

        end;
end;

procedure TForm8.TraceQuest(Location,pathindex:integer; pars,oldpars:TParValues);
label done;
        var i,q,newlocation:integer;

        nowayflag,noway2flag:boolean;
        failflag,successflag:boolean;
        tempflag:boolean;
        tpars:TParValues;
        delta:TParameterDeltas;
begin
       inc(deep);
       if deep>500 then goto done;
        //TODO Make function working
        StatisticsIsCalculating:=true;

        if ProcessMessagesActivationCounter>10000 then begin

                                Application.ProcessMessages;
                                ProcessMessagesActivationCounter:=0;
        end
        else inc(ProcessMessagesActivationCounter);

        if  CalculationBreak then begin

          if JustLoadedFlag then begin
             Form8.StopCalculation:=true;
             Form2.CalculateNoStatisticsToolButton.Down:=true;
          end
          else begin

            StatisticsCalculationStyleForm.ShowModal;
            CalculationBreak:=false;
          end;
        end;

        if StopCalculation then goto done;

        nowayflag:=true;
        noway2flag:=true;
        successflag:=false;

        PushLocation(Location);

        failflag:=IsGamePathParameterFail(pathindex,pars,oldpars);
        if not failflag then
                successflag:=IsGamePathParameterSuccess(pathindex,pars,oldpars);

   if failflag then begin inc(allpathes);
                          inc(failpathes);
                              PopLocation;
                              UpdateForReaches;
                              UpdatePathesForReaches;
                              goto done;
                             end
   else if successflag then begin
                             inc(successparpathes);
                             inc(allpathes);
                             UpDatePathesForSuccessReaches;
                             UpdatePathesForReaches;
                              PopLocation;
                             UpdateForSuccessReaches;
                             UpdateForReaches;
                              goto done;
                       end;

        closedlocations[Location]:=false;

// Обрабатываем локацию
        for q:=1 to maxparameters do delta[q]:=quest.Locations[Location].Dpars[q];


        ProcessParametersWithDelta(pars,delta);

        failflag:=IsGameLocationParameterFail(Location,pars,oldpars);

        if not failflag then
                successflag:=IsGameLocationParameterSuccess(Location,pars,oldpars);

        UpDateParMinMax(true,Location, pars);

         if failflag then begin inc(allpathes);
                                inc(failpathes);
                                UpdateForReaches;
                                UpdatePathesForReaches;
                                PopLocation;
                                goto done;
                          end
         else if successflag then begin
                             inc(successparpathes);
                             inc(allpathes);
                             UpDatePathesForSuccessReaches;
                             UpdatePathesForReaches;
                             UpdateForSuccessReaches;
                             UpdateForReaches;
                             PopLocation;
                             goto done;
          end;


       if finalflags[Location] then begin inc(allpathes);
                                          inc(successpathes);
                                          UpdateForSuccessReaches;
                                          UpdateForReaches;
                                          UpDatePathesForSuccessReaches;
                                          UpDatePathesForReaches;
                                          PopLocation;
                                          goto done;
                                     end;

       if locationfailflags[Location] then begin
                                            failpath[pathindex]:=true;
                                            inc(allpathes);
                                            inc(FailLocationsPathes);
                                            UpdateForReaches;
                                            UpDatePathesForReaches;
                                            PopLocation;
                                            goto done;
        end;

    if NeverHadPathes(Location) then begin
                              inc(allpathes);
                              inc(nopathways);
                              UpdateForReaches;
                              UpdatePathesForReaches;
                              PopLocation;
                              goto done;
    end;



    if  (CalculateRedusedStatistics)
         and
        (Not IsParReachUniqueForLocation(Location,pars)) then begin

                              inc(allpathes);
                              if IsSameParsPreviousReachSuccess then begin
                                 inc(successpathes);
                                 UpdateForSuccessReaches;
                                 UpdatePathesForSuccessReaches;
                              end;
                              UpdateForReaches;
                              UpdatePathesForReaches;
                              PopLocation;
                              goto done;

    end;

     tempflag:=false;
     if (SuccessReaches[Location]>0) or (SuccessReaches[Location]>0) then tempflag:=true;
     if CalculateRedusedStatistics then AddUniqueLocationParReach(Location,pars,tempflag);

     for i:=1 to quest.PathesValue do begin

        newlocation:=PathToLocationIndexes[i];
        if (PathesWeCanGo[Location][i]>=1) and
           (ArePathesStillFromHere(newlocation))

           then begin

          nowayflag:=false;

        if IsParametersGatesOk(pars,i) then begin


           noway2flag:=false;

                for q:=1 to maxparameters do delta[q]:=quest.pathes[i].Dpars[q];
                for q:=1 to maxparameters do tpars[q]:=pars[q];
                ProcessParametersWithDelta(tpars,delta);


                PushPath(i);
                dec(PathesWeCanGo[Location][i]);//:=false;

                 TraceQuest(newlocation,i,tpars,pars);

                inc(PathesWeCanGo[Location][i]);//:=true;
                PopPath;

        end;  //gates ok

           end;  //patheswecango

      end;  //for i to locationswalue


      if nowayflag then begin inc(allpathes);
                              inc(nopath2ways);
                              noway2locations[location]:=true;//false;
                              UpdateForReaches;
                              UpdatePathesForReaches;
                        end
      else
      if noway2flag then begin inc(allpathes);
                               inc(nopath2ways);
                               noway2locations[location]:=true;
                               UpdatePathesForReaches;
                               UpdateForReaches;
                        end;
    PopLocation;
 done:
    dec(deep);
end;


procedure TForm8.CloseButtonClick(Sender: TObject);
begin
Close;
end;

procedure TForm8.FormShow(Sender: TObject);
  var i:integer;
      UnPathablePathes:integer;
      MyFailLocationsPathes:integer;
      EasyLevel:integer;
      pars:TParValues;
      temp1,temp2,temp:widestring;
begin

 LocationsAtAll.Caption:=inttostr(quest.LocationsValue);
 PathesAtAll.Caption:=inttostr(quest.PathesValue);

 PrepareForTRace(false);

    if Form2.CalculateRedusedStatisticsToolButton.Down then begin

       InGeneralLabel.Caption:='';
       AllPathesValue.Caption:='-';
       FailPathesValue.Caption:='-';
       SuccessPathesValue.Caption:='-';
       SuccessParPathesValue.Caption:='-';
       FailLocationPathesValue.Caption:='-';
       NoPathWayValue.Caption:='-';
       NoPathWay2Value.Caption:='';
       WeHaveUnPathablePathes.Caption:='';
       Exit;
     end;
     if Form2.CalculateNoStatisticsToolButton.Down then begin

       InGeneralLabel.Caption:='';
       AllPathesValue.Caption:='-';
       FailPathesValue.Caption:='-';
       SuccessPathesValue.Caption:='-';
       SuccessParPathesValue.Caption:='-';
       FailLocationPathesValue.Caption:='-';
       NoPathWayValue.Caption:='-';
       NoPathWay2Value.Caption:='';
       WeHaveUnPathablePathes.Caption:='';
       Exit;
     end;


 EasyLevel:=0;
  for i:=1 to maxparameters do pars[i]:=quest.pars[i].value;

   //Вызываем трасировку квеста
     if startlocationcount=1 then begin

           Form8.TraceQuest(startlocation,0,
                                StatisticsForm.TParValues(pars),
                                StatisticsForm.TParValues(pars)
                                                        );


 SeekOneQuestionPathes;


 MyFailLocationsPathes:=0;
 for i:=1 to quest.PathesValue do if failpath[i] then inc(MyFailLocationsPathes);

 UnPathablePathes:=0;
 for i:=1 to quest.PathesValue do if PathReaches[i]=0 then inc(UnPathablePathes);

 EasyLevel:=trunc(100*(successpathes+successparpathes)
                       /
                      (allpathes-FailLocationsPathes+MyFailLocationsPathes)
                  );


 AllPathesValue.Caption:=inttostr(allpathes);

 FailPathesValue.Caption:=inttostr(failpathes)  +
                          ' ( ' + inttostr(trunc(100*(failpathes/allpathes))) +' % )';

 SuccessPathesValue.Caption:=inttostr(successpathes)  +
                          ' ( ' + inttostr(trunc(100*(successpathes/allpathes))) +' % )';

 SuccessParPathesValue.Caption:=inttostr(successparpathes)  +
                          ' ( ' + inttostr(trunc(100*(successparpathes/allpathes))) +' % )';

 FailLocationPathesValue.Caption:=inttostr(FailLocationsPathes)  +
                          ' ( ' + inttostr(trunc(100*(FailLocationsPathes/allpathes))) +' % )';


  temp:='';
  if nopathways=0 then NoPathWayValue.Caption:='Тупиковых локаций нет'
  else begin
  NoPathWayValue.Caption:='Внимание! Существуют тупиковые локации!';
  temp:='Прежде чем говорить о квесте нужно устранить вышеуказанные проблемы';
  end;

  if nopath2ways=0 then NoPathWay2Value.Caption:='Безвыходных ситуаций нет'
  else
   begin
    NoPathWay2Value.Caption:='Внимание! Существуют безвыходные ситуации!';
    temp:='Прежде чем говорить о квесте нужно устранить вышеуказанные проблемы';
   end;

  if UnPathablePathes=0 then WeHaveUnPathablePathes.Caption:='Непроходимых переходов нет'
  else
   begin
    WeHaveUnPathablePathes.Caption:='Внимание! Существуют непроходимые переходы!';
    temp:='Прежде чем говорить о квесте нужно устранить вышеуказанные проблемы';
   end;

  if temp='' then begin

        case quest.PathesValue of

        0..19 : temp1:='очень маленький';
        20..39 : temp1:='маленький';
        40..59 : temp1:='средний';
        60..79 : temp1:='большой';

         else temp1:='очень большой';
        end;

        case trunc(EasyLevel) of

        51..100 : temp2:='можно с легкостью';
        31..50 : temp2:='довольно легко';
        21..30 : temp2:='можно без проблем';
        6..20 : temp2:='трудно';
        0..5 : temp2:='очень трудно';
        end;

        if  (successpathes+successparpathes)=0 then  temp2:='невозможно';
  end;

      end
     else begin

        AllPathesValue.Caption:='0 ';
        FailPathesValue.Caption:='0 ( 0% )';
        SuccessPathesValue.Caption:='0 ( 0% )';
        SuccessParPathesValue.Caption:='0 ( 0% )';
        FailLocationPathesValue.Caption:='0 ( 0% )';
        NoPathWayValue.Caption:='Тупиковых локаций нет';
        NoPathWay2Value.Caption:='Безвыходных ситуаций нет';
        WeHaveUnPathablePathes.Caption:='Непроходимых переходов нет';

        temp:='Квест нерабочий';
     end;

     if temp='' then

     InGeneralLabel.Caption:='Выводы:'+#13#10
                               +'О квесте можно сказать, что его размер '
                               + temp1
                               + '. Пройти данный квест '
                               + temp2 +','
                               +' т.к. его сложность составляет '+inttostr(100-easylevel)+'%.'
      else
     InGeneralLabel.Caption:='Выводы:'+#13#10
                               +temp+'.';


     UnPrepareForTrace;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
quest:=TGame.Create(nil);
StatisticsIsCalculating:=false;
end;

end.
