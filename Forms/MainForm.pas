unit MainForm;
            
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Math,
  StatisticsForm,
  ColorOptionsForm,
  GameContent,
  LocationClass,
  ParameterClass,
  CalcParseClass,
  PathClass,
  TextFieldClass,
  LocationEditForm,
  PathEditForm,
  MainPropertiesEdit,
  SearchForm,
  PlayForm,
  StatisticsCalculationStyle,
  // AboutForm,
  StdCtrls, ComCtrls, ToolWin, ImgList, EC_BlockPar, MessageText, ExtCtrls,
  XPMan;

const
  EM_Undefined=0;
  EM_NewLocation=1;
  EM_NewPath=3;
  EM_MoveLocation=5;
  EM_DeleteLocationOrPath=6;

  UndoMax=20;

  EditorConfFile='conf.bin';

  LineDrawGradient=13;
  StatusPanelD=100;
  MinDistToForm=20;
  maxstatuspanellabels=100;

type PM=^TBlockParEC;

type TParValues=array [1..maxparameters] of integer;

type
  TForm2 = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ToolBar1: TToolBar;
    NewGameButton: TToolButton;
    ButtonsImageList: TImageList;
    LoadGameButton: TToolButton;
    SaveGameButton: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    PlayButton: TToolButton;
    ToolButton13: TToolButton;
    ToolButton1: TToolButton;
    UndoButton: TToolButton;
    RedoButton: TToolButton;
    ToolButton11: TToolButton;
    ColorOptionsButton: TToolButton;
    StatisticsButton: TToolButton;
    ToolButton14: TToolButton;
    CalculateFullStatisticsToolButton: TToolButton;
    ToolButton15: TToolButton;
    FreeScrollButton: TToolButton;
    FontDialog1: TFontDialog;
    ToolButton8: TToolButton;
    StatusPanel: TPanel;
    StatisticsTimer: TTimer;
    CalculateRedusedStatisticsToolButton: TToolButton;
    CalculateNoStatisticsToolButton: TToolButton;
    ScrollTimer: TTimer;
    ToolButton7: TToolButton;
    NavigateToolButton: TToolButton;
    XPManifest1: TXPManifest;

    procedure FormCreate(Sender: TObject);
    procedure NewGameButtonClick(Sender: TObject);
    procedure LoadGameButtonClick(Sender: TObject);
    procedure SaveGameButtonClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure CheckCoordsDist(var x,y:integer; i:integer);
    procedure FindFreeLocationPlace(var x,y,i:integer);


    procedure DrawLine(out path:tpath; selected,void,oneQuestion:boolean);
    procedure DrawPath(path_index:integer;selected,nosuccessways,noways:boolean);

    procedure DrawLocation(x,y:integer; selected,closed,noway2,nosuccway,faillocation,nomean, void:boolean);
    procedure ToolButton9Click(Sender: TObject);

    procedure ProcessRightClick;
    procedure ProcessEnabledControls;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure AboutButtonClick(Sender: TObject);
    procedure PlayButtonClick(Sender: TObject);

    procedure ClearDo;
    procedure MakeDo;
    procedure MakeUndo;
    procedure MakeRedo;
    procedure UndoButtonClick(Sender: TObject);
    procedure RedoButtonClick(Sender: TObject);

    procedure SaveEditorOptions(s:string);
    procedure LoadEditorOptions;
    procedure SetDefaultEditorOptions;
    procedure ColorOptionsButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);

    procedure NiceRepaint;
    procedure FormShow(Sender: TObject);
    procedure StatisticsButtonClick(Sender: TObject);
    procedure FinePositionLocations;

    procedure PositionLocationsAfterLOad;

    function ThereAlreadyIsLocation(x,y:integer):boolean;

    procedure TraceForClosedLocations;
    procedure CalculateFullStatisticsToolButtonClick(Sender: TObject);

    procedure ClearStatusPanel;
    procedure AddDoubleStroke (strl,strr:Widestring; lcolor:Tcolor);
    procedure AddSingleStroke (str:Widestring; lcolor:Tcolor);
    procedure SetStatusPanelPosition(x,y:integer);
    procedure AddSeparator;

    procedure PrintLocationStatistics(LocationIndex:integer);
    procedure PrintPathStatistics(PathIndex:integer);

    function myinttostr(i:integer):string;
    function IsStatisticsCalculating:boolean;

    procedure NavigateTo(x:integer;y:integer);

    function GetDMousex(mx:integer):integer; //получить x-координату мыши со смещением
    function GetDMousey(my:integer):integer; //получить y-координату мыши со смещением
    function GetMaxNDX:integer;// получить максимальное количество колонок
    function GetMaxNDY:integer;// получить максимальное количество рядов
    function GetMaxEDX:integer;// получить максимальное количество колонок несвободного скроллинга
    function GetMaxEDY:integer;// получить максимальное количество колонок несвободного скроллинга

    function InScreen(x,y:integer):boolean; // находится ли точка квеста в рабочей области

    procedure ChooseFont;

    procedure StatusPanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure StatisticsTimerTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CalculateRedusedStatisticsToolButtonClick(Sender: TObject);
    procedure CalculateNoStatisticsToolButtonClick(Sender: TObject);
    procedure ScrollTimerTimer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure NewGameButtonMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure LoadGameButtonMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure SaveGameButtonMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ToolButton3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure UndoButtonMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RedoButtonMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton14MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure StatisticsButtonMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton15MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CalculateFullStatisticsToolButtonMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure CalculateRedusedStatisticsToolButtonMouseMove(
      Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure CalculateNoStatisticsToolButtonMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PlayButtonMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton13MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ColorOptionsButtonMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton11MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FreeScrollButtonMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FreeScrollButtonClick(Sender: TObject);
    procedure NavigateToolButtonClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    M:PM;
    DrawBuffer:TBitmap;

    JustLoaded:boolean;

    ConfigFilePath:string;
    TgeDir:string;

    LocationSelectedIndex:integer;
    PathSelectedIndex:integer;

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
    NoWay2Color:Tcolor;
    NoSuccessWaysColor:TColor;
    OneQuestionColor:TColor;
    PathHelpPanelColor:TColor;
    LocationHelpPanelColor:TColor;
    AbsPathColor:TColor;
    NotAbsPathColor:TColor;
    SameQNoDescrStartColor:TColor;
    SameQNoDescrEndColor:TColor;
    SameQDescrStartColor:TColor;
    SameQDescrEndColor:TColor;

    VoidObjectColor:TColor;
    VoidObjectStartColor:TColor;


    DrawPathType:integer;
    ParNameHelpPanelType:integer;

    StatisticsCalculationTimerDelay:integer;

    StatusPanelSflag:boolean;
    SPN:integer;

    Game: TGame;  // Данные квеста
  //  tempgame: TGame;

    UndoArray:array [0..UndoMax-1] of TGame;
    UndoStart:integer;
    UndoPos:integer;
    UndoEnd:integer;

    EditMode:integer;
    MouseDownCoords:TPoint;
    MouseLeftPressed:boolean;
    MouseUpCoords:TPoint;

    //Панель подсказки

        ParentWidth:integer;
        ParentHeight:integer;

        TopPrint:integer;
        Border:integer;
        StdLabelWidth:integer;

        Labels:array [1..maxstatuspanellabels] of TLabel;

        LoadingData:boolean;
        ActiveLabelsValue:integer;
   //
		ReSetPath:integer;
		NeedToSaveChanges:boolean;
		ShiftPressed:boolean;

        OnNiceRepaintFlag:boolean;
        ActiveChildsCount:integer;
        ClientMouseX,ClientMouseY:integer;
        ScrollDelay:integer; //Задержка сктроллинга

        ndx:integer; //смещение по х в колонках левого верхнего угла экрана
        ndy:integer; //смещение по у в рядах левого верхнего угла экрана
        maxedx:integer;
        maxedy:integer;
  end;

var
  Form2: TForm2;

implementation

// uses AboutForm;

{$R *.DFM}


procedure TForm2.ChooseFont;
begin
	FontDialog1.Options := [fdLimitSize,fdEffects];
	FontDialog1.MaxFontSize := 8;
	FontDialog1.MinFontSize := 16;
    inc(ActiveChildsCount);
	if FontDialog1.Execute then begin
    	Form1.Font := FontDialog1.Font;
    	Form2.Font := FontDialog1.Font;
    	Form3.Font := FontDialog1.Font;
    	Form4.Font := FontDialog1.Font;
    	// Form5.Font := FontDialog1.Font;
    	Form6.Font := FontDialog1.Font;
    	Form7.Font := FontDialog1.Font;
    	Form8.Font := FontDialog1.Font;
    end;
    dec(ActiveChildsCount);
end;

procedure TForm2.NavigateTo(x:integer;y:integer);
var new_ndx,new_ndy:integer;
	gx,gy:integer;
	ss:TShiftState;
begin
	new_ndx:=x div trunc(ClientWidth/Game.BlockXgradient)-Game.BlockXgradient div 2;
	new_ndy:=y div trunc(ClientHeight/Game.BlockXgradient)-Game.BlockXgradient div 2;
    if new_ndy<0 then new_ndy:=0;
    if new_ndx<0 then new_ndx:=0;
    if ((new_ndx<>ndx)or(new_ndy<>ndy))and not InScreen(x,y) then begin
    	ndx:=new_ndx;
        ndy:=new_ndy;
    end;
    ss:=[];
	x:=x-(ClientWidth div Game.BlockXgradient)*ndx;
 	y:=y-(ClientHeight div Game.BlockYgradient)*ndy;

    gx:=x+3+Form2.Left;
    gy:=y+22+Form2.Top;
    SetCursorPos(gx,gy);

    if (gx>LPSearchForm.Left)and(gx<LPSearchForm.Left+LPSearchForm.Width)
    	and
    	(gy>LPSearchForm.Top)and(gy<LPSearchForm.Top+LPSearchForm.Height)then begin
         if ((gy-LPSearchForm.Height-20)>Form2.Top) then begin
         	LPSearchForm.Top:=LPSearchForm.Top-LPSearchForm.Height-20;
         end else begin
         	LPSearchForm.Top:=LPSearchForm.Top+LPSearchForm.Height+20;
         end;
    end;

    Form2.MouseMove(ss,x,y);
end;

function TForm2.InScreen(x,y:integer):boolean; // находится ли точка квеста в рабочей области
var zx,zy:integer;
begin
	zx:=x-ndx*(ClientWidth div Game.BlockXGradient);
	zy:=y-ndy*(ClientHeight div Game.BlockYGradient);
	if (zx>=ClientWidth)or(zx<0)or(zy>=ClientHeight)or(zy<0) then  begin
       InScreen:=false;
    end else begin
       InScreen:=true;
    end;
end;

function TForm2.GetDMousex(mx:integer):integer; //получить x-координату мыши со смещением
begin
//
	GetDMousex:=(ClientWidth div Game.BlockXgradient)*ndx+mx;
end;

function TForm2.GetDMousey(my:integer):integer; //получить y-координату мыши со смещением
begin
//
	GetDMousey:=(ClientHeight div Game.BlockYgradient)*ndy+my;
end;

function TForm2.GetMaxNDX:integer;// получить максимальное количество колонок
begin
//
	GetMaxNDX:=Game.BlockXgradient*scrxmaxvalue;
end;

function TForm2.GetMaxNDY:integer;// получить максимальное количество рядов
begin
//
	GetMaxNDY:=Game.BlockYgradient*scrymaxvalue;
end;

function TForm2.GetMaxEDX:integer;// получить максимальное количество колонок несвободного скроллинга
var found,i:integer;
begin
	found:=0;
    with Game do begin
        for i:=1 to LocationsValue do begin
    		if Locations[i].screenx>found then found:=Locations[i].screenx;
        end;
    	GetMaxEDX:=found div (ClientWidth div BlockXGradient)+1;
    end;
end;

function TForm2.GetMaxEDY:integer;// получить максимальное количество колонок несвободного скроллинга
var found,i:integer;
begin
	found:=0;
    with Game do begin
        for i:=1 to LocationsValue do begin
    		if Locations[i].screeny>found then found:=Locations[i].screeny;
        end;
    	GetMaxEDY:=found div (ClientHeight div BlockYGradient)+1;
    end;
end;

function TForm2.IsStatisticsCalculating:boolean;
var answer:boolean;
begin
        answer:=false;
        if Form8.StatisticsIsCalculating then begin
              answer:=true;
              ShowMessage('Это действие невозможно совершить во время счета статистики!');
        end;

      IsStatisticsCalculating:=answer;
end;

function TForm2.myinttostr(i:integer):string;
var c,q:integer;
    tempstr,strvalue:string;
begin
      tempstr:='';
      strvalue:=inttostr(i);

      q:=length(strvalue);
      if q mod 3 = 2 then strvalue:=' '+strvalue;
      if q mod 3 = 1 then strvalue:='  '+strvalue;
      q:=length(strvalue);

      for c:=1 to q do begin

      tempstr:=tempstr+strvalue[c];
      if (c mod 3 = 0) and (c<>q) then tempstr:=tempstr+'.';
      
      end;

      myinttostr:=trim(tempstr);
end;

procedure Tform2.AddSeparator;
begin
 AddSingleStroke('------------------------------------------------------------------------',
        clTeal);
end;

procedure Tform2.ClearStatusPanel;
var i:integer;
begin
      StatusPanel.Visible:=false;
      StdLabelWidth:=215;
      Border:=7;
      topprint:=border;
      for i:=1 to maxstatuspanellabels do begin
                Labels[i].Visible:=false;
                Labels[i].transparent:=true;
                Labels[i].Caption:='';
                Labels[i].WordWrap:=true;
                Labels[i].Autosize:=false;
                Labels[i].Left:=border;
                Labels[i].width:=StdLabelWidth;
      end;
      ActiveLabelsValue:=0;

      StatusPanel.Height:=topprint+border;
      StatusPanel.Width:=230;
end;

Procedure Tform2.SetStatusPanelPosition(x,y:integer);
	Procedure FloatPosition;
	begin
		if (x+StatusPanel.Width+StatusPanelD)>ClientWidth
    	then StatusPanel.left:=x-StatusPanel.Width-StatusPanelD
		else StatusPanel.left:=x+StatusPanelD;
   		if (y+StatusPanel.Height+ToolBar1.Height+StatusPanelD)>ClientHeight
    	then StatusPanel.top:=y-StatusPanel.Height-StatusPanelD
		else StatusPanel.top:=y+StatusPanelD;
        if StatusPanel.top<0 then StatusPanel.top:=MinDistToForm;
        if StatusPanel.top+StatusPanel.Height>ClientHeight then StatusPanel.top:=ClientHeight-MinDistToForm-StatusPanel.Height;
	end;

begin
	case StatusPanelSflag of
        True: begin
//            StatusPanel.left:=Form7.StatusPanelX.Value;
  //          StatusPanel.top:=Form7.StatusPanelY.Value;
  			case SPN of
            	0: begin
                	StatusPanel.left:=MinDistToForm;
		            StatusPanel.top:=MinDistToForm;
                end;
                1: begin
                	StatusPanel.left:=MinDistToForm;
            		StatusPanel.top:=ClientHeight div 2 - StatusPanel.Height div 2;
                end;
                2: begin
                	StatusPanel.left:=MinDistToForm;
            		StatusPanel.top:=ClientHeight-StatusPanel.Height-MinDistToForm;
                end;
            	3: begin
                	StatusPanel.left:=ClientWidth div 2 - StatusPanel.Width div 2;
		            StatusPanel.top:=MinDistToForm;
                end;
                4: begin
                	StatusPanel.left:=ClientWidth div 2 - StatusPanel.Width div 2;
            		StatusPanel.top:=ClientHeight div 2 - StatusPanel.Height div 2;
                end;
                5: begin
                	StatusPanel.left:=ClientWidth div 2 - StatusPanel.Width div 2;
            		StatusPanel.top:=ClientHeight-StatusPanel.Height-MinDistToForm;
                end;
            	6: begin
                	StatusPanel.left:=ClientWidth-StatusPanel.Width-MinDistToForm;
		            StatusPanel.top:=MinDistToForm;
                end;
                7: begin
                	StatusPanel.left:=ClientWidth-StatusPanel.Width-MinDistToForm;
            		StatusPanel.top:=ClientHeight div 2 - StatusPanel.Height div 2;
                end;
                8: begin
                	StatusPanel.left:=ClientWidth-StatusPanel.Width-MinDistToForm;
            		StatusPanel.top:=ClientHeight-StatusPanel.Height-MinDistToForm;
                end;
            end;
        end;
    	False: begin
  			case SPN of
            	0: begin
                	StatusPanel.left:=x-StatusPanel.Width-StatusPanelD;
                    StatusPanel.top:=y-StatusPanel.Height-StatusPanelD;
                end;
                1: begin
                	StatusPanel.left:=x-StatusPanel.Width-StatusPanelD;
                    StatusPanel.top:=y - StatusPanel.Height div 2;
                end;
                2: begin
                	StatusPanel.left:=x-StatusPanel.Width-StatusPanelD;
                    StatusPanel.top:=y + StatusPanel.Height div 2;
                end;
            	3: begin
                	StatusPanel.left:=x- StatusPanel.Width div 2;
                    StatusPanel.top:=y-StatusPanel.Height-StatusPanelD;
                end;
                4: begin
                	StatusPanel.left:=x - StatusPanel.Width div 2;
                    StatusPanel.top:=y - StatusPanel.Height div 2;
                end;
                5: begin
                	StatusPanel.left:=x- StatusPanel.Width div 2;
                    StatusPanel.top:=y + StatusPanel.Height div 2;
                end;
            	6: begin
                	StatusPanel.left:=x + StatusPanel.Width div 2;
                    StatusPanel.top:=y-StatusPanel.Height-StatusPanelD;
                end;
                7: begin
                	StatusPanel.left:=x + StatusPanel.Width div 2;
                    StatusPanel.top:=y - StatusPanel.Height div 2;
                end;
                8: begin
                	StatusPanel.left:=x + StatusPanel.Width div 2;
                    StatusPanel.top:=y + StatusPanel.Height div 2;
                end;
            end;
        end;
    end;
    if (x>=StatusPanel.left) and (x<=StatusPanel.left+StatusPanel.Width) and (y>=StatusPanel.top) and (y<=StatusPanel.top+StatusPanel.Height) then FloatPosition;
    if (StatusPanel.left<0) or (StatusPanel.left+StatusPanel.Width>ClientWidth) or (StatusPanel.top<0) or (StatusPanel.top+StatusPanel.Height>ClientHeight) then FloatPosition;
end;

procedure Tform2.AddDoubleStroke (strl,strr:Widestring; lcolor:Tcolor);
var tstrr:string;
	tstrl:string;
    i,c:integer;
begin
		inc(ActiveLabelsValue);
        Labels[ActiveLabelsValue].WordWrap:=false;
        Labels[ActiveLabelsValue].top:=Topprint;
        Labels[ActiveLabelsValue].Alignment:=tarightjustify;
        Labels[ActiveLabelsValue].font.color:=lcolor;

        inc(ActiveLabelsValue);
        Labels[ActiveLabelsValue].WordWrap:=false;
        Labels[ActiveLabelsValue].top:=Topprint;
        Labels[ActiveLabelsValue].Alignment:=taleftjustify;
        Labels[ActiveLabelsValue].font.color:=lcolor;

        tstrl:='';
        i:=1;
        while (i<6)and(i<=length(strl)) do begin
        	tstrl:=tstrl+strl[i];
            inc(i);
        end;

		tstrr:='';
        c:=length(strr);
        while (c>0)
        		and
                (
					(StdLabelWidth)
                    >
                    (10+
                    	Labels[ActiveLabelsValue].Canvas.TextExtent(tstrr).cx
                    	+
                        Labels[ActiveLabelsValue-1].Canvas.TextExtent(tstrl).cx
                    )
        		) do begin

        	tstrr:=strr[c]+tstrr;
            dec(c);
        end;

        c:=6;
        while (c<=length(strl))
        		and
                (
					(StdLabelWidth)
                    >
                    (10+
                    	Labels[ActiveLabelsValue].Canvas.TextExtent(tstrr).cx
                    	+
                        Labels[ActiveLabelsValue-1].Canvas.TextExtent(tstrl).cx
                    )
        		) do begin

        	tstrl:=tstrl+strl[c];
            inc(c);
        end;

        Labels[ActiveLabelsValue-1].caption:=tstrr;
        Labels[ActiveLabelsValue].caption:=tstrl;

        Labels[ActiveLabelsValue-1].Visible:=true;
		Labels[ActiveLabelsValue].Visible:=true;

        topprint:=topprint+Labels[ActiveLabelsValue].Height+4;
        StatusPanel.height:=topprint;
end;

procedure Tform2.AddSingleStroke (str:Widestring; lcolor:Tcolor);
begin
        inc(ActiveLabelsValue);

        Labels[ActiveLabelsValue].caption:=trim(str);

        Labels[ActiveLabelsValue].top:=Topprint;
        Labels[ActiveLabelsValue].Alignment:=taleftjustify;
        Labels[ActiveLabelsValue].wordwrap:=true;
        Labels[ActiveLabelsValue].Autosize:=true;

        Labels[ActiveLabelsValue].caption:=Labels[ActiveLabelsValue].caption;

        Labels[ActiveLabelsValue].Autosize:=false;
        Labels[ActiveLabelsValue].width:=stdlabelwidth;

        Labels[ActiveLabelsValue].font.color:=lcolor;
        Labels[ActiveLabelsValue].Alignment:=tacenter;

        Labels[ActiveLabelsValue].Visible:=true;

        topprint:=topprint+Labels[ActiveLabelsValue].Height+4;

        StatusPanel.Height:=topprint;
end;


procedure TForm2.TraceForClosedLocations;
var i,c:integer;
    pars:TParValues;
begin
    if Form8=nil then exit;
	CalculateFullStatisticsToolButton.Enabled:=false;
  	CalculateRedusedStatisticsToolButton.Enabled:=false;
	CalculateNoStatisticsToolButton.Enabled:=false;

    Form8.quest.CopyDataFrom(Game);
    Form8.PrepareForTrace(JustLoaded);

	if CalculateNoStatisticsToolButton.Down then begin
       	Form8.SeekOneQuestionPathes;
        Form8.UnPrepareForTrace;
    end;

	if CalculateFullStatisticsToolButton.Down or CalculateRedusedStatisticsToolButton.Down then begin
	    for i:=1 to maxparameters do pars[i]:=Game.pars[i].value;
    	if Form8.startlocationcount=1 then Form8.TraceQuest(Form8.startlocation,0,StatisticsForm.TParValues(pars),StatisticsForm.TParValues(pars));
    	Form8.SeekOneQuestionPathes;
    	for i:=1 to game.LocationsValue do  begin
        	game.Locations[i].ClosedLocationFlag:=Form8.closedlocations[i];
        	game.Locations[i].NoWay2LocationFlag:=Form8.noway2locations[i];
	    	for c:=1 to maxparameters do begin
     			if abs(Form8.ParameterMins[i][c])=nowayparameterflag then Form8.ParameterMins[i][c]:=game.pars[c].value;
     			if abs(Form8.ParameterMins[i][c])=nowayparameterflag then Form8.ParameterMins[i][c]:=game.pars[c].value;
    		end;
    	end;
    	Form8.UnPrepareForTrace;
    end;
  	CalculateFullStatisticsToolButton.Enabled:=true;
   	CalculateRedusedStatisticsToolButton.Enabled:=true;
	CalculateNoStatisticsToolButton.Enabled:=true;
end;


function TForm2.ThereAlreadyIsLocation(x,y:integer):boolean;
var i:integer;
    xd,yd:integer;
    xc,yc:integer;
    yes:boolean;
begin
        yes:=false;

     xd:=ClientWidth div Game.BlockXGradient;
     yd:=ClientHeight div Game.BlockYGradient;

    for i:=1 to Game.LocationsValue do begin

     for xc:=0 to GetMaxNDX-1 do begin
      for yc:=0 to GetMaxNDY-1 do begin
       if (Game.Locations[i].screenx >= xc*xd) and
          (Game.Locations[i].screenx < xc*xd + xd) and
          (Game.Locations[i].screeny >= yc*yd) and
          (Game.Locations[i].screeny < yc*yd + yd) and

          (x >= xc*xd) and
          (x < xc*xd + xd) and
          (y >= yc*yd) and
          (y  < yc*yd + yd)

          then yes:=true;
      end;
     end;

    end;

       ThereAlreadyIsLocation:=yes;
end;


procedure TForm2.FinePositionLocations;
var i:integer;
    xd,yd:integer;
    xc,yc:integer;
    miny:integer;
begin
	miny:=100000000;
	xd:=ClientWidth div Game.BlockXGradient;
	yd:=ClientHeight div Game.BlockYGradient;
    for i:=1 to Game.LocationsValue do begin
    	for xc:=0 to GetMaxNDX-1 do begin
			for yc:=0 to GetMaxNDY-1 do begin
                with Game.Locations[i] do begin
					if (screenx >= xc*xd)and(screenx < xc*xd + xd )and
          				(screeny >= yc*yd)and(screeny < yc*yd + yd )then begin
                    		screenx:=xc*xd + xd div 2;
							screeny:=yc*yd + yd div 2;
                            if screeny<miny then miny:=screeny;
          			end;
                end;
			end;
		end;
    end;
    if miny<35 then begin
		for i:=1 to Game.LocationsValue do begin
			Game.Locations[i].screeny:=Game.Locations[i].screeny+yd div 2;
        end;
        FinePositionLocations;
    end;
end;

procedure TForm2.FindFreeLocationPlace(var x,y,i:integer);
label done;
label next;
var c:integer;
    gxd,gyd:integer;
    xc,yc:integer;
    xa,ya:integer;
    found:boolean;
begin
    gxd:=Game.XScreenResolution div Game.BlockXGradient;
    gyd:=Game.YScreenResolution div Game.BlockYGradient;
    for xc:=1 to GetMaxNDX-1 do begin
        for yc:=1 to GetMaxNDY-1 do begin

            xa:=xc*gxd + gxd div 2;
            ya:=yc*gyd + gyd div 2;
            found:=true;
            for c:=1 to i do begin
                if (c<>i)and(Game.Locations[c].screenx >= xc*gxd) and
                (Game.Locations[c].screenx < xc*gxd + gxd ) and
                (Game.Locations[c].screeny >= yc*gyd) and
                (Game.Locations[c].screeny < yc*gyd + gyd ) then begin
                    found:=false;
                    goto next;
                end;
            end;
        next:
            if found then begin
                x:=xa;
                y:=ya;
                exit;
            end;
        end;
    end;
end;

procedure TForm2.CheckCoordsDist(var x,y:integer; i:integer);
var c:integer;
begin
    for c:=1 to Game.LocationsValue do begin
        if ((i<>c)and(
                        (x>Game.XScreenResolution*scrxmaxvalue)or
                        (y>Game.YScreenResolution*scrymaxvalue)or
                        (x<0)or
                        (y<0)or
                        (
                         (1>abs(x-Game.Locations[c].screenx))
                         and
                         (1>abs(y-Game.Locations[c].screeny))
                        )
                    )
            )
        then begin
           FindFreeLocationPlace(x,y,i);
           Continue;
        end;
    end;
end;

procedure TForm2.PositionLocationsAfterLoad;
var i:integer;
    xd,yd:integer;
    gxd,gyd:integer;
    xc,yc:integer;
    xa,ya: array [1..maxlocations] of integer;
begin
     xd:=ClientWidth div Game.BlockXGradient;
     yd:=ClientHeight div Game.BlockYGradient;
     gxd:=Game.XScreenResolution div Game.BlockXGradient;
     gyd:=Game.YScreenResolution div Game.BlockYGradient;

    for i:=1 to Game.LocationsValue do begin
        with Game do begin
            if Locations[i].screenx>XScreenResolution*scrxmaxvalue then Locations[i].screenx:=XScreenResolution*scrxmaxvalue;
            if Locations[i].screeny>YScreenResolution*scrymaxvalue  then Locations[i].screeny:=YScreenResolution*scrymaxvalue;
        end;
    end;
    for i:=1 to Game.LocationsValue do begin
    	for xc:=0 to GetMaxNDX-1 do begin
    		for yc:=0 to GetMaxNDY-1 do begin
				if (Game.Locations[i].screenx >= xc*gxd) and
					(Game.Locations[i].screenx < xc*gxd + gxd ) and
					(Game.Locations[i].screeny >= yc*gyd) and
					(Game.Locations[i].screeny < yc*gyd + gyd ) then begin
						xa[i]:=xc*xd + xd div 2;
						ya[i]:=yc*yd + yd div 2;
                end;
			end;
		end;
    end;
    game.XScreenResolution:=ClientWidth;
    game.YScreenResolution:=ClientHeight;
    for i:=1 to game.LocationsValue do begin
        game.Locations[i].screenx:=xa[i];
        game.Locations[i].screeny:=ya[i];
    end;
    for i:=1 to game.LocationsValue do begin
        CheckCoordsDist(xa[i],ya[i],i);
        game.Locations[i].screenx:=xa[i];
        game.Locations[i].screeny:=ya[i];
    end;
end;


procedure TForm2.SaveEditorOptions(s:string);
var f:file;
	flag:boolean;
begin
    AssignFile(f,s);
    rewrite(f,1);

    ConfigFilePath:=s;

    BlockWrite(f,LineFromColor, sizeof(LineFromColor));
    BlockWrite(f,LineToColor, sizeof(LineToColor));
    BlockWrite(f,VoidLineFromColor, sizeof(VoidLineFromColor));
    BlockWrite(f,VoidLineToColor, sizeof(VoidLineToColor));
    BlockWrite(f,PointerColor, sizeof(PointerColor));
    BlockWrite(f,StartLocationColor, sizeof(StartLocationColor));
    BlockWrite(f,EndLocationColor, sizeof(EndLocationColor));
    BlockWrite(f,FailLocationColor, sizeof(FailLocationColor));
    BlockWrite(f,DefaultLocationColor, sizeof(DefaultLocationColor));
    BlockWrite(f,ClosedLocationColor, sizeof(ClosedLocationColor));
    BlockWrite(f,BackGroundColor, sizeof(BackGroundColor));
    BlockWrite(f,NoWay2Color, sizeof(NoWay2Color));
    BlockWrite(f,NoSuccessWaysColor, sizeof(NoSuccessWaysColor));
    BlockWrite(f,OneQuestionColor, sizeof(OneQuestionColor));
    BlockWrite(f,PathHelpPanelColor, sizeof(PathHelpPanelColor));
    BlockWrite(f,LocationHelpPanelColor, sizeof(LocationHelpPanelColor));
    BlockWrite(f,StatisticsCalculationTimerDelay, sizeof(StatisticsCalculationTimerDelay));
    BlockWrite(f,AbsPathColor, sizeof(AbsPathColor));
    BlockWrite(f,NotAbsPathColor, sizeof(NotAbsPathColor));
    BlockWrite(f,DrawPathType, sizeof(DrawPathType));
    BlockWrite(f,ParNameHelpPanelType, sizeof(ParNameHelpPanelType));
    BlockWrite(f,SameQNoDescrStartColor, sizeof(SameQNoDescrStartColor));
    BlockWrite(f,SameQNoDescrEndColor, sizeof(SameQNoDescrEndColor));
    BlockWrite(f,SameQDescrStartColor, sizeof(SameQDescrStartColor));
    BlockWrite(f,SameQDescrEndColor, sizeof(SameQDescrEndColor));
    BlockWrite(f,VoidObjectColor, sizeof(VoidObjectColor));
    BlockWrite(f,VoidObjectStartColor, sizeof(VoidObjectStartColor));
    BlockWrite(f,SPN, sizeof(SPN));
    BlockWrite(f,StatusPanelSflag, sizeof(StatusPanelSflag));
    flag:=FreeScrollButton.Down;
    BlockWrite(f,flag, sizeof(flag));

    CloseFile(f);
end;

procedure TForm2.LoadEditorOptions;
var f:file;
	flag:boolean;
begin
    AssignFile(f,ConfigFilePath);
    reset(f,1);


    BlockRead(f,LineFromColor, sizeof(LineFromColor));
    BlockRead(f,LineToColor, sizeof(LineToColor));
    BlockRead(f,VoidLineFromColor, sizeof(VoidLineFromColor));
    BlockRead(f,VoidLineToColor, sizeof(VoidLineToColor));
    BlockRead(f,PointerColor, sizeof(PointerColor));
    BlockRead(f,StartLocationColor, sizeof(StartLocationColor));
    BlockRead(f,EndLocationColor, sizeof(EndLocationColor));
    BlockRead(f,FailLocationColor, sizeof(FailLocationColor));
    BlockRead(f,DefaultLocationColor, sizeof(DefaultLocationColor));
    BlockRead(f,ClosedLocationColor, sizeof(ClosedLocationColor));
    BlockRead(f,BackGroundColor, sizeof(BackGroundColor));
    BlockRead(f,NoWay2Color, sizeof(NoWay2Color));
    BlockRead(f,NoSuccessWaysColor, sizeof(NoSuccessWaysColor));
    BlockRead(f,OneQuestionColor, sizeof(OneQuestionColor));
    BlockRead(f,PathHelpPanelColor, sizeof(PathHelpPanelColor));
    BlockRead(f,LocationHelpPanelColor, sizeof(LocationHelpPanelColor));
    BlockRead(f,StatisticsCalculationTimerDelay, sizeof(StatisticsCalculationTimerDelay));
    Form2.StatisticsTimer.Interval:=StatisticsCalculationTimerDelay;
    BlockRead(f,AbsPathColor, sizeof(AbsPathColor));
    BlockRead(f,NotAbsPathColor, sizeof(NotAbsPathColor));
    BlockRead(f,DrawPathType, sizeof(DrawPathType));
    BlockRead(f,ParNameHelpPanelType, sizeof(ParNameHelpPanelType));
    BlockRead(f,SameQNoDescrStartColor, sizeof(SameQNoDescrStartColor));
    BlockRead(f,SameQNoDescrEndColor, sizeof(SameQNoDescrEndColor));
    BlockRead(f,SameQDescrStartColor, sizeof(SameQDescrStartColor));
    BlockRead(f,SameQDescrEndColor, sizeof(SameQDescrEndColor));

    BlockRead(f,VoidObjectColor, sizeof(VoidObjectColor));
    BlockRead(f,VoidObjectStartColor, sizeof(VoidObjectStartColor));

    BlockRead(f,SPN, sizeof(SPN));
    BlockRead(f,StatusPanelSflag, sizeof(StatusPanelSflag));

    BlockRead(f,flag, sizeof(flag));
    FreeScrollButton.Down:=flag;


    CloseFile(f);
    NiceRepaint;
end;

procedure TForm2.SetDefaultEditorOptions;
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
    BackGroundColor:=TColor($00AAAAAA);
    NoWay2Color:=TColor($00EB57FB);
    NoSuccessWaysColor:=TColor($004080FF);
    OneQuestionColor:=TColor($00400080);
    PathHelpPanelColor:=TColor($0098E2E7);//TColor($00B8F1F0);
    LocationHelpPanelColor:=TColor($0098E2E7);
    AbsPathColor:=TColor($00ff0000);
    NotAbsPathColor:=TColor($000000ff);
    SameQNoDescrStartColor:=TColor($0096c8f5);
    SameQNoDescrEndColor:=TColor($00000080);
    SameQDescrStartColor:=TColor($00ffffff);
    SameQDescrEndColor:=TColor($00000080);

    VoidObjectColor:=TColor($00004000);
    VoidObjectStartColor:=TColor($00FFFFFF);
    DrawPathType:=0;
    ParNameHelpPanelType:=2;
    
    StatisticsCalculationTimerDelay:=5000;
     Form2.StatisticsTimer.Interval:=StatisticsCalculationTimerDelay;

    SPN:=5;
    StatusPanelSflag:=false;

end;

procedure TForm2.FormCreate(Sender: TObject);
var i:integer;
begin
	ndx:=0;
	ndy:=0;
	OnNiceRepaintFlag:=false;
	ActiveChildsCount:=0;
	ScrollDelay:=0;
	ReSetPath:=0;
	Randomize;
	M:=@MessageText.M;
	for i:=1 to maxstatuspanellabels do begin
		Labels[i]:=TLabel.Create(StatusPanel);
	end;

	LoadingData:=false;
	DrawBuffer:=TBitmap.Create;
	DrawBuffer.Height:=Height;
	DrawBuffer.Width:=Width;
	Game:=TGame.Create(GameContent.PM(M));
	for i:=0 to UndoMax-1 do UndoArray[i]:=TGame.Create(GameContent.PM(M));
	ClearDo;
	EditMode:=EM_Undefined;
	ConfigFilePath:=GetCurrentDir + '\' + EditorConfFile;
  	TgeDir:=GetCurrentDir;
	if FileExists(ConfigFilePath) then LoadEditorOptions else begin
		SetDefaultEditorOptions;
        SaveEditorOptions(ConfigFilePath);
    end;
	NeedToSaveChanges:=false;
end;

procedure TForm2.ProcessEnabledControls;
begin
        if UndoPos>UndoStart then UndoButton.Enabled:=true
                             else UndoButton.Enabled:=false;
        if UndoPos<UndoEnd then RedoButton.Enabled:=true
                           else RedoButton.Enabled:=false;
NiceRepaint;
end;

procedure TForm2.ClearDo;
  var i:integer;
begin
for i:=0 to UndoMax-1 do UndoArray[i].Clear;
UndoStart:=0;
UndoEnd:=0;
UndoPos:=0;
ProcessEnabledControls;
Game.RecalculatePathes;
TraceForClosedLocations;
end;


procedure TForm2.MakeDo;
begin
		if (UndoEnd-UndoStart)>=UndoMax-1 then inc(UndoStart);
		inc(UndoPos);
		UndoEnd:=UndoPos;
		UndoArray[UndoPos mod UndoMax].CopyDataFrom(Game);
		maxedx:=GetMaxEDX;
		maxedy:=GetMaxEDY;
		//TraceForClosedLocations;
		ProcessEnabledControls;
end;

procedure TForm2.MakeUndo;
begin
		if UndoPos>UndoStart then begin
			dec(UndoPos);
			Game.CopyDataFrom(UndoArray[UndoPos mod UndoMax]);
		end;
		maxedx:=GetMaxEDX;
		maxedy:=GetMaxEDY;
		TraceForClosedLocations;
		//Game.RecalculatePathes;
		ProcessEnabledControls;
end;

procedure TForm2.MakeRedo;
begin
      if UndoPos<UndoEnd then begin
         inc(UndoPos);
         Game.CopyDataFrom(UndoArray[UndoPos mod UndoMax]);
      end;
TraceForClosedLocations;
//Game.RecalculatePathes;
ProcessEnabledControls;
end;

procedure TForm2.NewGameButtonClick(Sender: TObject);
begin
  if IsStatisticsCalculating then exit;

        SaveDialog.FileName:='';
        OpenDialog.FileName:='';
        Form4.FormGame.Clear;
        Form4.FormGame.XScreenResolution:=ClientWidth;
        Form4.FormGame.YScreenResolution:=ClientHeight;
        inc(ActiveChildsCount);
        Form4.ShowModal;
        dec(ActiveChildsCount);
        if Form4.is_ok_pressed then begin
                Game.Clear;
                Game.CopyDataFrom(Form4.FormGame);
                ndx:=0;
                ndy:=0;
        Form2.Caption:=M.Par_Get('Form2NewFileCaption');
        ClearDo;
        NeedToSaveChanges:=true;
        end;

NiceRepaint;
end;

procedure TForm2.LoadGameButtonClick(Sender: TObject);
var s,s1:string;
	cfgfilename:string;
    Path:TTextField;
    f:file;
    i:integer;
begin
	if IsStatisticsCalculating then exit;
	inc(ActiveChildsCount);
    Path:=TTextField.Create;
    cfgfilename:=TgeDir+'\'+'path.cfg';
	if FileExists(cfgfilename) then begin
    	AssignFile(f,cfgfilename);
        Reset(f,1);
        path.Load(@f);
        closefile(f);
        OpenDialog.InitialDir:=trim(path.Text);
        SaveDialog.InitialDir:=trim(path.Text);
    end;

    if OpenDialog.Execute then begin

        LoadingData:=true;
        Game.Clear;
        s:=OpenDialog.filename;
        s1:=s;
        for i:=length(s) downto 1 do begin
        	if s[i]<>'\' then begin
            	SetLength(s1,i-1);
            end else begin
				break;
            end;
        end;
        Path.Text:=s1;
    	AssignFile(f,cfgfilename);
        Rewrite(f,1);
        path.Save(@f);
        closefile(f);
        SaveDialog.InitialDir:=trim(path.Text);

        JustLoaded:=true;
        Game.Load(s);
        ndx:=0;
        ndy:=0;
        PositionLocationsAfterLoad;
        LoadingData:=false;
        Game.RecalculatePathes;
        TraceForClosedLocations;
        Form2.Caption:=s + M.Par_Get('Form2Caption');
        ClearDo;
        MakeDo;
        SaveDialog.FileName:=OpenDialog.FileName;
        NeedToSaveChanges:=false;
        JustLoaded:=false;
    end;
	//  NiceRepaint;
	dec(ActiveChildsCount);
	Path.Destroy;
end;

procedure TForm2.SaveGameButtonClick(Sender: TObject);
var s,s1:string;
	cfgfilename:string;
    Path:TTextField;
    f:file;
    i:integer;
begin
	if IsStatisticsCalculating then exit;
	inc(ActiveChildsCount);
    Path:=TTextField.Create;
    cfgfilename:=TgeDir+'\'+'path.cfg';
	if FileExists(cfgfilename) then begin
    	AssignFile(f,cfgfilename);
        Reset(f,1);
        path.Load(@f);
        closefile(f);
        OpenDialog.InitialDir:=trim(path.Text);
        SaveDialog.InitialDir:=trim(Path.Text);
    end;

    if SaveDialog.Execute then begin
    	s:=SaveDialog.filename;
        s1:=s;
        for i:=length(s) downto 1 do begin
        	if s[i]<>'\' then begin
            	SetLength(s1,i-1);
            end else begin
				break;
            end;
        end;
        Path.Text:=s1;
    	AssignFile(f,cfgfilename);
        Rewrite(f,1);
        path.Save(@f);
        closefile(f);
        OpenDialog.InitialDir:=trim(path.Text);

        Game.XScreenResolution:=ClientWidth;
        Game.YScreenResolution:=ClientHeight;
        Game.Save(s);
        Form2.Caption:=s +  M.Par_Get('Form2Caption');
        ClearDo;
        NeedToSaveChanges:=false;
    end;
    dec(ActiveChildsCount);
	Path.Destroy;
end;



procedure TForm2.DrawLine(out path:tpath; selected,void,oneQuestion:boolean);
   var q:integer;
       dR,dG,dB:integer;
       t:extended;
       ltc,lfc:TColor;
       tx,ty,tx1,ty1,zx,zy:integer;
begin
		if not void then begin
           ltc:=LineToColor;
           lfc:=LineFromColor;
        end else begin
           ltc:=VoidLineToColor;
           lfc:=VoidLineFromColor;
        end;

        if oneQuestion then begin
//        	ltc:=OneQuestionColor;
//        	lfc:=LineFromColor;
        	if trim(Path.EndPathMessage.Text)='' then begin
            	ltc:=SameQNoDescrEndColor;
                lfc:=SameQNoDescrStartColor;
        	end else begin
            	ltc:=SameQDescrEndColor;
                lfc:=SameQDescrStartColor;
            end;
        end;
        if (trim(Path.EndPathMessage.Text)='')and(trim(Path.StartPathMessage.Text)='') then begin
        	ltc:=VoidObjectColor;
        	lfc:=VoidObjectStartColor;
        end;

        if DrawPathType=1 then begin
        	if Path.PassTimesValue=0 then begin
            	ltc:=AbsPathColor;
                lfc:=LineFromColor;
            end else begin
            	ltc:=NotAbsPathColor;
                lfc:=LineFromColor;
        	end;
        end;

		dB:=integer(ltc and $00FF0000) shr 16-integer(lfc and $00FF0000) shr 16;
		dG:=integer(ltc and $0000FF00) shr 8-integer(lfc and $0000FF00) shr 8;
		dR:=integer(ltc and $000000FF)-integer(lfc and $000000FF);

		with path do begin
			zx:=(ClientWidth div Game.BlockXgradient)*ndx;
			zy:=(ClientHeight div Game.BlockYgradient)*ndy;
			for q:=0 to maxpathcoords-1 do begin
      			tx:=PathXCoords[q]-zx;
        		ty:=PathYCoords[q]-zy;
				tx1:=PathXCoords[q+1]-zx;
                ty1:=PathYCoords[q+1]-zy;
				if ((tx>=0)and(tx<ClientWidth)and(ty>=0)and(ty<ClientHeight))
         			or
            		((tx1>=0)and(tx1<ClientWidth)and(ty1>=0)and(ty1<ClientHeight)) then begin
						t:=q/(maxpathcoords+1);
                    	with DrawBuffer.Canvas do begin
							pen.color:=TColor(lfc+integer(trunc(dB*t))*65536
                        						+integer(trunc(dG*t))*256
												+integer(trunc(dR*t)));
        					MoveTo(tx,ty);
                            LineTo(tx1,ty1);
                    	end;
     			end;
			end;
     	end;
     DrawBuffer.Canvas.pen.color:=TColor($00000000);
end;

procedure TForm2.DrawPath(path_index:integer; selected, nosuccessways,noways:boolean);
    var  ax,ay,bx,by,zx,zy:integer;
         a1x,a1y,a2x,a2y :integer;
         r,w,m,z:extended;
         tnmc,tnmc2:Tcolor;
         onequestionpath:bool;
         c:integer;
begin

     DrawBuffer.Canvas.pen.Width:=1;
     if selected then DrawBuffer.Canvas.pen.Width:=2;


   if not CalculateNoStatisticsToolButton.Down then begin
   	if Form8.StatisticsCalculated then begin
     	if noways then begin
             	tnmc:=OneQuestionColor;
                tnmc2:=LineFromColor;
             	OneQuestionColor:=ClosedLocationColor;
                LineFromColor:=ClosedLocationColor;
             	DrawBuffer.Canvas.pen.Width:=DrawBuffer.Canvas.pen.Width+2;
             	DrawBuffer.Canvas.pen.Color:=ClosedLocationColor;
             	DrawLine(Game.pathes[Path_index],selected,false,true);
             	DrawBuffer.Canvas.pen.Width:=DrawBuffer.Canvas.pen.Width-2;
             	OneQuestionColor:=tnmc;
                LineFromColor:=tnmc2;
     	end else begin
     		if nosuccessways then begin
             	tnmc:=OneQuestionColor;
                tnmc2:=LineFromColor;
             	OneQuestionColor:=NoSuccessWaysColor;
                LineFromColor:=NoSuccessWaysColor;
             	DrawBuffer.Canvas.pen.Width:=DrawBuffer.Canvas.pen.Width+2;
             	DrawBuffer.Canvas.pen.Color:=NosuccessWaysColor;
             	DrawLine(Game.pathes[Path_index],selected,false,true);
             	DrawBuffer.Canvas.pen.Width:=DrawBuffer.Canvas.pen.Width-2;
             	OneQuestionColor:=tnmc;
                LineFromColor:=tnmc2;
     		end;
     	end;
    end;
   end;

     if (Form8.OneQuestionPathes[path_index])then onequestionpath:=true
     else onequestionpath:=false;

	with Game.Pathes[path_index] do begin
    	DrawLine(Game.Pathes[path_index],selected,VoidPathFlag,onequestionpath);
		c:=Game.GetLocationIndex(ToLocation);

		zx:=(ClientWidth div Game.BlockXgradient)*ndx;
        zy:=(ClientHeight div Game.BlockYgradient)*ndy;

		ax:=PathXCoords[maxpathcoords-5]-zx;
		ay:=PathYCoords[maxpathcoords-5]-zy;
		bx:=Game.Locations[c].screenx-zx;
		by:=Game.Locations[c].screeny-zy;
	end;

    r:=sqrt(sqr(ax-bx) + sqr(ay-by));
    if r=0 then r:=1;
    if by<ay then w:=arccos((ax-bx)/r) else w:=pi+arccos((bx-ax)/r);

    z:=15;
    m:=w+pi/10;
    a1x:=trunc(z*cos(m)+ bx);
    a1y:=trunc(z*sin(m)+ by);

    m:=w-pi/10;
    a2x:=trunc(z*cos(m)+ bx);
    a2y:=trunc(z*sin(m)+ by);

    with DrawBuffer.Canvas do begin
		Pen.Color:=PointerColor;
		if DrawPathType=1 then begin
     		if Game.Pathes[path_index].PassTimesValue=0 then begin
            	Pen.Color:=AbsPathColor;
        	end else begin
            	Pen.Color:=NotAbsPathColor;
        	end;
		end;
		if Form8.OneQuestionPathes[path_index] then begin
            if trim(Game.Pathes[path_index].EndPathMessage.Text)='' then begin
            	Pen.Color:=SameQNoDescrEndColor;
            	if trim(Game.Pathes[path_index].StartPathMessage.Text)='' then begin
        			Pen.Color:=VoidObjectColor;
                end;
            end else begin
				Pen.Color:=SameQDescrEndColor;
            end;
        end;
		MoveTo(a1x,a1y); DrawBuffer.Canvas.LineTo(bx,by);
		MoveTo(a2x,a2y); DrawBuffer.Canvas.LineTo(bx,by);
		pen.Width:=1;
    end;
end;


procedure TForm2.DrawLocation(x,y:integer; selected,closed,noway2,nosuccway,faillocation,nomean, void:boolean);
var size:integer;
    tpen, tbrush:TColor;
begin

 if not InScreen(x,y) then exit;	

 x:=x-(ClientWidth div Game.BlockXgradient)*ndx;
 y:=y-(ClientHeight div Game.BlockYgradient)*ndy;

 tpen:=DrawBuffer.Canvas.Pen.Color;
 tbrush:=DrawBuffer.Canvas.Brush.Color;

 size:=5;
 if selected then size:=7;

  if not void and noway2 and Form8.StatisticsCalculated then begin
                        DrawBuffer.Canvas.Pen.Color:=NoWay2Color;
                        DrawBuffer.Canvas.Brush.Color:=NoWay2Color;

                        DrawBuffer.Canvas.ellipse(x - size-5,
                                            y - size-5,
                                            x + size+5,
                                            y + size+5);
  end;

  if //not nomean and
  closed and CalculateFullStatisticsToolButton.down
  and Form8.StatisticsCalculated then begin
                        DrawBuffer.Canvas.Pen.Color:=ClosedLocationColor;
                        DrawBuffer.Canvas.Brush.Color:=ClosedLocationColor;

                        DrawBuffer.Canvas.ellipse(x - size-3,
                                            y - size-3,
                                            x + size+3,
                                            y + size+3);
  end else

  if not void and
     not faillocation and
     nosuccway and (not CalculateNoStatisticsToolButton.down) and
     Form8.StatisticsCalculated then begin
                        DrawBuffer.Canvas.Pen.Color:=NoSuccessWaysColor;
                        DrawBuffer.Canvas.Brush.Color:=NoSuccessWaysColor;

                        DrawBuffer.Canvas.ellipse(x - size-3,
                                            y - size - 3,
                                            x + size + 3,
                                            y + size + 3);
  end;


  DrawBuffer.Canvas.Pen.Color:=tpen;
  DrawBuffer.Canvas.Brush.Color:=tbrush;

  if void then begin
     DrawBuffer.Canvas.Pen.Color:=VoidObjectColor;
     DrawBuffer.Canvas.Brush.Color:=VoidObjectColor;
  end;

  DrawBuffer.Canvas.Ellipse(x - size,y - size,x + size,y + size);

end;

procedure TForm2.FormPaint(Sender: TObject);
begin
    //   NiceRepaint;
          Canvas.CopyRect(Rect(0,0,Width,Height),
                         DrawBuffer.Canvas,
                         Rect(0,0,Width,Height));
end;

procedure TForm2.NiceRepaint;
      var i:integer;
          nowayflag,nosuccwayflag,selectedflag:boolean;
begin
OnNiceRepaintFlag:=true;
//Order locations on the screen
    FinePositionLocations;
//    Game.RecalculatePathes;

//Begin Paint Locations
DrawBuffer.Canvas.Pen.Color:=BackGroundColor;
DrawBuffer.Canvas.Brush.Color:=BackGroundColor;
DrawBuffer.Canvas.Rectangle(Rect(0,0,Width,Height));

      for i:=1 to Game.LocationsValue do begin

        DrawBuffer.Canvas.Pen.Color:=DefaultLocationColor;
        DrawBuffer.Canvas.Brush.color:=DefaultLocationColor;

        if Game.Locations[i].StartLocationFlag then begin
              DrawBuffer.Canvas.Brush.Color:=StartLocationColor;
              DrawBuffer.Canvas.Pen.Color:=StartLocationColor;
        end;

        if Game.Locations[i].EndLocationFlag then begin
              DrawBuffer.Canvas.Brush.Color:=EndLocationColor;
              DrawBuffer.Canvas.Pen.Color:=EndLocationColor;
        end;

        if Game.Locations[i].FailLocationFlag then begin
              DrawBuffer.Canvas.Brush.Color:=FailLocationColor;
              DrawBuffer.Canvas.Pen.Color:=FailLocationColor;
        end;

       nosuccwayflag:=true;
       if form8.SuccessReaches[i]>0 then nosuccwayflag:=false;
       if i=LocationSelectedIndex then nosuccwayflag:=true;
       if form8.SuccessReaches[i]>0 then nosuccwayflag:=false;
       selectedflag:=false;
       if i=LocationSelectedIndex then selectedflag:=true;

          DrawLocation(Game.Locations[i].screenx,
                       Game.Locations[i].screeny,
                       selectedflag,
                       Game.Locations[i].ClosedLocationFlag,
                       Game.Locations[i].NoWay2LocationFlag,
                       nosuccwayflag,
                       Game.Locations[i].FailLocationFlag,
                       false,
                       Game.Locations[i].VoidLocation
                       );
      end;
//EndPaintLocations

//Begin Paint Pathes
       for i:=1 to Game.PathesValue do  begin

        nowayflag:=Form8.PathReaches[i]=0;
        nosuccwayflag:=Form8.PathSuccessReaches[i]=0;
        selectedflag:=i=PathSelectedIndex;

              DrawPath(i,selectedflag,nosuccwayflag,nowayflag);

       end;
//End Paint Pathes

        Canvas.CopyRect(Rect(0,0,Width,Height),
                         DrawBuffer.Canvas,
                         Rect(0,0,Width,Height));

        OnNiceRepaintFlag:=false;
end;

procedure TForm2.ProcessRightClick;
var
  lx,ly:integer; //px,py,px1,py1:integer;
  i,c,q:integer;
  tempPath:TPath;
  tempLocation:TLocation;
begin
  tempPath:=TPath.Create(0,0,0,0,0,0,0,0,0,nil);
  tempLocation:=TLocation.Create(0,nil);
  i:=Game.GetClosestLocation(MouseDownCoords.x,MouseDownCoords.y);
  if i>0 then begin
    lx:=Game.Locations[i].screenx;
    ly:=Game.Locations[i].screeny;
  end else begin
    lx:=maxint;
    ly:=maxint;
  end;
  c:=Game.GetClosestPath(MouseDownCoords.x,MouseDownCoords.y);
       
  if (i<=0) and (c<=0) then begin
    showmessage(M.Par_Get('Form2NothingToEditError'))
  end else begin
    if (sqrt(sqr(lx-MouseDownCoords.x)+sqr(ly-MouseDownCoords.y)) < Game.GetPathDistance(c,MouseDownCoords.x,MouseDownCoords.y)) then begin
      //  tempgame.CopyDataFrom(Game);
      Form1.QuestLocationIndex:=i;
      tempLocation.CopyDataFrom(Game.Locations[i]);
      Form1.CanCheckStartLocation:=game.CanAddStartLocation
      or game.Locations[i].StartLocationFlag;

      form1.IsLocationStartCheck.Visible:=true;
      form1.IsLocationEndCheck.Visible:=true;
      form1.IsLocationFailCheck.Visible:=true;

      for q:=1 to maxparameters do begin
        {form1.ParRadioButtons[q].Visible:=Game.Pars[q].Enabled;
        form1.LPEA[q].Visible:=Game.Pars[q].Enabled;
        form1.ParRadioButtons[q].Caption:=trim(Game.Pars[q].Name.Text);
        form1.ParDeltaLabels[q].Visible:=Game.Pars[q].Enabled;
        form1.ParMaxes[q]:=Game.Pars[q].max;
        form1.ParMins[q]:=Game.Pars[q].min;}
        form1.ParList.ItemEnabled[q-1]:=Game.Pars[q].Enabled;
        form1.ParListSetItem(q, trim(Game.Pars[q].Name.Text));
      end;


      Form1.WeMakingANewLocation:=false;
      Form1.ShowModal;
      if Form1.is_ok_pressed then  begin
        TraceForClosedLocations;
        NiceRepaint;
        MakeDo;
        NeedToSaveChanges:=true;
      end else begin
        Game.Locations[i].CopyDataFrom(TempLocation);
        TraceForClosedLocations;
        NiceRepaint;
      end;


    end else begin
      tempPath.CopyDataFrom(Game.Pathes[c]);

      for q:=1 to maxparameters do begin
        //form3.ParRadioButtons[q].Visible:=Game.Pars[q].Enabled;
        //form3.LPEA[q].Visible:=Game.Pars[q].Enabled;
        //form3.ParRadioButtons[q].Caption:=trim(Game.Pars[q].Name.Text);
        //form3.ParGateLabels[q].Visible:=Game.Pars[q].Enabled;
        //form3.ParDeltaLabels[q].Visible:=Game.Pars[q].Enabled;
        form3.ParList.ItemEnabled[q-1]:=Game.Pars[q].Enabled;
        form3.ParListSetItem(q, trim(Game.Pars[q].Name.Text));
        
        form3.ParMaxes[q]:=Game.Pars[q].GetDefaultMaxGate;
        form3.ParMins[q]:=Game.Pars[q].GetDefaultMinGate;
      end;

      Form3.WeMakingANewPath:=false;
      Form3.FormPath.CopyDataFrom(Game.Pathes[c]);
      Form3.QuestPathIndex:=c;
      Form3.ShowModal;
      if Form3.is_ok_pressed or Form3.is_next_pressed then begin
        TraceForClosedLocations;
        NiceRepaint;
        MakeDo;
        NeedToSaveChanges:=true;
      end else begin
        Game.Pathes[c].CopyDataFrom(tempPath);
        TraceForClosedLocations;
        NiceRepaint;
      end;
    end;
  end;
  tempPath.Destroy;
  tempLocation.Destroy;
end;


procedure TForm2.FormClick(Sender: TObject);
var i,c,q:integer;
    TempLocation:TLocation;
    TempPath:TPath;
    delloc,delpath:boolean;
    lx,ly:integer;
begin
	MouseUpCoords.x:=GetDMouseX(Mouse.CursorPos.x) - ClientOrigin.x;
	MouseUpCoords.y:=GetDMouseY(Mouse.CursorPos.y) - ClientOrigin.y;

	i:=Game.GetClosestLocation(MouseDownCoords.x,MouseDownCoords.y);
    if i>0 then begin
    	lx:=Game.Locations[i].screenx;
    	ly:=Game.Locations[i].screeny;
	end else begin
    	lx:=maxint;
    	ly:=maxint;
    end;
    c:=Game.GetClosestPath(MouseUpCoords.x,MouseUpCoords.y);
    if (
   		sqrt(sqr(lx-MouseUpCoords.x)+sqr(ly-MouseUpCoords.y))
        <
        Game.GetPathDistance(c,MouseUpCoords.X,MouseUpCoords.Y)
        ) then begin
    	c:=-1;
    end;

    if EditMode=EM_DeleteLocationOrPath then begin
        if c>0 then begin
            delloc:=false;
            delpath:=true;
        end else begin
			delloc:=true;
            delpath:=false;
        end;
    end else begin
        delloc:=false;
        delpath:=false;
    end;

	if IsStatisticsCalculating then exit;

  if MouseLeftPressed then begin
       if EditMode=EM_NewLocation then begin

          if not ThereAlreadyIsLocation(MouseDownCoords.x,MouseDownCoords.y) then
          begin
               inc(ActiveChildsCount);
               if Game.AddLocation(MouseDownCoords.x,MouseDownCoords.y) then
               TraceForClosedLocations;
               FinePositionLocations;
               NiceRepaint;
               MakeDo;
               NeedToSaveChanges:=true;
               dec(ActiveChildsCount);
          end else begin
          	inc(ActiveChildsCount);
          	ShowMessage(M.Par_Get('Form2LocationAlreadyExists'));
            dec(ActiveChildsCount);
       	  end;
       end;

       if delloc then begin
       		i:=Game.GetClosestLocation(MouseDownCoords.x,MouseDownCoords.y);
            if i>0 then begin
	         inc(ActiveChildsCount);
       		if MessageDlg(M.Par_Get('Form2DeleteLocationConfirm') +
                        Game.Locations[i].LocationName.Text,
                         mtConfirmation, [mbYes, mbNo],0)
                     =mrYes then begin
       		dec(ActiveChildsCount);

            //Now we need to delete all connected pathes
			repeat
            	q:=-1;
            	for c:=1 to Game.PathesValue do begin
            		if (Game.Pathes[c].FromLocation=Game.Locations[i].LocationNumber)
                		or
                		(Game.Pathes[c].ToLocation=Game.Locations[i].LocationNumber)then begin
                		q:=c;
            		end;
            	end;
            	if q<>-1 then begin
               		Game.DeletePath(Game.Pathes[q].PathNumber);
             	end;
          	until q=-1;
       		//And now we can delete location
       		Game.DeleteLocation(Game.Locations[i].LocationNumber);
  			Game.RecalculatePathes;
			TraceForClosedLocations;
       		NiceRepaint;
  			MakeDo;

			NeedToSaveChanges:=true;
        end; //if MessageDlg

         end else begin
           	inc(ActiveChildsCount);
         	ShowMessage(M.Par_Get('Form2DeleteNothingError'));
           	dec(ActiveChildsCount);
      	 end;
       end;
       if delpath then begin
			i:=Game.GetClosestPath(MouseDownCoords.x,MouseDownCoords.y);
			if i>0 then begin
            	inc(ActiveChildsCount);
				if MessageDlg(trim(M.Par_Get('Form2DeletePathConfirm'))+trim(Game.Locations[Game.GetLocationIndex(Game.Pathes[i].FromLocation)].LocationName.Text)
                	+ '  ->  ' +trim(Game.Locations[Game.GetLocationIndex(Game.Pathes[i].ToLocation)].LocationName.Text),mtConfirmation, [mbYes, mbNo],0)
                     =mrYes then begin
                     	Game.DeletePath(Game.Pathes[i].PathNumber);
                        Game.RecalculatePathes;
                        TraceForClosedLocations;
                        NiceRepaint;
                        MakeDo;
                        NeedToSaveChanges:=true;
                end;
    			dec(ActiveChildsCount);
           end else begin
             	inc(ActiveChildsCount);
           		ShowMessage(M.Par_Get('Form2DeleteNothingError'));
             	dec(ActiveChildsCount);
           end;
       end;

       if EditMode=EM_MoveLocation then begin

                  i:=Game.GetClosestLocation(MouseDownCoords.x,
                                     MouseDownCoords.y);

        if ReSetPath=0 then begin

                  if i>0 then begin

        			if ThereAlreadyIsLocation(MouseUpCoords.x,MouseUpCoords.y) then begin
                    	inc(ActiveChildsCount);
                  		ShowMessage('Здесь уже есть локация');
                    	dec(ActiveChildsCount);
                  	end else begin
               if not ShiftPressed then begin
                  Game.Locations[i].screenx:=MouseUpCoords.x;
                  Game.Locations[i].screeny:=MouseUpCoords.y;
//                  TraceForClosedLocations;
                end
                else begin
                  TempLocation:=Tlocation.Create(0,LocationClass.PM(M));
                  TempLocation.CopyDataFrom(Game.Locations[i]);
                  TempLocation.screenx:=MouseUpCoords.x;
                  TempLocation.screeny:=MouseUpCoords.y;
                  Game.AddLocation(TempLocation);
                  TempLocation.Destroy;
                end;
                  FinePositionLocations;
                  Game.RecalculatePathes;
                  MakeDo;
                  NeedToSaveChanges:=true;

          end;
          end else begin
          	inc(ActiveChildsCount);
          	ShowMessage(M.Par_Get('Form2MoveNothingError'));
          	dec(ActiveChildsCount);
          end;
        end else begin

            //    LocationSelected:=0;

         if LocationSelectedIndex>0 then begin

          if Game.WeNearerToPathEnd(ReSetPath,
                               MouseDownCoords.x,
                               MouseDownCoords.y) then begin

            if not (
            Game.IsCycleWith(
                  Game.Pathes[ReSetPath].FromLocation,
                  Game.Locations[LocationSelectedIndex].LocationNumber)
             ) then begin

             if not ShiftPressed then begin
              Game.Pathes[ReSetPath].ToLocation:=Game.Locations[LocationSelectedIndex].LocationNumber;
             end else begin
              TempPath:=TPath.Create(0,0,0,0,0,0,0,0,0,PathClass.PM(M));
              TempPath.CopyDataFrom(Game.Pathes[ReSetPath]);
              TempPath.ToLocation:=Game.Locations[LocationSelectedIndex].LocationNumber;
              Game.AddPath(TempPath);
              TempPath.Destroy;
             end;

              ReSetPath:=0;
              Game.RecalculatePathes;
              TraceForClosedLocations;
              NiceRepaint;
              MakeDo;
              NeedToSaveChanges:=true;

             end else begin
             	inc(ActiveChildsCount);
             	ShowMessage('Переназначение пути создает недопустимый цикл');  ReSetPath:=0;
                dec(ActiveChildsCount);
             end;

           end else begin

            if Game.GetOutcomePathesValue(LocationSelectedIndex)<maxpathesfromonelocation then begin
            if not
            Game.IsCycleWith(
                  Game.Locations[LocationSelectedIndex].LocationNumber,
                  Game.Pathes[ReSetPath].ToLocation
             ) then begin

             if not ShiftPressed then begin
              Game.Pathes[ReSetPath].FromLocation:=Game.Locations[LocationSelectedIndex].LocationNumber;
             end else begin

              TempPath:=TPath.Create(0,0,0,0,0,0,0,0,0,PathClass.PM(M));
              TempPath.CopyDataFrom(Game.Pathes[ReSetPath]);
              TempPath.FromLocation:=Game.Locations[LocationSelectedIndex].LocationNumber;
              Game.AddPath(TempPath);
              TempPath.Destroy;

             end;

              ReSetPath:=0;
              Game.RecalculatePathes;
              TraceForClosedLocations;
              NiceRepaint;
              MakeDo;
              NeedToSaveChanges:=true;

             end else begin
             	inc(ActiveChildsCount);
             	ShowMessage('Переназначение пути создает недопустимый цикл');  ReSetPath:=0;
                dec(ActiveChildsCount);
             end;
             end else begin
             	inc(ActiveChildsCount);
             	ShowMessage('Из этой локации ведет слишком много переходов'); ReSetPath:=0;
             	dec(ActiveChildsCount);
             end;

           end;

         end else begin
          	inc(ActiveChildsCount);
         	ShowMessage('Некуда переназначать');  ReSetPath:=0;
           	dec(ActiveChildsCount);
         end;

        end;

       end;

       if EditMode=EM_NewPath then begin
         if Game.LocationsValue>1 then begin
             i:=Game.GetClosestLocation(MouseDownCoords.x,MouseDownCoords.y);
             c:=Game.GetClosestLocation(MouseUpCoords.x,MouseUpCoords.y);
        if (i<=0) or (c<=0) then begin
          inc(ActiveChildsCount);
          ShowMessage('Начало и/или конец перехода не выделены');
          dec(ActiveChildsCount);
        end
        else begin

         if not Game.IsCyclewith(Game.Locations[i].LocationNumber,
                                 Game.locations[c].LocationNumber) then  begin

         		inc(ActiveChildsCount);
				if Game.AddPath(Game.Locations[i].LocationNumber,
                                Game.Locations[c].LocationNumber) then begin
                      Game.RecalculatePathes;
                      TraceForClosedLocations;
                      NiceRepaint;
                      MakeDo;
                      NeedToSaveChanges:=true;
                end;
               	dec(ActiveChildsCount);
         end else begin
         	inc(ActiveChildsCount);
         	ShowMessage('Добавляемый переход образует недопустимый цикл');
            dec(ActiveChildsCount);
         end;
       end;
       end
         else begin
         	inc(ActiveChildsCount);
         	ShowMessage(M.Par_Get('Form2TooFewLocationsError'));
            dec(ActiveChildsCount);
         end;
       end;

   end; //Mouse left pressed

//       Game.RecalculatePathes;
end;


procedure TForm2.ToolButton2Click(Sender: TObject);
begin
EditMode:=EM_NewLocation;
end;
procedure TForm2.ToolButton4Click(Sender: TObject);
begin
EditMode:=EM_DeleteLocationorPath;
end;
procedure TForm2.ToolButton6Click(Sender: TObject);
begin
EditMode:=EM_NewPath;
end;
procedure TForm2.ToolButton5Click(Sender: TObject);
begin
EditMode:=EM_MoveLocation;
end;

procedure TForm2.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     MouseDownCoords.x:=GetDMousex(x);
     MouseDownCoords.y:=GetDMousey(y);
     x:=GetDMousex(x);
     y:=GetDMousey(y);
     ShiftPressed:=false;
     if ssShift in Shift then ShiftPressed:=true;

   ///  if ShiftPressed then showmessage('qqqqqqqqq');

    if IsStatisticsCalculating then exit;

    if  Button=mbLeft then MouseLeftPressed:=true
                      else begin
                                MouseLeftPressed:=false;
                                ProcessRightClick;
                      end;

if LocationSelectedIndex>0 then else begin
    ReSetPath:=Game.GetClosestPath(X,Y);
    If ReSetPath<0 then ReSetPath:=0;
end
end;

procedure TForm2.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     MouseUpCoords.x:=GetDMousex(x);
     MouseUpCoords.y:=GetDMousey(y);
end;

procedure TForm2.ToolButton9Click(Sender: TObject);
begin
  if IsStatisticsCalculating then exit;
        inc(ActiveChildsCount);
        Form4.FormGame.CopyDataFrom(Game);
        Form4.ShowModal;
        dec(ActiveChildsCount);
        if Form4.is_ok_pressed then begin
        	Game.CopyDataFrom(Form4.FormGame);
        	FinePositionLocations;
        	Game.RecalculatePathes;
        	TraceForClosedLocations;
        	NiceRepaint;
        	MakeDo;
        	NeedToSaveChanges:=false;
        end;
end;

procedure TForm2.PrintPathStatistics(PathIndex:integer);
var q,t:integer;
    temp,temp1,temp2,temp3,temp4,temp5,a,b,c:widestring;
    NeedSeparator:boolean;
    mcolor:TColor;
begin
        ClearStatusPanel;
        StatusPanel.Color:=PathHelpPanelColor;

       AddDoubleStroke('','P '+inttostr(Game.Pathes[PathIndex].PathNumber),clBlack);

        temp:='';
		if form8.OneQuestionPathes[Pathindex] then begin
			temp:=temp+'спорный '
        end;
        if Game.PathIsVoid(PathIndex) then begin
        	temp:=temp+'пустой ';
        end;
		if form8.OneQuestionPathes[Pathindex] and  Game.PathIsVoid(PathIndex) then begin
	        AddSingleStroke(temp,clBlack);
			temp:='';
        end;

        with Game.Pathes[PathIndex] do begin
         	 if not ((Form8.OneQuestionPathes[PathIndex])or(Game.PathIsVoid(PathIndex)))  then begin
                if Probability>=1 then begin
         			if trim(EndPathMessage.text)='' then temp:='- переход без описания -'
													else temp:='- переход с описанием -';
                end else begin
                	temp:=temp+'переход с вероятностью '+floattostr(Game.Pathes[PathIndex].Probability);
                end;
                AddSingleStroke(temp,clBlack);
             end else begin
             	temp:=temp+'переход с приоритетом '+floattostr(Game.Pathes[PathIndex].Probability);
		        AddSingleStroke(temp,clBlack);
             end;
             AddSeparator;
         end;
        if not (trim(Game.Pathes[PathIndex].StartPathMessage.Text)='') then begin
         AddSingleStroke (trim(Game.Pathes[PathIndex].StartPathMessage.Text),clBlue);
         AddSeparator;
        end;
         if trim(Game.Pathes[PathIndex].LogicExpression.Text)<>'' then begin
         	AddSingleStroke(StringReplace(trim(Game.Pathes[PathIndex].LogicExpression.Text),'&','&&'),clBlack);
            AddSeparator;
         end;
         NeedSeparator:=false;
      for q:=1 to maxparameters do begin
          if Game.Pars[q].Enabled then  begin

			case Form8.ParameterActivePathes[PathIndex][q] of
               FailParType: mcolor:=clRed;
               SuccessParType: mcolor:=clGreen;
               NoCriticalParType: mcolor:=clBlack;
               else mcolor:=clblack;
			end;

			temp1:=trim(game.Pars[q].Name.text);
			if ParNameHelpPanelType=0 then begin
				temp1:=trim(game.Pars[q].Name.text);
			end else
			if ParNameHelpPanelType=1 then begin
				temp1:='[p'+inttostr(q)+'] ';
			end else
			if ParNameHelpPanelType=2 then begin
        	 	temp1:='[p'+inttostr(q)+'] ('+trim(game.Pars[q].Name.text)+')';
			end;

         if (game.pathes[PathIndex].DPars[q].Min<>game.pars[q].GetDefaultMinGate)
             or
            (game.pathes[PathIndex].DPars[q].Max<>game.pars[q].GetDefaultMaxGate) then
         temp2:= '['+inttostr(game.pathes[PathIndex].DPars[q].Min)+
         '..' + inttostr(game.pathes[PathIndex].DPars[q].Max) + '] '
         else temp2:='';

         temp:='';

         if game.Pathes[PathIndex].DPars[q].DeltaExprFlag then begin
         	temp:=trim(game.Pathes[PathIndex].DPars[q].Expression.Text);
            if temp<>'' then temp:=':= '+temp;
         end else begin
         	if game.pathes[PathIndex].DPars[q].DeltaApprFlag then temp:=':= ';
         	if (game.pathes[PathIndex].DPars[q].delta>0)and (not game.pathes[PathIndex].DPars[q].DeltaApprFlag)then temp:=temp+'+';
            t:=game.pathes[PathIndex].DPars[q].delta;
            if game.Pathes[PathIndex].DPars[q].DeltaPercentFlag then begin
               if t>100 then t:=100;
               if t<-100 then t:=-100;
            end;
         	if game.pathes[PathIndex].DPars[q].delta<>0 then temp:=temp+inttostr(t)else temp:='';
         	if (temp='')and(game.pathes[PathIndex].DPars[q].DeltaApprFlag) then temp:=':= 0';
         	if (not game.Pathes[PathIndex].DPars[q].DeltaApprFlag)and(game.Pathes[PathIndex].DPars[q].DeltaPercentFlag)and(temp<>'') then temp:=temp + '%';
         end;

          temp3:='';
          if Game.Pathes[PathIndex].DPars[q].ParameterViewAction=1
            then temp3:=' (показать) '
          else
          if Game.Pathes[PathIndex].DPars[q].ParameterViewAction=2
            then temp3:=' (скрыть) ';

         temp4:='';
          if Game.Pathes[PathIndex].DPars[q].ValuesGate.Count<>0 then begin
          	if Game.Pathes[PathIndex].DPars[q].ValuesGate.Negation then temp4:=temp4+' = '
            else  temp4:=temp4+' <> ';
            temp4:=temp4+Game.Pathes[PathIndex].DPars[q].ValuesGate.GetString;
          end;

          temp5:='';
    	  if Game.Pathes[PathIndex].DPars[q].ModZeroesGate.Count<>0 then begin
          	if Game.Pathes[PathIndex].DPars[q].ModZeroesGate.Negation then temp5:=temp5+' / '
            else  temp5:=temp5+' X ';
            temp5:=temp5+Game.Pathes[PathIndex].DPars[q].ModZeroesGate.GetString;
          end;

          if (temp3<>'')or(temp2<>'')or(temp<>'')or(temp4<>'')or(temp5<>'') then begin
            c:=temp1+temp3+': '+temp2;

            if length(c+temp5+temp4)>40 then begin
            	AddDoubleStroke(c,temp,mcolor);
                AddSingleStroke('   '+temp4+temp5,mcolor);
            	NeedSeparator:=true;
            end
            else begin
            	AddDoubleStroke(c+temp4+temp5,temp,mcolor);
            	NeedSeparator:=true;
            end;

          end;

        end;
     end;


     if NeedSeparator then AddSeparator;

     a:='';
     b:='';

     if Game.Pathes[PathIndex].dayscost=1 then a:='Прошел один день';
	 if Game.Pathes[pathIndex].PassTimesValue<>1 then begin
        if (Game.Pathes[pathIndex].PassTimesValue=0) then b:='Проходимость: неограниченная '
     	else b:='Проходимость: '+inttostr(Game.Pathes[pathIndex].PassTimesValue);
     end;
{     if (a<>'') and (b='') then AddSingleStroke(a,clBlack);
	 if (a='') and (b<>'') then AddSingleStroke(b,clBlack);
	 if (a<>'') and (b<>'') then AddDoubleStroke(a,b,clBlack);}
     if (a<>'') then AddSingleStroke(a,clBlack);
	 if (b<>'') then AddSingleStroke(b,clBlack);



     if Game.Pathes[PathIndex].AlwaysShowWhenPlaying then AddSingleStroke('Всегда показывать',clBlack);

     if CalculateFullStatisticsToolButton.Down then begin
     AddSingleStroke(
             myinttostr(form8.PathReaches[PathIndex]) + ' -> ' +
             myinttostr(form8.PathSuccessReaches[PathIndex]), clBlack);
     end;

     if Form8.PathReaches[PathIndex]<=0 then begin
      if CalculateFullStatisticsToolButton.Down then begin
        AddSingleStroke('Непроходимый переход',clRed);
      end;
     end
     else begin

     if not CalculateNoStatisticsToolButton.Down then begin
        if Form8.PathSuccessReaches[PathIndex]<=0 then
        AddSingleStroke('Не имеет успешных путей',clRed);
     end;
     end;
end;

procedure Tform2.PrintLocationStatistics(LocationIndex:integer);
var q,t:integer;
    temp0,temp,temp1,temp2,temp3,MiniStr:widestring;
    NeedSeparator:boolean;
    mcolor:TColor;
begin
	ClearStatusPanel;
    StatusPanel.color:=LocationHelpPanelColor;

	with Game.Locations[LocationIndex] do begin
		if StartLocationFlag then temp:='- стартовая'else
        if EndLocationFlag then temp:='- финальная'else
        if FailLocationFlag then temp:='- провальная'else begin
        	if Game.Locations[LocationIndex].VoidLocation then begin
           		temp:='- пустая';
			end else begin
				temp:='- промежуточная';
       		end;
		end;
	end;

	AddDoubleStroke('','L '+inttostr(Game.Locations[LocationIndex].LocationNumber),clBlack);
	AddSingleStroke(temp+' локация -', clBlack);
	AddSeparator;
	Game.Locations[LocationIndex].FindLocationDescription(true);
	if length(trim(Game.Locations[LocationIndex].LocationDescription.Text))<255 then
    	AddSingleStroke(trim(Game.Locations[LocationIndex].LocationDescription.Text), clBlue)
    else begin
    	MiniStr:=trim(Game.Locations[LocationIndex].LocationDescription.Text);
    	SetLength(MiniStr,255);
        AddSingleStroke(MiniStr+' ...', clBlue);
    end;
    AddSeparator;
    NeedSeparator:=false;

    if (form8.LocationReaches[LocationIndex]>0) or CalculateNoStatisticsToolButton.Down then begin
    	for q:=1 to maxparameters do begin
			if Game.Pars[q].Enabled then begin

            	case Form8.ParameterActiveLocations[LocationIndex][q] of

	                FailParType: mcolor:=clRed;
	                SuccessParType: mcolor:=clGreen;
	                NoCriticalParType: mcolor:=clBlack;
                	else mcolor:=clblack;
	            end;

          if game.Locations[LocationIndex].DPars[q].DeltaExprFlag then begin
          	temp2:=trim(game.Locations[LocationIndex].DPars[q].Expression.Text);
            if temp2<>'' then temp:=':= '+temp2;
          end else begin
	          if (game.Locations[LocationIndex].DPars[q].delta>0)and(not game.Locations[LocationIndex].DPars[q].DeltaApprFlag) then temp2:='+' else temp2:='';
              t:=game.Locations[LocationIndex].DPars[q].delta;
              if game.Locations[LocationIndex].DPars[q].DeltaPercentFlag then begin
                  if t>100 then t:=100;
                  if t<-100 then t:=-100;
              end;
	          temp2:=temp2+inttostr(t);
	          if (not game.Locations[LocationIndex].DPars[q].DeltaApprFlag)and(game.Locations[LocationIndex].DPars[q].DeltaPercentFlag) then temp2:=temp2 + '%';
	          if game.Locations[LocationIndex].DPars[q].DeltaApprFlag then temp2:=':= '+temp2;
	          if (game.Locations[LocationIndex].DPars[q].delta=0)and(not game.Locations[LocationIndex].DPars[q].DeltaApprFlag) then temp2:='';
          end;
          if not CalculateNoStatisticsToolButton.Down then begin
            temp0:=inttostr(form8.ParameterMins[LocationIndex][q])+'..'+
                   inttostr(form8.ParameterMaxes[LocationIndex][q]);
          end else begin
            temp0:='';
          end;

          temp3:='';
          if Game.Locations[LocationIndex].DPars[q].ParameterViewAction=1
            then temp3:=' (показать) '
          else
          if Game.Locations[LocationIndex].DPars[q].ParameterViewAction=2
          	then temp3:=' (скрыть) ';

			temp1:=trim(game.Pars[q].Name.text);
			if ParNameHelpPanelType=0 then begin
				temp1:=trim(game.Pars[q].Name.text);
			end else
			if ParNameHelpPanelType=1 then begin
				temp1:='[p'+inttostr(q)+'] ';
			end else
			if ParNameHelpPanelType=2 then begin
        	 	temp1:='[p'+inttostr(q)+'] ('+trim(game.Pars[q].Name.text)+')';
			end;

          if (temp3<>'')or(temp0<>'')or(temp2<>'') then begin
			if (not(temp2='')) then
             AddDoubleStroke(temp1 + temp3 + ': ' + temp0,temp2,mcolor)
            else
             AddDoubleStroke(temp1 + temp3 + ': ' + temp0,'',mcolor);

            NeedSeparator:=true;
          end;

          end;
        end;


     if NeedSeparator then AddSeparator;
	 if Game.Locations[LocationIndex].dayscost=1 then begin
     	AddSingleStroke('Прошел один день',clBlack);
//      AddSeparator;
     end;

       if CalculateFullStatisticsToolButton.Down then begin
        AddSingleStroke(
             myinttostr(form8.LocationReaches[LocationIndex]) + ' -> ' +
             myinttostr(form8.SuccessReaches[LocationIndex]), clBlack);
       end;

       temp:='';

       if not CalculateNoStatisticsToolButton.Down then begin
        if form8.SuccessReaches[LocationIndex]=0 then temp:='Не имеет успешных путей';
       end;
        if form8.noway2locations[LocationIndex] then temp:='Имеет безвыходные ситуации';
        if temp<>'' then AddSingleStroke(temp,clRed);

   end;


         if form8.LocationReaches[LocationIndex]=0 then begin
              if not CalculateNoStatisticsToolButton.Down then begin
                  temp:='Недосягаема';
                  AddSingleStroke(temp,clRed);
              end;
         end
         else if
          (not Game.HaveOutComePathes(Game.Locations[LocationIndex].LocationNumber))
          and
          (not Game.Locations[LocationIndex].EndLocationFlag) then begin

           temp:='Тупиковая';
           AddSingleStroke(temp,clRed);
         end;
end;

procedure TForm2.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var lx,ly:integer;
    i,c:integer;
    sx,sy:integer;
begin
	ClientMouseX:=x;
    ClientMouseY:=y;
     if LoadingData then exit;
     sx:=x;
     sy:=y;
     x:=GetDMousex(x);
     y:=GetDMousey(y);

     i:=Game.GetClosestLocation(x,y);
     if i>0 then begin
      lx:=Game.Locations[i].screenx;
      ly:=Game.Locations[i].screeny;
     end else begin
         lx:=maxint;
         ly:=maxint;
     end;

     c:=Game.GetClosestPath(x,y);

  if (i<=0) and (c<=0)  then  begin

       if not ((-1=LocationSelectedIndex) and (-1=PathSelectedIndex)) then begin

                          LocationSelectedIndex:=-1;
                          PathSelectedIndex:=-1;
                          ClearStatusPanel;
                          NiceRepaint;
       end;
       end else begin

       if (sqrt((lx-x)*(lx-x)+(ly-y)*(ly-y))
          <
          Game.GetPathDistance(c,x,y))


       then begin

         if (i<>LocationSelectedIndex) then begin

             LocationSelectedIndex:=i;
            PathSelectedIndex:=-1;
            NiceRepaint;

            if //CalculateFullStatisticsToolButton.Down and
             Form2.CalculateNoStatisticsToolButton.Down or
             Form8.StatisticsCalculated then begin
                PrintLocationStatistics(i);

                SetStatusPanelPosition(sx,sy);
                StatusPanel.Visible:=true;
            end;
          end;
       end
       else begin
         if c<>PathSelectedIndex then begin

          PathSelectedIndex:=c;
          LocationSelectedIndex:=-1;
          NiceRepaint;

          if //CalculateFullStatisticsToolButton.Down and
           Form2.CalculateNoStatisticsToolButton.Down or
           Form8.StatisticsCalculated then begin
             PrintPathStatistics(c);

             SetStatusPanelPosition(sx,sy);
             StatusPanel.Visible:=true;
          end;
         end;

       end;
   end;
  

end;

procedure TForm2.AboutButtonClick(Sender: TObject);
begin
//Form5.ShowModal;
end;

procedure TForm2.PlayButtonClick(Sender: TObject);
var i,c,cln:integer;
begin
// Ищем стартовую локацию (
         c:=0;
         cln:=0;

         for i:=1 to Game.LocationsValue do
          if Game.Locations[i].StartLocationFlag then begin
           cln:=Game.Locations[i].LocationNumber;
           inc(c);
          end;

        if c>1 then cln:=-1;

// Если не нашли, то обработать ошибку
    if cln=0 then begin
        ShowMessage('Не могу найти стартовую локацию');
    end else
// Если стартовых локаций больше одной, то обработать ошибку
    if cln=-1 then begin
        ShowMessage('Слишком много начальных локаций');

    end else  begin

       if Game.IsNoMeanCanPlay then begin
       	inc(ActiveChildsCount);
        Form6.PlayGame.CopyDataFrom(Game);
        Form6.ShowModal;
		dec(ActiveChildsCount);
       end
       else ShowMessage('Существуют тупиковые незначимые локации!');
    end;
end;

procedure TForm2.UndoButtonClick(Sender: TObject);
begin
  if IsStatisticsCalculating then exit;

MakeUndo;

TraceForClosedLocations;
NiceRepaint;
NeedToSaveChanges:=true;

end;

procedure TForm2.RedoButtonClick(Sender: TObject);
begin
  if IsStatisticsCalculating then exit;

MakeRedo;
TraceForClosedLocations;
NiceRepaint;
NeedToSaveChanges:=true;

end;

procedure TForm2.ColorOptionsButtonClick(Sender: TObject);
begin
  if IsStatisticsCalculating then exit;
Form7.LineFromColor:=LineFromColor;
Form7.LineToColor:=LineToColor;
Form7.VoidLineFromColor:=VoidLineFromColor;
Form7.VoidLineToColor:=VoidLineToColor;
Form7.PointerColor:=PointerColor;
Form7.StartLocationColor:=StartLocationColor;
Form7.EndLocationColor:=EndLocationColor;
Form7.FailLocationColor:=FailLocationColor;
Form7.DefaultLocationColor:=DefaultLocationColor;
Form7.ClosedLocationColor:=ClosedLOcationColor;
Form7.BackGroundColor:=BackGroundColor;
Form7.NoWay2Color:=NoWay2Color;
Form7.OneQuestionColor:=OneQuestionColor;
Form7.NoSuccessWaysColor:=NoSuccessWaysColor;
Form7.PathHelpPanelColor:=PathHelpPanelcolor;
Form7.LocationHelpPanelColor:=LocationHelpPanelcolor;
Form7.AbsPathColor:=AbsPathColor;
Form7.NotAbsPathColor:=NotAbsPathColor;
Form7.DrawPathType:=DrawPathType;
Form7.ParNameHelpPanelRG.ItemIndex:=ParNameHelpPanelType;
Form7.SameQNoDescrStartColor:=SameQNoDescrStartColor;
Form7.SameQNoDescrEndColor:=SameQNoDescrEndColor;
Form7.SameQDescrStartColor:=SameQDescrStartColor;
Form7.SameQDescrEndColor:=SameQDescrEndColor;
Form7.VoidObjectColor:=VoidObjectColor;
Form7.VoidObjectStartColor:=VoidObjectStartColor;

Form7.StatisticsCalculationTimerDelay:=StatisticsCalculationTimerDelay;

Form7.SPN:=SPN;
Form7.StatusPanelSflag:=StatusPanelSflag;

        inc(ActiveChildsCount);
Form7.ShowModal;
        dec(ActiveChildsCount);

if Form7.is_ok_pressed then begin
LineFromColor:=Form7.LineFromColor;
LineToColor:=Form7.LineToColor;
VoidLineFromColor:=Form7.VoidLineFromColor;
VoidLineToColor:=Form7.VoidLineToColor;
PointerColor:=Form7.PointerColor;
StartLocationColor:=Form7.StartLocationColor;
EndLocationColor:=Form7.EndLocationColor;
FailLocationColor:=Form7.FailLocationColor;
DefaultLocationColor:=Form7.DefaultLocationColor;
ClosedLocationColor:=Form7.ClosedLocationColor;
BackGroundColor:=Form7.BackGroundColor;
NoWay2Color:=Form7.NoWay2Color;
OneQuestionColor:=Form7.OneQuestionColor;
NoSuccessWaysColor:=Form7.NoSuccessWaysColor;
PathHelpPanelColor:=Form7.PathHelpPanelcolor;
LocationHelpPanelColor:=Form7.LocationHelpPanelcolor;

StatisticsCalculationTimerDelay:=Form7.StatisticsCalculationTimerDelay;
Form2.StatisticsTimer.Interval:=StatisticsCalculationTimerDelay;

AbsPathColor:=Form7.AbsPathColor;
NotAbsPathColor:=Form7.NotAbsPathColor;
DrawPathType:=Form7.DrawPathType;
ParNameHelpPanelType:=Form7.ParNameHelpPanelRG.ItemIndex;
SameQNoDescrStartColor:=Form7.SameQNoDescrStartColor;
SameQNoDescrEndColor:=Form7.SameQNoDescrEndColor;
SameQDescrStartColor:=Form7.SameQDescrStartColor;
SameQDescrEndColor:=Form7.SameQDescrEndColor;
VoidObjectColor:=Form7.VoidObjectColor;
VoidObjectStartColor:=Form7.VoidObjectStartColor;
SPN:=Form7.SPN;
StatusPanelSflag:=Form7.StatusPanelSflag;
SaveEditorOptions(ConfigFilePath);
NiceRepaint;
end;

end;

procedure TForm2.FormResize(Sender: TObject);
begin
if LoadingData then exit;
DrawBuffer.Height:=Height;
DrawBuffer.Width:=Width;
PositionLocationsAfterLoad;
Game.RecalculatePathes;

end;

procedure TForm2.FormShow(Sender: TObject);
var i:integer;
begin

 WindowState:=wsMaximized;
 JustLoaded:=false;

 for i:=1 to maxstatuspanellabels do begin
       Labels[i].parent:=StatusPanel;
 end;
 ClearStatusPanel;
 ShiftPressed:=false;

 maxedx:=GetMaxEDX;
 maxedy:=GetMaxEDY;

Caption:=M.Par_Get('Form2NewFileCaption');
NewGameButton.Hint:=M.Par_Get('Form2NewButtonHint');
LoadGameButton.Hint:=M.Par_Get('Form2LoadGameButtonHint');
SaveGameButton.Hint:=M.Par_Get('Form2SaveGameButtonHint');
UndoButton.Hint:=M.Par_Get('Form2UndoButtonHint');
RedoButton.Hint:=M.Par_Get('Form2RedoButtonHint');
ToolButton2.Hint:=M.Par_Get('Form2NewLocationButtonHint');
ToolButton4.Hint:=M.Par_Get('Form2DeleteLocationButtonHint');
//ToolButton5.Hint:=M.Par_Get('Form2MoveLocationButtonHint');
ToolButton6.Hint:=M.Par_Get('Form2NewPathButtonHint');
ToolButton7.Hint:=M.Par_Get('Form2DeletePathButtonHint');
ToolButton9.Hint:=M.Par_Get('Form2EditGamePropertiesButtonHint');
PlayButton.Hint:=M.Par_Get('Form2PlayButtonHint');
ColorOptionsButton.Hint:=M.Par_Get('Form2ColorOptionsButtonHint');

CalculateFullStatisticsToolButton.Hint:=M.Par_Get('Form2CalculateFullStatisticsToolButtonHint');
CalculateRedusedStatisticsToolButton.Hint:=M.Par_Get('Form2CalculateRedusedStatisticsToolButtonHint');
CalculateNoStatisticsToolButton.Hint:=M.Par_Get('Form2CalculateNoStatisticsToolButtonHint');


//HelpStatusBar.Hint:=M.Par_Get('Form2HelpStatusBarHint');
StatisticsButton.Hint:=M.Par_Get('Form2StatisticsButtonHint');
end;

procedure TForm2.StatisticsButtonClick(Sender: TObject);
var startlocationcount,i:integer;
begin
	if IsStatisticsCalculating then exit;
	startlocationcount:=0;
	for i:=1 to Game.LocationsValue do begin
    	if Game.Locations[i].StartLocationFlag then  inc(startlocationcount);
    end;
	if startlocationcount<2 then begin
		inc(ActiveChildsCount);
    	Form8.quest.CopyDataFrom(Game);
        Form8.ShowModal;
		dec(ActiveChildsCount);
	end else begin
    	showmessage(M.Par_Get('Form2TooManyStartLocations'));
    end;
end;

procedure TForm2.CalculateFullStatisticsToolButtonClick(Sender: TObject);
begin
  if IsStatisticsCalculating then exit;

                                TraceForClosedLocations;
                                NiceRepaint;
end;

procedure TForm2.StatusPanelMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
OnMouseMove(Sender,shift,x,y);

end;

procedure TForm2.StatisticsTimerTimer(Sender: TObject);
begin
Form8.CalculationBreak:=true;
Form2.StatisticsTimer.Enabled:=false;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var t:TModalResult;
begin
if NeedToSaveChanges then begin

  CanClose:=false;

  t:= MessageDlg('Выход из программы. Сохранить изменения?',
         mtConfirmation, [mbYes, mbNo, mbCancel], 0);

  if t=mrYes then  begin
         Form2.SaveGameButton.Click;
         if NeedToSaveChanges then CanClose:=false else CanClose:=true;
  end;

  if t=mrNo then CanClose:=true;

  if t=mrCancel then CanClose:=false;

end else CanClose:=true;

end;

procedure TForm2.CalculateRedusedStatisticsToolButtonClick(
  Sender: TObject);
begin
if IsStatisticsCalculating then exit;

                                TraceForClosedLocations;
                                NiceRepaint;
end;

procedure TForm2.CalculateNoStatisticsToolButtonClick(Sender: TObject);
begin
if IsStatisticsCalculating then exit;

                                TraceForClosedLocations;
                                NiceRepaint;
end;

procedure TForm2.ScrollTimerTimer(Sender: TObject);
var NeedRepaint:boolean;
	FreeScroll:boolean;
    maxndx:integer;
    maxndy:integer;
begin
	NeedRepaint:=false;
    FreeScroll:=FreeScrollButton.Down;

    with Game do begin
		if FreeScroll then begin
        	maxndx:=maxedx-BlockXgradient+BlockXgradient div 3;
        	maxndy:=maxedy-BlockYgradient+BlockYgradient div 3;
    	end else begin
        	maxndx:=maxedx-BlockXgradient;
        	maxndy:=maxedy-BlockYgradient;
    	end;
    end;

	if OnNiceRepaintFlag or
    	LoadingData or
        (ActiveChildsCount>0) or
        (Form8.StatisticsIsCalculating) or
        (Game.LocationsValue=0)or
        (not Form2.Active)then begin
    	exit;
    end else begin
        if (ClientMouseX<(ClientWidth div 30)*1)then begin
        	if ndx>0 then begin
                	dec(ndx);
                    NeedRepaint:=true;
            end;
        end;
        if (ClientMouseY<(ClientHeight div 24)*2.3)
        		and
        	(ClientMouseY>30)
            	and
            (FreeScroll) then begin
	       	if ndy>0 then begin
                	dec(ndy);
                    NeedRepaint:=true;
            end;
        end;
        if (ClientMouseX>(ClientWidth div 30)*(30-1)) then begin
        	if ndx div Game.BlockXgradient+1 < scrymaxvalue then begin
            	if maxndx>ndx then begin
                	inc(ndx);
                    NeedRepaint:=true;
 				end;
            end;
        end;
        if (ClientMouseY>(ClientHeight div 24)*(24-1)) then begin
        	if ndy div Game.BlockYgradient+1 < scrymaxvalue then begin
				if maxndy>ndy then begin
                	inc(ndy);
                    NeedRepaint:=true;
 				end;
            end;
        end;
    	if NeedRepaint then NiceRepaint;
    end;
end;

procedure TForm2.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_F9 then begin
	PlayButton.OnClick(sender);
end;
end;

procedure TForm2.ToolBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.NewGameButtonMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.LoadGameButtonMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.SaveGameButtonMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.UndoButtonMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.RedoButtonMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
     ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton7MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton14MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
     ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton9MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton8MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.StatisticsButtonMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton15MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.CalculateFullStatisticsToolButtonMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.CalculateRedusedStatisticsToolButtonMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.CalculateNoStatisticsToolButtonMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
     ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton10MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
     ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.PlayButtonMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton13MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ColorOptionsButtonMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.ToolButton11MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.FreeScrollButtonMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    ClientMouseX:=ClientWidth div 2;
    ClientMouseY:=ClientHeight div 2;
end;

procedure TForm2.FreeScrollButtonClick(Sender: TObject);
begin
	ConfigFilePath:=GetCurrentDir + '\' + EditorConfFile;
	SaveEditorOptions(ConfigFilePath);
end;

procedure TForm2.NavigateToolButtonClick(Sender: TObject);
begin
	LPSearchForm.Show;
end;

end.
