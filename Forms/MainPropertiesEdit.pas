unit MainPropertiesEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Math,
  GameContent,
  ParameterClass,
  ValueListClass,
  CPDiapClass,
  CalcParseClass,
  ParameterDeltaClass,
  MessageText,
  ExtCtrls, EC_BlockPar, Gauges, Tabs, CheckLst;

type PM=^TBlockParEC;
//type PParEnabledCBs=^TCheckBox;
//type PParSelectRBs=^TRadioButton;
type PVFedit=^TEdit;


type
  TForm4 = class(TForm)
    CancelButton: TButton;
    OkButton: TButton;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    PageControl3: TPageControl;
    
    Edit1: TEdit;
    Edit2: TEdit;
    
    ToStarEdit: TEdit;
    ToPlanetEdit: TEdit;
    FromPlanetEdit: TEdit;
    FromStarEdit: TEdit;
    RangerEdit: TEdit;

    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    X1RB: TRadioButton;
    X2RB: TRadioButton;
    X3RB: TRadioButton;
    X4RB: TRadioButton;
    Y1RB: TRadioButton;
    Y2RB: TRadioButton;
    Y3RB: TRadioButton;
    Y4RB: TRadioButton;

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
    Label12: TLabel;
    Label11: TLabel;

    Label20: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;

    QuestDescriptionEdit: TMemo;

    PlanetReactionGroupBox: TGroupBox;
    PlanetReactionTrackBar: TTrackBar;
    PlanetReactionLabel1: TLabel;
    PlanetReactionLabel2: TLabel;
    PlanetReactionLabel3: TLabel;

    PlanetReactionGauge: TGauge;    

    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet14: TTabSheet;

    ParCustomizePanel: TPanel;

    QuestSuccessGovMessageEdit: TMemo;
    
    NeedToReturnGroupBox: TGroupBox;
    NeedToReturnNoRadioButton: TRadioButton;
    NeedToReturnYesRadioButton: TRadioButton;

    ParValueLabel: TLabel;

    ParViewActionRG: TRadioGroup;
    ParDeltaTrackBar: TTrackBar;
    RadioGroup1: TRadioGroup;
    ParNameEdit: TEdit;
    RadioGroup2: TRadioGroup;
    ShowIfZeroRadioGroup: TRadioGroup;
    ParCriticalMessageMemo: TMemo;

    VF1Edit: TEdit;
    VF2Edit: TEdit;
    VF3Edit: TEdit;
    VF4Edit: TEdit;
    VF5Edit: TEdit;
    VF6Edit: TEdit;
    VF7Edit: TEdit;
    VF8Edit: TEdit;
    VF9Edit: TEdit;
    VF10Edit: TEdit;
    
    VFGateMax1Edit: TEdit;
    VFGateMax2Edit: TEdit;
    VFGateMax3Edit: TEdit;
    VFGateMax4Edit: TEdit;
    VFGateMax5Edit: TEdit;
    VFGateMax6Edit: TEdit;
    VFGateMax7Edit: TEdit;
    VFGateMax8Edit: TEdit;
    VFGateMax9Edit: TEdit;
    VFGateMax10Edit: TEdit;
    
    VFGateMin1Edit: TEdit;
    VFGateMin2Edit: TEdit;
    VFGateMin3Edit: TEdit;
    VFGateMin4Edit: TEdit;
    VFGateMin5Edit: TEdit;
    VFGateMin6Edit: TEdit;
    VFGateMin7Edit: TEdit;
    VFGateMin8Edit: TEdit;
    VFGateMin9Edit: TEdit;
    VFGateMin10Edit: TEdit;

    ParVolVFStringsTrackBar: TTrackBar;

    ParVolVFStringsLabel: TLabel;
    VFValTrackBarGroundShape: TShape;
    VFValTrackBarLeftImage: TImage;
    VFValTrackBarButtonShape: TShape;
    VFValTrackBarRightImage: TImage;
    TrackBarGroundShape: TShape;
    TrackBarLeftImage: TImage;
    TrackBarButtonShape: TShape;
    TrackBarRightImage: TImage;

    IsPlayerMoneyParCheckBox: TCheckBox;

    RaceGroupBox: TGroupBox;
    TargetRaceGroupBox: TGroupBox;
    RMaloc: TCheckBox;
    RPeleng: TCheckBox;
    RPeople: TCheckBox;
    RFei: TCheckBox;
    RGaal: TCheckBox;
    TPeleng: TCheckBox;
    TMaloc: TCheckBox;
    TPeople: TCheckBox;
    TFei: TCheckBox;
    TGaal: TCheckBox;
    TNone: TCheckBox;
    DefUnlPathGoTimesCheck: TCheckBox;
    DefPathGoTimesEdit: TEdit;
    RSGroupBox: TGroupBox;
    RRGroupBox: TGroupBox;
    RSWarrior: TCheckBox;
    RSTrader: TCheckBox;
    RSPirate: TCheckBox;
    RRMaloc: TCheckBox;
    RRPeople: TCheckBox;
    RRGaal: TCheckBox;
    RRFei: TCheckBox;
    RRPeleng: TCheckBox;
    QuestDifficultyGroupBox: TGroupBox;
    QuestDifficultyGauge: TGauge;
    QuestDifficultyTrackBar: TTrackBar;

    MinGateEdit: TEdit;
    MaxGateEdit: TEdit;
    AltStartValuesEdit: TEdit;
    ParList: TCheckListBox;
    Label13: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure ProcessEnabledControls;
    procedure AParActiveCheckClick(Sender: TObject);
    procedure BParActiveCheckClick(Sender: TObject);
    procedure CParActiveCheckClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure X1RBClick(Sender: TObject);
    procedure X2RBClick(Sender: TObject);
    procedure X3RBClick(Sender: TObject);
    procedure X4RBClick(Sender: TObject);

    procedure ResizeToNewGradient(new_xg,new_yg:integer);
    procedure CorrectPathThingParameters;
    procedure DParActiveCheckClick(Sender: TObject);
    procedure EParActiveCheckClick(Sender: TObject);
    procedure FParActiveCheckClick(Sender: TObject);
    procedure PlanetReactionTrackBarChange(Sender: TObject);
    {procedure ParEnabledCB1Click(Sender: TObject);
    procedure ParEnabledCB2Click(Sender: TObject);
    procedure ParEnabledCB3Click(Sender: TObject);
    procedure ParEnabledCB4Click(Sender: TObject);
    procedure ParEnabledCB5Click(Sender: TObject);
    procedure ParEnabledCB6Click(Sender: TObject);
    procedure ParEnabledCB7Click(Sender: TObject);
    procedure ParEnabledCB8Click(Sender: TObject);
    procedure ParEnabledCB9Click(Sender: TObject);
    procedure ParRadioButton1Click(Sender: TObject);
    procedure ParRadioButton2Click(Sender: TObject);
    procedure ParRadioButton3Click(Sender: TObject);
    procedure ParRadioButton4Click(Sender: TObject);
    procedure ParRadioButton5Click(Sender: TObject);
    procedure ParRadioButton6Click(Sender: TObject);
    procedure ParRadioButton7Click(Sender: TObject);
    procedure ParRadioButton8Click(Sender: TObject);
    procedure ParRadioButton9Click(Sender: TObject);}
    procedure ParNameEditChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ParViewActionRGClick(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure ParCriticalMessageMemoChange(Sender: TObject);
    procedure ParDeltaTrackBarChange(Sender: TObject);
    procedure MinGateEditChange(Sender: TObject);
    procedure MaxGateEditChange(Sender: TObject);
    procedure RangerEditChange(Sender: TObject);
    procedure ToPlanetEditChange(Sender: TObject);
    procedure ToStarEditChange(Sender: TObject);
    procedure FromPlanetEditChange(Sender: TObject);
    procedure FromStarEditChange(Sender: TObject);

    procedure ProcessRightParameterClick(parnum:integer);

    {procedure ParRadioButton1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton4MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton5MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton6MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton7MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton8MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton9MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);}
    procedure ParGameNameEditChange(Sender: TObject);
    procedure ShowIfZeroRadioGroupClick(Sender: TObject);
    procedure NeedToReturnNoRadioButtonClick(Sender: TObject);
    procedure NeedToReturnYesRadioButtonClick(Sender: TObject);
    procedure ShowParVF;
    function GetAvailDiapasones:integer;
    procedure SetDefaultDiapasones;
    procedure ResetDiapasones(StartVF,VolOfVF,mincust,maxcust:integer; part:boolean);
    procedure ParVolVFStringsTrackBarChange(Sender: TObject);
    procedure ProcessOnDiapasoneEnter(VFNum,VFValueExternal:integer; minedit:boolean);

    function  VFDiapasonesAreValid(var quest:TGame):boolean;

    procedure RedrawVFValParTrackBar;
    procedure RedrawParDeltaTrackBar;

    procedure VF1EditChange(Sender: TObject);
    procedure VF2EditChange(Sender: TObject);
    procedure VF3EditChange(Sender: TObject);
    procedure VF4EditChange(Sender: TObject);
    procedure VF5EditChange(Sender: TObject);
    procedure VF6EditChange(Sender: TObject);
    procedure VF7EditChange(Sender: TObject);
    procedure VF8EditChange(Sender: TObject);
    procedure VF9EditChange(Sender: TObject);
    procedure VF10EditChange(Sender: TObject);
    procedure VFGateMin2EditClick(Sender: TObject);
    procedure VFGateMin3EditClick(Sender: TObject);
    procedure VFGateMin4EditClick(Sender: TObject);
    procedure VFGateMin5EditClick(Sender: TObject);
    procedure VFGateMin6EditClick(Sender: TObject);
    procedure VFGateMin7EditClick(Sender: TObject);
    procedure VFGateMin8EditClick(Sender: TObject);
    procedure VFGateMin9EditClick(Sender: TObject);
    procedure VFGateMax1EditClick(Sender: TObject);
    procedure VFGateMax2EditClick(Sender: TObject);
    procedure VFGateMax3EditClick(Sender: TObject);
    procedure VFGateMax4EditClick(Sender: TObject);
    procedure VFGateMax5EditClick(Sender: TObject);
    procedure VFGateMax6EditClick(Sender: TObject);
    procedure VFGateMax7EditClick(Sender: TObject);
    procedure VFGateMax8EditClick(Sender: TObject);
    procedure VFGateMax9EditClick(Sender: TObject);
    procedure VFGateMin10EditClick(Sender: TObject);
    procedure VFValTrackBarGroundShapeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure VFValTrackBarGroundShapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure VFValTrackBarLeftImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure VFValTrackBarRightImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure VFValTrackBarLeftImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure VFValTrackBarRightImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarLeftImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarRightImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarLeftImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarRightImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarGroundShapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrackBarGroundShapeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PageControl3Change(Sender: TObject);
    {procedure ParEnabledCB10Click(Sender: TObject);
    procedure ParEnabledCB11Click(Sender: TObject);
    procedure ParEnabledCB12Click(Sender: TObject);
    procedure ParRadioButton10Click(Sender: TObject);
    procedure ParRadioButton11Click(Sender: TObject);
    procedure ParRadioButton12Click(Sender: TObject);
    procedure ParRadioButton10MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton11MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton12MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);}
    procedure IsPlayerMoneyParCheckBoxClick(Sender: TObject);
    procedure ParTabSetChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);

    //procedure ProcessParTab(nt: integer);
    //procedure ProcessTabParSelect(nt: integer);

    {procedure ParEnabledCB13Click(Sender: TObject);
    procedure ParEnabledCB14Click(Sender: TObject);
    procedure ParEnabledCB15Click(Sender: TObject);
    procedure ParEnabledCB16Click(Sender: TObject);
    procedure ParEnabledCB17Click(Sender: TObject);
    procedure ParEnabledCB18Click(Sender: TObject);
    procedure ParEnabledCB19Click(Sender: TObject);
    procedure ParEnabledCB20Click(Sender: TObject);
    procedure ParEnabledCB21Click(Sender: TObject);
    procedure ParEnabledCB22Click(Sender: TObject);
    procedure ParEnabledCB23Click(Sender: TObject);
    procedure ParEnabledCB24Click(Sender: TObject);
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
    procedure ParRadioButton13MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton14MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton15MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton16MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton17MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton18MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton19MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton20MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton21MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton22MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton23MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ParRadioButton24MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);}

    procedure AltStartValuesEditChange(Sender: TObject);

    procedure FixStringsForRightClickParameters(secondparameter:integer);
    procedure DefUnlPathGoTimesCheckClick(Sender: TObject);
    procedure DefPathGoTimesEditChange(Sender: TObject);
    procedure QuestDifficultyTrackBarChange(Sender: TObject);
    procedure ParListClick(Sender: TObject);
    procedure ParListClickCheck(Sender: TObject);

  private
    { Private declarations }
  public
     M:PM;
     is_ok_pressed:boolean;
     FormGame:TGame;

     //ParEnabledCBs: array [1..maxparameters] of PParEnabledCBs;
     //ParSelectRBs: array [1..maxparameters] of PParSelectRBs;
    // oldmin,oldmax: array [1..maxparameters] of integer;
     SelectedParameter: integer;

     OldPars: array [1..maxparameters] of TParameter;

     CLabels: array [1..12] of TLabel;
     //PRButtons: array [1..maxparameters] of TRadioButton;
     //PEChecks: array [1..maxparameters] of TCheckBox;

     VFGateMinEdits, VFGateMaxEdits, VFEdits: array [1..maxformatviewstrings] of PVFedit;
     VFShowMode: boolean;
     RightClickedParameter: integer;
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.DFM}

{procedure TForm4.ProcessTabParSelect(nt:integer);
var flag:boolean;
begin
        flag:=SelectedParameter<>0;

        if ((SelectedParameter>=13) and (nt=0))
        	or
           ((SelectedParameter<13) and (nt=1))then flag:=false;

        ParCustomizePanel.Visible:=flag;
end;}

{procedure TForm4.ProcessParTab(nt:integer);
var i:integer;
begin
		if (nt=0) then begin
			for i:=1 to 12 do CLabels[i].Caption:='[p'+inttostr(i)+']';
        	for i:=1 to 12 do begin
            	PRButtons[i].visible:=true;
                PEChecks[i].Visible:=true;
            end;
        	for i:=13 to 24 do begin
            	PRButtons[i].visible:=false;
                PEChecks[i].Visible:=false;
            end;
        end
        else begin
			for i:=1 to 12 do CLabels[i].Caption:='[p'+inttostr(i+12)+']';
        	for i:=1 to 12 do begin
            	PRButtons[i].visible:=false;
                PEChecks[i].Visible:=false;
            end;
        	for i:=13 to 24 do begin
            	PRButtons[i].visible:=true;
                PEChecks[i].Visible:=true;
            end;
        end;
end;}

procedure Tform4.RedrawVFValParTrackBar;
var
    currentposition:integer;
    step:real;
begin

     step:=VFValTrackBarGroundShape.Width / (ParVolVFStringsTrackBar.Max-1);

     currentposition:=
       trunc(
              (ParVolVFStringsTrackBar.Position-1)*step
             )
       +
       VFValTrackBarGroundShape.Left+1;

     VFValTrackBarButtonShape.Left:=currentposition - VFValTrackBarButtonShape.Width;

end;

procedure Tform4.RedrawParDeltaTrackBar;
var
    currentposition:integer;
    step:real;
   // i:integer;
begin

     //if ParDeltaTrackBar.Max-1=0 then
      //  step:=TrackBarGroundShape.Width
     //else
        step:=TrackBarGroundShape.Width
              /
             (ParDeltaTrackBar.Max-ParDeltaTrackBar.Min);


     currentposition:=
       trunc(
              (ParDeltaTrackBar.Position+(-ParDeltaTrackBar.Min))*step
             )
       +
       TrackBarGroundShape.Left+1;

     TrackBarButtonShape.Left:=currentposition - TrackBarButtonShape.Width;

end;


function  TForm4.VFDiapasonesAreValid(var quest:TGame):boolean;
var answer:boolean;
    i,d,c:integer;
begin
     answer:=true;



     for i:=1 to quest.Pars[SelectedParameter].ValueOfViewStrings-1 do begin

         if (quest.Pars[SelectedParameter].ViewFormatStrings[i].max
             >
             quest.Pars[SelectedParameter].ViewFormatStrings[i+1].min)
              then begin answer:=false; end;
     end;

     for i:=1 to quest.Pars[SelectedParameter].ValueOfViewStrings do begin

         if (quest.Pars[SelectedParameter].ViewFormatStrings[i].max
             <
             quest.Pars[SelectedParameter].ViewFormatStrings[i].min)
              then begin answer:=false; end;
     end;


     for i:=1 to quest.Pars[SelectedParameter].ValueOfViewStrings-1 do begin

         if (
            abs(
             abs(quest.Pars[SelectedParameter].ViewFormatStrings[i].max)
                -
             abs(quest.Pars[SelectedParameter].ViewFormatStrings[i+1].min)
            )
             <>1) then begin answer:=false; end;
     end;

  

     d:=0;
     for i:=1 to quest.Pars[SelectedParameter].ValueOfViewStrings do begin

          d:=d+(quest.Pars[SelectedParameter].ViewFormatStrings[i].max)
                     -
               (quest.Pars[SelectedParameter].ViewFormatStrings[i].min);


     end;


     c:=quest.Pars[SelectedParameter].ValueOfViewStrings - 1;
 
     {     showmessage(inttostr(abs(d)+c) + ' : '+


     inttostr(abs(quest.Pars[SelectedParameter].max
                         -
                         quest.Pars[SelectedParameter].min)
      )

      );

}
    if (abs(d)+c)<>abs(quest.Pars[SelectedParameter].max
                         -
                         quest.Pars[SelectedParameter].min) then answer:=false;


     if (quest.Pars[SelectedParameter].min
         <>
         quest.Pars[SelectedParameter].ViewFormatStrings[1].min)
         or
        (quest.Pars[SelectedParameter].max
         <>
         quest.Pars[SelectedParameter].ViewFormatStrings[quest.Pars[SelectedParameter].ValueOfViewStrings].max)

         then answer:=false;
   
     VFDiapasonesAreValid:=answer;
end;

procedure TForm4.ProcessOnDiapasoneEnter(VFNum,VFValueExternal:integer; minedit:boolean);
var
    VFValue:integer;
    s:string;
    temp:TGame;
begin
     if VFShowMode then exit;
     s:=InputBox('TGE','Введите значение ','');
     if s='' then exit;
     VFValue:=strtoint(s);

     with FormGame.Pars[SelectedParameter] do begin

     	if ((minedit)and(ViewFormatStrings[VFNum].min=VFValue))or
        	((not minedit)and(ViewFormatStrings[VFNum].max=VFValue))then exit;

     	temp:=TGame.Create(GameContent.PM(M));
     	temp.CopyDataFrom(FormGame);

     	if minedit then begin
     		if ViewFormatStrings[VFNum].min>VFValue then begin
        		ResetDiapasones(1,VFNum-1,min,VFValue-1,true);
            	ViewFormatStrings[VFNum].min:=VFValue;
        	end;
            if ViewFormatStrings[VFNum].min<VFValue then begin
            	if ViewFormatStrings[VFNum].max<VFValue then begin
                	ResetDiapasones(VFNum,ValueOfViewStrings-VFNum+1,VFValue,max,true);
                end else begin
                	ViewFormatStrings[VFNum].min:=VFValue;
                end;
                ViewFormatStrings[VFNum-1].max:=VFValue-1;
            end;
     	end else begin
			if ViewFormatStrings[VFNum].max>VFValue then begin
                if ViewFormatStrings[VFNum].min>VFValue then begin
            		ResetDiapasones(1,VFNum,min,VFValue,true);
                end else begin
                	ViewFormatStrings[VFNum].max:=VFValue;
                end;
            	ViewFormatStrings[VFNum+1].min:=VFValue+1;
        	end;
            if ViewFormatStrings[VFNum].max<VFValue then begin
        		ResetDiapasones(VFNum+1,ValueOfViewStrings-VFNum,VFValue+1,max,true);
                ViewFormatStrings[VFNum].max:=VFValue;
            end;
     	end;
    end;

	if not VFDiapasonesAreValid(FormGame) then begin
		FormGame.CopyDataFrom(temp);
		ShowMessage('Введенное значение недопустимо');
	end;
	ShowParVF;
	temp.Destroy;
end;

procedure TForm4.SetDefaultDiapasones;
begin
	with FormGame.Pars[SelectedParameter] do begin
		ResetDiapasones(1,ValueOfViewStrings,min,max,false);
    end;
end;

procedure TForm4.ResetDiapasones(StartVF,VolOfVF,mincust,maxcust:integer; part:boolean);
var c,d:int64;
	t:int64;
	i:integer;
begin
	t:=int64(maxcust)-int64(mincust)+1;
    if t<0 then t:=t*(-1);
    c:=t div volofVF;
    d:=t mod volofVF;
	for i:=0 to volofVF-2 do begin
    	with FormGame.Pars[SelectedParameter] do begin
        	ViewFormatStrings[i+StartVF].min:=mincust + c*(i);
            ViewFormatStrings[i+StartVF].max:=mincust + c*(i+1) - 1 ;
        end;
	end;
    with FormGame.Pars[SelectedParameter].ViewFormatStrings[StartVF+volofVF-1] do begin
		min:=mincust + c*(volofVF-1);
		max:=mincust + c*(volofVF) + d -1;
    end;

	if not part then  begin
		FormGame.Pars[SelectedParameter].ValueOfViewStrings:=volofVF;
        VFShowMode:=true;
        ParVolVFStringsTrackBar.Position:=volofVF;
        VFShowMode:=false;
	end;
end;

function TForm4.GetAvailDiapasones:integer;
label done;
var i,answer:integer;
begin

      with FormGame.Pars[SelectedParameter] do begin
        i:=trunc(abs(max-min)+1);
      end;

      if i  >= maxformatviewstrings then begin
                                                answer:=maxformatviewstrings;
                                                goto done;
                                              end;
      if i=1 then begin
                        answer:=1;
                        goto done;
                  end;

      answer:=i;
done:
       GetAvailDiapasones:=answer;
end;

procedure TForm4.ShowParVF;
var i:integer;
begin
       if ParCustomizePanel.Visible=false then exit;
       VFShowMode:=true;

       for i:=1 to maxformatviewstrings do begin

        VFGateMinEdits[i].Visible:=false;
        VFGateMaxEdits[i].Visible:=false;
        VFEdits[i].visible:=false;
        VFGateMinEdits[i].Enabled:=false;
        VFGateMaxEdits[i].Enabled:=false;
        VFEdits[i].Enabled:=false;


       end;

       with FormGame.Pars[SelectedParameter] do begin

       for i:=1 to ValueOfViewStrings do begin

        VFGateMinEdits[i].Text:=inttostr(ViewFormatStrings[i].min);
        VFGateMaxEdits[i].Text:=inttostr(ViewFormatStrings[i].max);
        VFEdits[i].Text:=ViewFormatStrings[i].str.Text;

        VFGateMinEdits[i].Enabled:=true;
        VFGateMaxEdits[i].Enabled:=true;
        VFEdits[i].Enabled:=true;

        VFGateMinEdits[i].Visible:=true;
        VFGateMaxEdits[i].Visible:=true;
        VFEdits[i].visible:=true;
       end;

        VFGateMinEdits[1].Enabled:=false;
        VFGateMaxEdits[ValueOfViewStrings].Enabled:=false;

        ParVolVFStringsTrackBar.Max:=GetAvailDiapasones;
        ParVolVFStringsTrackBar.Position:=ValueOfViewStrings;
        ParVolVFStringsLabel.Caption:=inttostr(ValueOfViewStrings);
       end;

       Label12.Caption:=inttostr(ParVolVFStringsTrackBar.max);
       VFShowMode:=false;
end;


procedure TForm4.FixStringsForRightClickParameters(secondparameter:integer);
var i,c,s,f:integer;
	maskstr,fstr,sstr:string;
begin
    f:=RightClickedParameter;
	s:=secondparameter;
    fstr:='[p'+inttostr(f)+']';
    sstr:='[p'+inttostr(s)+']';
    maskstr:='[!@#$$%^]';
	with FormGame do begin
         for i:=1 to LocationsValue do begin
         	with Locations[i] do begin
         		for c:=1 to maxparameters do begin
                	DPars[c].Expression.Text:=StringReplace(DPars[c].Expression.Text,fstr,maskstr);
                	DPars[c].Expression.Text:=StringReplace(DPars[c].Expression.Text,sstr,fstr);
                	DPars[c].Expression.Text:=StringReplace(DPars[c].Expression.Text,maskstr,sstr);

					DPars[c].CriticalMessage.Text:=StringReplace(DPars[c].CriticalMessage.Text,fstr,maskstr);
                	DPars[c].CriticalMessage.Text:=StringReplace(DPars[c].CriticalMessage.Text,sstr,fstr);
                	DPars[c].CriticalMessage.Text:=StringReplace(DPars[c].CriticalMessage.Text,maskstr,sstr);
            	end;
         		for c:=1 to ValueOfLocationDescriptions do begin
            		LocationDescriptions[c].Text:=StringReplace(LocationDescriptions[c].Text,fstr,maskstr);
                	LocationDescriptions[c].Text:=StringReplace(LocationDescriptions[c].Text,sstr,fstr);
                	LocationDescriptions[c].Text:=StringReplace(LocationDescriptions[c].Text,maskstr,sstr);
            	end;
				LocDescrExprOrder.Text:=StringReplace(LocDescrExprOrder.Text,fstr,maskstr);
              	LocDescrExprOrder.Text:=StringReplace(LocDescrExprOrder.Text,sstr,fstr);
              	LocDescrExprOrder.Text:=StringReplace(LocDescrExprOrder.Text,maskstr,sstr);
         	end;
         end;

         with FormGame do begin
         		for c:=1 to maxparameters do begin
					Pars[c].CriticalMessage.Text:=StringReplace(Pars[c].CriticalMessage.Text,fstr,maskstr);
                	Pars[c].CriticalMessage.Text:=StringReplace(Pars[c].CriticalMessage.Text,sstr,fstr);
                	Pars[c].CriticalMessage.Text:=StringReplace(Pars[c].CriticalMessage.Text,maskstr,sstr);
                    for i:=1 to Pars[c].ValueOfViewStrings do begin
                        with Pars[c].ViewFormatStrings[i] do begin
         		 			str.Text:=StringReplace(str.Text,fstr,maskstr);
         			       	str.Text:=StringReplace(str.Text,sstr,fstr);
		                	str.Text:=StringReplace(str.Text,maskstr,sstr);
                        end;
                    end;
            	end;
         end;

         for i:=1 to PathesValue do begin
         	with Pathes[i] do begin
         		for c:=1 to maxparameters do begin
                	DPars[c].Expression.Text:=StringReplace(DPars[c].Expression.Text,fstr,maskstr);
                	DPars[c].Expression.Text:=StringReplace(DPars[c].Expression.Text,sstr,fstr);
                	DPars[c].Expression.Text:=StringReplace(DPars[c].Expression.Text,maskstr,sstr);

					DPars[c].CriticalMessage.Text:=StringReplace(DPars[c].CriticalMessage.Text,fstr,maskstr);
                	DPars[c].CriticalMessage.Text:=StringReplace(DPars[c].CriticalMessage.Text,sstr,fstr);
                	DPars[c].CriticalMessage.Text:=StringReplace(DPars[c].CriticalMessage.Text,maskstr,sstr);
            	end;
       			LogicExpression.Text:=StringReplace(LogicExpression.Text,fstr,maskstr);
              	LogicExpression.Text:=StringReplace(LogicExpression.Text,sstr,fstr);
              	LogicExpression.Text:=StringReplace(LogicExpression.Text,maskstr,sstr);
				StartPathMessage.Text:=StringReplace(StartPathMessage.Text,fstr,maskstr);
              	StartPathMessage.Text:=StringReplace(StartPathMessage.Text,sstr,fstr);
              	StartPathMessage.Text:=StringReplace(StartPathMessage.Text,maskstr,sstr);
      			EndPathMessage.Text:=StringReplace(EndPathMessage.Text,fstr,maskstr);
              	EndPathMessage.Text:=StringReplace(EndPathMessage.Text,sstr,fstr);
              	EndPathMessage.Text:=StringReplace(EndPathMessage.Text,maskstr,sstr);
         	end;
         end;

    end;
end;

procedure TForm4.ProcessRightParameterClick(parnum:integer);
var tempParameter:TParameter;
    tempParameterDelta:TParameterDelta;
    i:integer;
begin
    tempParameter:=TParameter.Create(0);
    tempParameterDelta:=TParameterDelta.Create(0);
//


        if RightClickedParameter=parnum then RightClickedParameter:=0;

        if RightClickedParameter=0 then

                RightClickedParameter:=parnum else
        begin
          FixStringsForRightClickParameters(parnum);
          with FormGame do begin

           tempParameter.CopyDataFrom(Pars[parnum]);
           Pars[parnum].CopyDataFrom(Pars[RightClickedParameter]);
           Pars[RightClickedParameter].CopyDataFrom(tempParameter);

           tempParameter.CopyDataFrom(OldPars[parnum]);
           OldPars[parnum].CopyDataFrom(OldPars[RightClickedParameter]);
           OldPars[RightClickedParameter].CopyDataFrom(tempParameter);

           for i:=1 to FormGame.LocationsValue do begin
            tempParameterDelta.CopyDataFrom( Locations[i].DPars[parnum]);
            Locations[i].DPars[parnum].CopyDataFrom(  Locations[i].DPars[RightClickedParameter]);
            Locations[i].DPars[RightClickedParameter].CopyDataFrom(tempParameterDelta);
           end;

           for i:=1 to FormGame.PathesValue do begin
            tempParameterDelta.CopyDataFrom(Pathes[i].DPars[parnum]);
            Pathes[i].DPars[parnum].CopyDataFrom(Pathes[i].DPars[RightClickedParameter]);
            Pathes[i].DPars[RightClickedParameter].CopyDataFrom(tempParameterDelta);
           end;

          end;
           RightClickedParameter:=0;
           ProcessEnabledControls;
        end;

    tempParameter.Destroy;
    tempParameterDelta.Destroy;
end;


procedure TForm4.FormCreate(Sender: TObject);
var
  i:integer;
begin
  is_ok_pressed:=false;
  FormGame:=TGame.Create(GameContent.PM(M));
  M:=@MessageText.M;

  for i:=1 to maxparameters do ParList.AddItem(IntToStr(i), Sender); // added by Koc
  ParList.ItemIndex:=0;

  for i:=1 to maxparameters do OldPars[i]:=TParameter.Create(i);
  Edit1.Text:=M.Par_Get('Form4ParametersHelpString');
  Edit2.Text:=M.Par_Get('Form4ParametersHelpString1');

  {ParEnabledCBs[1]:=@ParEnabledCB1;
  ParEnabledCBs[2]:=@ParEnabledCB2;
  ParEnabledCBs[3]:=@ParEnabledCB3;
  ParEnabledCBs[4]:=@ParEnabledCB4;
  ParEnabledCBs[5]:=@ParEnabledCB5;
  ParEnabledCBs[6]:=@ParEnabledCB6;
  ParEnabledCBs[7]:=@ParEnabledCB7;
  ParEnabledCBs[8]:=@ParEnabledCB8;
  ParEnabledCBs[9]:=@ParEnabledCB9;
  ParEnabledCBs[10]:=@ParEnabledCB10;
  ParEnabledCBs[11]:=@ParEnabledCB11;
  ParEnabledCBs[12]:=@ParEnabledCB12;}

  {ParSelectRBs[1]:=@ParRadioButton1;
  ParSelectRBs[2]:=@ParRadioButton2;
  ParSelectRBs[3]:=@ParRadioButton3;
  ParSelectRBs[4]:=@ParRadioButton4;
  ParSelectRBs[5]:=@ParRadioButton5;
  ParSelectRBs[6]:=@ParRadioButton6;
  ParSelectRBs[7]:=@ParRadioButton7;
  ParSelectRBs[8]:=@ParRadioButton8;
  ParSelectRBs[9]:=@ParRadioButton9;
  ParSelectRBs[10]:=@ParRadioButton10;
  ParSelectRBs[11]:=@ParRadioButton11;
  ParSelectRBs[12]:=@ParRadioButton12;}

  {ParEnabledCBs[13]:=@ParEnabledCB13;
  ParEnabledCBs[14]:=@ParEnabledCB14;
  ParEnabledCBs[15]:=@ParEnabledCB15;
  ParEnabledCBs[16]:=@ParEnabledCB16;
  ParEnabledCBs[17]:=@ParEnabledCB17;
  ParEnabledCBs[18]:=@ParEnabledCB18;
  ParEnabledCBs[19]:=@ParEnabledCB19;
  ParEnabledCBs[20]:=@ParEnabledCB20;
  ParEnabledCBs[21]:=@ParEnabledCB21;
  ParEnabledCBs[22]:=@ParEnabledCB22;
  ParEnabledCBs[23]:=@ParEnabledCB23;
  ParEnabledCBs[24]:=@ParEnabledCB24;}

  {ParSelectRBs[13]:=@ParRadioButton13;
  ParSelectRBs[14]:=@ParRadioButton14;
  ParSelectRBs[15]:=@ParRadioButton15;
  ParSelectRBs[16]:=@ParRadioButton16;
  ParSelectRBs[17]:=@ParRadioButton17;
  ParSelectRBs[18]:=@ParRadioButton18;
  ParSelectRBs[19]:=@ParRadioButton19;
  ParSelectRBs[20]:=@ParRadioButton20;
  ParSelectRBs[21]:=@ParRadioButton21;
  ParSelectRBs[22]:=@ParRadioButton22;
  ParSelectRBs[23]:=@ParRadioButton23;
  ParSelectRBs[24]:=@ParRadioButton24;}

  VFGateMinEdits[1]:=@VFGateMin1Edit;
  VFGateMinEdits[2]:=@VFGateMin2Edit;
  VFGateMinEdits[3]:=@VFGateMin3Edit;
  VFGateMinEdits[4]:=@VFGateMin4Edit;
  VFGateMinEdits[5]:=@VFGateMin5Edit;
  VFGateMinEdits[6]:=@VFGateMin6Edit;
  VFGateMinEdits[7]:=@VFGateMin7Edit;
  VFGateMinEdits[8]:=@VFGateMin8Edit;
  VFGateMinEdits[9]:=@VFGateMin9Edit;
  VFGateMinEdits[10]:=@VFGateMin10Edit;

  VFGateMaxEdits[1]:=@VFGateMax1Edit;
  VFGateMaxEdits[2]:=@VFGateMax2Edit;
  VFGateMaxEdits[3]:=@VFGateMax3Edit;
  VFGateMaxEdits[4]:=@VFGateMax4Edit;
  VFGateMaxEdits[5]:=@VFGateMax5Edit;
  VFGateMaxEdits[6]:=@VFGateMax6Edit;
  VFGateMaxEdits[7]:=@VFGateMax7Edit;
  VFGateMaxEdits[8]:=@VFGateMax8Edit;
  VFGateMaxEdits[9]:=@VFGateMax9Edit;
  VFGateMaxEdits[10]:=@VFGateMax10Edit;

  VFEdits[1]:=@VF1Edit;
  VFEdits[2]:=@VF2Edit;
  VFEdits[3]:=@VF3Edit;
  VFEdits[4]:=@VF4Edit;
  VFEdits[5]:=@VF5Edit;
  VFEdits[6]:=@VF6Edit;
  VFEdits[7]:=@VF7Edit;
  VFEdits[8]:=@VF8Edit;
  VFEdits[9]:=@VF9Edit;
  VFEdits[10]:=@VF10Edit;

  {CLabels[1]:=CL1;
  CLabels[2]:=CL2;
  CLabels[3]:=CL3;
  CLabels[4]:=CL4;
  CLabels[5]:=CL5;
  CLabels[6]:=CL6;
  CLabels[7]:=CL7;
  CLabels[8]:=CL8;
  CLabels[9]:=CL9;
  CLabels[10]:=CL10;
  CLabels[11]:=CL11;
  CLabels[12]:=CL12;}

  {PRButtons[1]:=ParRadioButton1;
  PRButtons[2]:=ParRadioButton2;
  PRButtons[3]:=ParRadioButton3;
  PRButtons[4]:=ParRadioButton4;
  PRButtons[5]:=ParRadioButton5;
  PRButtons[6]:=ParRadioButton6;
  PRButtons[7]:=ParRadioButton7;
  PRButtons[8]:=ParRadioButton8;
  PRButtons[9]:=ParRadioButton9;
  PRButtons[10]:=ParRadioButton10;
  PRButtons[11]:=ParRadioButton11;
  PRButtons[12]:=ParRadioButton12;
  PRButtons[13]:=ParRadioButton13;
  PRButtons[14]:=ParRadioButton14;
  PRButtons[15]:=ParRadioButton15;
  PRButtons[16]:=ParRadioButton16;
  PRButtons[17]:=ParRadioButton17;
  PRButtons[18]:=ParRadioButton18;
  PRButtons[19]:=ParRadioButton19;
  PRButtons[20]:=ParRadioButton20;
  PRButtons[21]:=ParRadioButton21;
  PRButtons[22]:=ParRadioButton22;
  PRButtons[23]:=ParRadioButton23;
  PRButtons[24]:=ParRadioButton24;}

  {PEChecks[1]:=ParEnabledCB1;
  PEChecks[2]:=ParEnabledCB2;
  PEChecks[3]:=ParEnabledCB3;
  PEChecks[4]:=ParEnabledCB4;
  PEChecks[5]:=ParEnabledCB5;
  PEChecks[6]:=ParEnabledCB6;
  PEChecks[7]:=ParEnabledCB7;
  PEChecks[8]:=ParEnabledCB8;
  PEChecks[9]:=ParEnabledCB9;
  PEChecks[10]:=ParEnabledCB10;
  PEChecks[11]:=ParEnabledCB11;
  PEChecks[12]:=ParEnabledCB12;
  PEChecks[13]:=ParEnabledCB13;
  PEChecks[14]:=ParEnabledCB14;
  PEChecks[15]:=ParEnabledCB15;
  PEChecks[16]:=ParEnabledCB16;
  PEChecks[17]:=ParEnabledCB17;
  PEChecks[18]:=ParEnabledCB18;
  PEChecks[19]:=ParEnabledCB19;
  PEChecks[20]:=ParEnabledCB20;
  PEChecks[21]:=ParEnabledCB21;
  PEChecks[22]:=ParEnabledCB22;
  PEChecks[23]:=ParEnabledCB23;
  PEChecks[24]:=ParEnabledCB24;}

  //ProcessParTab(ParTabSet.TabIndex);
end;

procedure TForm4.ResizeToNewGradient(new_xg,new_yg:integer);
   var xc,yc:extended;
       c:integer;
begin
        xc:=FormGame.BlockXGradient/new_xg;
        yc:=FormGame.BlockYGradient/new_yg;

        for c:= 1 to FormGame.LocationsValue do begin

                FormGame.Locations[c].screenx:=round(FormGame.Locations[c].screenx
                                               *
                                               xc);
                FormGame.Locations[c].screeny:=round(FormGame.Locations[c].screeny
                                               *
                                               yc);
        end;

        FormGame.BlockXgradient:=new_xg;
        FormGame.BlockYgradient:=new_yg;
end;

procedure Tform4.CorrectPathThingParameters;
var
  i,c:integer;
begin
  for i:=1 to FormGame.PathesValue do begin
    for c:=1 to maxparameters do begin
      if FormGame.Pathes[i].DPars[c].min=OldPars[c].GetDefaultMinGate then
        FormGame.Pathes[i].DPars[c].min:=FormGame.Pars[c].GetDefaultMinGate;

      if FormGame.Pathes[i].DPars[c].max=OldPars[c].GetDefaultMaxGate then
        FormGame.Pathes[i].DPars[c].max:=FormGame.Pars[c].GetDefaultMaxGate;

      if FormGame.Pathes[i].DPars[c].max>FormGame.Pars[c].max then
        FormGame.Pathes[i].DPars[c].max:=FormGame.Pars[c].max;

      if FormGame.Pathes[i].DPars[c].min<FormGame.Pars[c].min then
        FormGame.Pathes[i].DPars[c].min:=FormGame.Pars[c].min;
    end;
  end;
end;

procedure TForm4.ProcessEnabledControls();
var
  i: integer;
  j: Integer;
  tempstr: widestring;
  tstr: string;
  tvg: TCPDiapazone;
begin
  //TODO Make procedure working
  if X1RB.Checked then begin
    X1RB.Enabled:=true;
    X2RB.Enabled:=false;
    X3RB.Enabled:=false;
    X4RB.Enabled:=false;
  end;
  if X2RB.Checked then begin
    X2RB.Enabled:=true;
    X1RB.Enabled:=true;
    X3RB.Enabled:=false;
    X4RB.Enabled:=false;
  end;
  if X3RB.Checked then begin
    X3RB.Enabled:=true;
    X1RB.Enabled:=true;
    X2RB.Enabled:=true;
    X4RB.Enabled:=false;
  end;
  if X4RB.Checked then begin
    X4RB.Enabled:=true;
    X1RB.Enabled:=true;
    X2RB.Enabled:=true;
    X3RB.Enabled:=true;
  end;

  if Y1RB.Checked then begin
    Y1RB.Enabled:=true;
    Y2RB.Enabled:=false;
    Y3RB.Enabled:=false;
    Y4RB.Enabled:=false;
  end;
  if Y2RB.Checked then begin
    Y2RB.Enabled:=true;
    Y1RB.Enabled:=true;
    Y3RB.Enabled:=false;
    Y4RB.Enabled:=false;
  end;
  if Y3RB.Checked then begin
    Y3RB.Enabled:=true;
    Y1RB.Enabled:=true;
    Y2RB.Enabled:=true;
    Y4RB.Enabled:=false;
  end;
  if Y4RB.Checked then begin
    Y4RB.Enabled:=true;
    Y1RB.Enabled:=true;
    Y2RB.Enabled:=true;
    Y3RB.Enabled:=true;
  end;

  j:=ParList.ItemIndex + 1;
  //Параметры
  SelectedParameter:=0;
  for i:=1 to maxparameters do
    if(ParList.Checked[i-1] and (i = j)) then SelectedParameter:=i;
    
    {if (ParEnabledCBs[i]^.Checked) and (ParSelectRBs[i]^.checked) then
      SelectedParameter:=i;}

  //ProcessTabParSelect(ParTabSet.TabIndex);

  for i:=1 to maxparameters do begin
    ParList.Items[i-1]:=IntToStr(i) + ': ' + trim(FormGame.Pars[i].Name.Text);
    //ParselectRBs[i]^.Enabled:=ParEnabledCBs[i]^.Checked;
    //ParSelectRBs[i].Caption:=trim(FormGame.Pars[i].Name.Text);
  end;

  ParCustomizePanel.Visible:=(SelectedParameter <> 0);

  if SelectedParameter<>0 then begin
    with FormGame.Pars[SelectedParameter] do begin
      IsPlayerMoneyParCheckBox.Checked:=Money;
      tempstr:=Name.text;

      if trim(ParNameEdit.text)='' then begin
        ParNameEdit.text:='';
        tempstr:=trim(tempstr);
      end;

      ParNameEdit.Text:=(tempstr);

      tempstr:=trim(GameName.text);
      // ParGameNameEdit.Text:=tempstr;

      VFShowMode:=true;

      ParDeltaTrackBar.Min:=min;
      ParDeltaTrackBar.Max:=max;
      ParDeltaTrackBar.Position:=Value;

      MaxGateEdit.Text:=inttostr(Max);
      MinGateEdit.Text:=inttostr(Min);

      VFShowMode:=false;

      ParValueLabel.Caption:=inttostr(ParDeltaTrackBar.Position);
      RedrawParDeltaTrackBar;
      RedrawVFValParTrackBar;
      ShowParVF;


      ParCriticalMessageMemo.Text:=trim(CriticalMessage.Text);
      RadioGroup1.ItemIndex:=ParType;
      if not hidden then ParViewActionRG.ItemIndex:=0
      else ParViewActionRG.ItemIndex:=1;
      if LoLimit then RadioGroup2.ItemIndex:=0
      else Radiogroup2.ItemIndex:=1;

      if ShowIfZero then ShowIfZeroRadioGroup.ItemIndex:=0
      else ShowIfZeroRadioGroup.ItemIndex:=1;

      tvg:=TCPDiapazone.Create;
      tvg.Clear;
      if AltDiapStartValues.count=0 then begin
        AltDiapStartValues.Add(value);
      end;
      tstr:=tvg.Preprocess(trim(AltStartValuesEdit.Text));
      if (tstr<>';') then begin
        tvg.Assign(tstr+']');
      end else begin
        tvg.Clear;
      end;
      if (not AltDiapStartValues.IsEqualWith(tvg))or(trim(AltStartValuesEdit.Text)='') then begin
        AltStartValuesEdit.Text:=AltDiapStartValues.GetExtString;
      end;
      tvg.Destroy;
    end;
  end;
        //
end;

procedure TForm4.FormShow(Sender: TObject);
var
  i:integer;
begin
  is_ok_pressed:=false;
  VFShowMode:=true;

  QuestDifficultyTrackBar.Position:=FormGame.Difficulty;
  //AltStartValuesEdit.Text:='';
  SelectedParameter:=0;
  RightClickedParameter:=0;

  DefPathGoTimesEdit.Text:=inttostr(FormGame.DefPathGoTimesValue);
  if FormGame.DefPathGoTimesValue=0 then begin
    DefUnlPathGoTimesCheck.Checked:=true;
  end else begin
    DefUnlPathGoTimesCheck.Checked:=false;
  end;

  for i:=1 to maxparameters do begin
    ParList.Checked[i-1]:=FormGame.Pars[i].Enabled;
    //ParEnabledCBs[i].Checked:=FormGame.Pars[i].Enabled;
    OldPars[i].CopyDataFrom(FormGame.Pars[i]);
  end;

  RSTrader.Checked:=Trader in FormGame.SRangerStatus;
  RSPirate.Checked:=Pirate in FormGame.SRangerStatus;
  RSWarrior.Checked:=Warrior in FormGame.SRangerStatus;

  RRMaloc.Checked:=Maloc in FormGame.SRangerRace;
  RRPeleng.Checked:=Peleng in FormGame.SRangerRace;
  RRPeople.Checked:=People in FormGame.SRangerRace;
  RRFei.Checked:=Fei in FormGame.SRangerRace;
  RRGaal.Checked:=Gaal in FormGame.SRangerRace;

  RMaloc.Checked:=Maloc in FormGame.SRace;
  RPeleng.Checked:=Peleng in FormGame.SRace;
  RPeople.Checked:=People in FormGame.SRace;
  RFei.Checked:=Fei in FormGame.SRace;
  RGaal.Checked:=Gaal in FormGame.SRace;

  TNone.Checked:=None in FormGame.STargetRace;
  TMaloc.Checked:=Maloc in FormGame.STargetRace;
  TPeleng.Checked:=Peleng in FormGame.STargetRace;
  TPeople.Checked:=People in FormGame.STargetRace;
  TFei.Checked:=Fei in FormGame.STargetRace;
  TGaal.Checked:=Gaal in FormGame.STargetRace;

  PlanetReactionTrackBar.Position:=(FormGame.PlanetReaction+100) div 5;

  if FormGame.BlockXgradient=BXG4 then X4RB.Checked:=true;
  if FormGame.BlockXgradient=BXG3 then X3RB.Checked:=true;
  if FormGame.BlockXgradient=BXG2 then X2RB.Checked:=true;
  if FormGame.BlockXgradient=BXG1 then X1RB.Checked:=true;

  if FormGame.BlockYgradient=BYG4 then Y4RB.Checked:=true;
  if FormGame.BlockYgradient=BYG3 then Y3RB.Checked:=true;
  if FormGame.BlockYgradient=BYG2 then Y2RB.Checked:=true;
  if FormGame.BlockYgradient=BYG1 then Y1RB.Checked:=true;

  RangerEdit.text:=trim(FormGame.RRanger.text);
  ToPlanetEdit.text:=trim(FormGame.RToPlanet.text);
  ToStarEdit.text:=trim(FormGame.RToStar.text);
  FromPlanetEdit.text:=trim(FormGame.RFromPlanet.text);
  FromStarEdit.text:=trim(FormGame.RFromStar.text);

  QuestSuccessGovMessageEdit.Clear;
  QuestSuccessGovMessageEdit.Text:=trim(FormGame.QuestSuccessGovMessage.Text);

  QuestDescriptionEdit.Clear;
  QuestDescriptionEdit.Text:=trim(FormGame.QuestDescription.Text);

  if FormGame.NeedNotToReturn then NeedToReturnNoRadioButton.Checked:=true
  else NeedToReturnYesRadioButton.Checked:=true;

  ProcessEnabledControls;
end;

procedure TForm4.CancelButtonClick(Sender: TObject);
begin
  is_ok_pressed:=false;
  Close;
end;

procedure TForm4.OkButtonClick(Sender: TObject);
var
  new_xg,new_yg:integer;
	i,c:integer;
begin
  is_ok_pressed:=true;
  FormGame.DefPathGoTimesValue:=strtoint(DefPathGoTimesEdit.Text);

  with FormGame do begin
    for i:=1 to maxparameters do begin
      for c:=0 to Pars[i].AltDiapStartValues.Count-1 do begin
        with Pars[i].AltDiapStartValues do begin
          if low[c]<Pars[i].min then low[c]:=Pars[i].min;
          if low[c]>Pars[i].max then low[c]:=Pars[i].max;
          if hi[c]<Pars[i].min then hi[c]:=Pars[i].min;
          if hi[c]>Pars[i].max then hi[c]:=Pars[i].max;
        end;
      end;
    end;
  end;

  FormGame.PlanetReaction:=PlanetReactionTrackBar.Position*5-100;
  new_xg:=BXG4;
  new_yg:=BYG4;
  if X1RB.Checked then new_xg:=BXG1;
  if X2RB.Checked then new_xg:=BXG2;
  if X3RB.Checked then new_xg:=BXG3;
  if X4RB.Checked then new_xg:=BXG4;
  if Y1RB.Checked then new_yg:=BYG1;
  if Y2RB.Checked then new_yg:=BYG2;
  if Y3RB.Checked then new_yg:=BYG3;
  if Y4RB.Checked then new_yg:=BYG4;
  ResizeToNewGradient(new_xg,new_yg);
  CorrectPathThingParameters;

  //FormGame.Race:=RaceRadioGroup.ItemIndex;
  with FormGame do begin
    SRangerStatus:=[];
    if RSTrader.Checked then SRangerStatus:=SRangerStatus+[Trader];
    if RSPirate.Checked then SRangerStatus:=SRangerStatus+[Pirate];
    if RSWarrior.Checked then SRangerStatus:=SRangerStatus+[Warrior];
    if SRangerStatus=[] then SRangerStatus:=[Trader,Pirate,Warrior];
    SRangerRace:=[];
    if RRMaloc.Checked then  SRangerRace:= SRangerRace+[Maloc];
    if RRPeleng.Checked then  SRangerRace:= SRangerRace+[Peleng];
    if RRPeople.Checked then  SRangerRace:= SRangerRace+[People];
    if RRFei.Checked then  SRangerRace:= SRangerRace+[Fei];
    if RRGaal.Checked then  SRangerRace:= SRangerRace+[Gaal];
    //            if SRangerRace=[] then SRangerRace:=[Maloc,Peleng,People,Fei,Gaal];
    SRace:=[];
    if RMaloc.Checked then  SRace:= SRace+[Maloc];
    if RPeleng.Checked then  SRace:= SRace+[Peleng];
    if RPeople.Checked then  SRace:= SRace+[People];
    if RFei.Checked then  SRace:= SRace+[Fei];
    if RGaal.Checked then  SRace:= SRace+[Gaal];
    if SRace=[] then SRace:=[Maloc];
    STargetRace:=[];
    if TNone.Checked then  STargetRace:= STargetRace+[None];
    if TMaloc.Checked then  STargetRace:= STargetRace+[Maloc];
    if TPeleng.Checked then  STargetRace:= STargetRace+[Peleng];
    if TPeople.Checked then  STargetRace:= STargetRace+[People];
    if TFei.Checked then  STargetRace:= STargetRace+[Fei];
    if TGaal.Checked then  STargetRace:= STargetRace+[Gaal];
    //            if STargetRace=[] then STargetRace:=[None];
  end;

  FormGame.QuestSuccessGovMessage.Clear;
  FormGame.QuestSuccessGovMessage.Text:=trim(QuestSuccessGovMessageEdit.Text);
  FormGame.QuestDescription.Clear;
  FormGame.QuestDescription.Text:=trim(QuestDescriptionEdit.Text);
  FormGame.QuestTargetName.Clear;
  Close;
end;


procedure TForm4.AParActiveCheckClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TForm4.BParActiveCheckClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TForm4.CParActiveCheckClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TForm4.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=VK_ESCAPE then begin is_ok_pressed:=false; close; end;
end;

procedure TForm4.X1RBClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TForm4.X2RBClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TForm4.X3RBClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TForm4.X4RBClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TForm4.DParActiveCheckClick(Sender: TObject);
begin
ProcessEnabledControls;
end;

procedure TForm4.EParActiveCheckClick(Sender: TObject);
begin
  ProcessEnabledControls;
end;

procedure TForm4.FParActiveCheckClick(Sender: TObject);
begin
  ProcessEnabledControls; 
end;

procedure TForm4.PlanetReactionTrackBarChange(Sender: TObject);
var k:integer;
begin
  k:=PlanetReactionTrackBar.Position*5;
  case k of
    0..99:begin
      PlanetReactionLabel3.Caption:='Отношение упадет';
      PlanetReactionGauge.ForeColor:=clRed;
      PlanetReactionGauge.Progress:=100-k;
    end;
    100:begin
      PlanetReactionLabel3.Caption:='Отношение останется неизменным';
      PlanetReactionGauge.ForeColor:=clBlack;
      PlanetReactionGauge.Progress:=0;
    end;
    101..200:begin
      PlanetReactionLabel3.Caption:='Отношение возрастет';
      PlanetReactionGauge.ForeColor:=clBlue;
      PlanetReactionGauge.Progress:=k-100;
    end;
    else begin
    end;
  end;
end;

{procedure TForm4.ParEnabledCB1Click(Sender: TObject);
begin
  //FormGame.Pars[1].Enabled:=ParEnabledCBs[1]^.Checked;
  ProcessEnabledControls;
end;

procedure TForm4.ParEnabledCB2Click(Sender: TObject);
begin
  //FormGame.Pars[2].Enabled:=ParEnabledCBs[2]^.Checked;
  ProcessEnabledControls;
end;

procedure TForm4.ParEnabledCB3Click(Sender: TObject);
begin
  //FormGame.Pars[3].Enabled:=ParEnabledCBs[3]^.Checked;
  ProcessEnabledControls;
end;


procedure TForm4.ParEnabledCB4Click(Sender: TObject);
begin
  //FormGame.Pars[4].Enabled:=ParEnabledCBs[4]^.Checked;
  ProcessEnabledControls;
end;

procedure TForm4.ParEnabledCB5Click(Sender: TObject);
begin
  //FormGame.Pars[5].Enabled:=ParEnabledCBs[5]^.Checked;
  ProcessEnabledControls;
end;

procedure TForm4.ParEnabledCB6Click(Sender: TObject);
begin
  //FormGame.Pars[6].Enabled:=ParEnabledCBs[6]^.Checked;
  ProcessEnabledControls;
end;

procedure TForm4.ParEnabledCB7Click(Sender: TObject);
begin
  //FormGame.Pars[7].Enabled:=ParEnabledCBs[7]^.Checked;
  ProcessEnabledControls;
end;


procedure TForm4.ParEnabledCB8Click(Sender: TObject);
begin
  //FormGame.Pars[8].Enabled:=ParEnabledCBs[8]^.Checked;
  ProcessEnabledControls;
end;


procedure TForm4.ParEnabledCB9Click(Sender: TObject);
begin
  //FormGame.Pars[9].Enabled:=ParEnabledCBs[9]^.Checked;
  ProcessEnabledControls;
end;}


{procedure TForm4.ParRadioButton1Click(Sender: TObject);
begin
  SelectedParameter:=1;
  ProcessEnabledControls;
end;

procedure TForm4.ParRadioButton2Click(Sender: TObject);
begin
  SelectedParameter:=2;
  ProcessEnabledControls;
end;

procedure TForm4.ParRadioButton3Click(Sender: TObject);
begin
  SelectedParameter:=3;
  ProcessEnabledControls;
end;

procedure TForm4.ParRadioButton4Click(Sender: TObject);
begin
  SelectedParameter:=4;
  ProcessEnabledControls;
end;


procedure TForm4.ParRadioButton5Click(Sender: TObject);
begin
  SelectedParameter:=5;
  ProcessEnabledControls;
end;

procedure TForm4.ParRadioButton6Click(Sender: TObject);
begin
  SelectedParameter:=6;
  ProcessEnabledControls;
end;

procedure TForm4.ParRadioButton7Click(Sender: TObject);
begin
  SelectedParameter:=7;
  ProcessEnabledControls;
end;

procedure TForm4.ParRadioButton8Click(Sender: TObject);
begin
  SelectedParameter:=8;
  ProcessEnabledControls;
end;

procedure TForm4.ParRadioButton9Click(Sender: TObject);
begin
  SelectedParameter:=9;
  ProcessEnabledControls;
end;}

procedure TForm4.ParNameEditChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].Name.Text:=ParNameEdit.text;
  ProcessEnabledControls;
end;

procedure TForm4.RadioGroup1Click(Sender: TObject);
var
  flag:boolean;
  i:integer;
begin
  FormGame.Pars[SelectedParameter].ParType:=RadioGroup1.ItemIndex;
  if RadioGroup1.ItemIndex=0 then flag:=false
  else flag:=true;

  RadioGroup2.Visible:=flag;
  ParCriticalMessageMemo.Visible:=flag;
  //Shape5.Visible:=flag;
  //Shape6.Visible:=flag;

  for i:=1 to FormGame.LocationsValue do
    FormGame.Locations[i].DPars[SelectedParameter].CriticalMessageVisible:=flag;

  for i:=1 to FormGame.PathesValue do
    FormGame.Pathes[i].DPars[SelectedParameter].CriticalMessageVisible:=flag;

  //ProcessEnabledControls;
end;

procedure TForm4.ParViewActionRGClick(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].Hidden:= ParViewActionRG.ItemIndex=1;
  //ProcessEnabledControls;
end;

procedure TForm4.RadioGroup2Click(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].LoLimit:=RadioGroup2.ItemIndex=0;
  //ProcessEnabledControls;
end;

procedure TForm4.ParCriticalMessageMemoChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].CriticalMessage.text:=trim(ParCriticalMessageMemo.text);
end;

procedure TForm4.ParDeltaTrackBarChange(Sender: TObject);
begin
  if VFShowMode=true then exit;
  RedrawParDeltaTrackBar;
  ParValueLabel.Caption:=inttostr(ParDeltaTrackBar.Position);
  FormGame.Pars[SelectedParameter].value:=ParDeltaTrackBar.Position;
end;

procedure TForm4.MinGateEditChange(Sender: TObject);
label done;
var
  min,max:integer;
  i:integer;
begin
  if VFShowMode then exit;

  if MinGateEdit.text='' then begin MinGateEdit.text:='0'; goto done; end;

  min:=strtoint(MinGateEdit.text);
  max:=strtoint(MaxGateEdit.text);

  if min>=max then begin min:=max-1; MinGateEdit.Text:=inttostr(min); goto done; end;

  if FormGame.Pars[SelectedParameter].min=min then goto done;

  FormGame.Pars[SelectedParameter].min:=min;
  ParDeltaTrackBar.Min:=min;
  ParDeltaTrackBar.Position:=(min+max) div 2;

  if (VFShowMode=false) then begin
    ParVolVFStringsTrackBar.max:=GetAvailDiapasones;
    Label12.Caption:=inttostr(ParVolVFStringsTrackBar.Max);
    if ParVolVFStringsTrackBar.max>ParVolVFStringsTrackBar.position then begin
      i:=GetAvailDiapasones;
      if i<ParVolVFStringsTrackBar.max then
      ParVolVFStringsTrackBar.position:=GetAvailDiapasones;
    end;
    Label12.Caption:=inttostr(ParVolVFStringsTrackBar.max);
  end;

  if (
    FormGame.Pars[SelectedParameter].ViewFormatStrings[1].min
    <>
    FormGame.Pars[SelectedParameter].min
   )
   or
   (
    FormGame.Pars[SelectedParameter].ViewFormatStrings[FormGame.Pars[SelectedParameter].ValueOfViewStrings].max
    <>
    FormGame.Pars[SelectedParameter].max
   )
  then begin
        SetDefaultDiapasones;
        ShowParVF;
  end;
done:


end;

procedure TForm4.MaxGateEditChange(Sender: TObject);
label done;
var
  min,max:integer;
  i:integer;
begin
  if VFShowMode then exit;

  if MaxGateEdit.text='' then begin MaxGateEdit.text:='1';  goto done; end;

  min:=strtoint(MinGateEdit.text);
  max:=strtoint(MaxGateEdit.text);

  if FormGame.Pars[SelectedParameter].max=max then goto done;

  FormGame.Pars[SelectedParameter].max:=max;
  ParDeltaTrackBar.max:=max;
  ParDeltaTrackBar.Position:=(min+max) div 2;

  ParVolVFStringsTrackBar.max:=GetAvailDiapasones;
  Label12.Caption:=inttostr(ParVolVFStringsTrackBar.Max);
  ParVolVFStringsTrackBar.position:=FormGame.Pars[SelectedParameter].ValueOfViewStrings;

  if VFShowMode=false then begin
    if ParVolVFStringsTrackBar.max>ParVolVFStringsTrackBar.position then begin
      i:=GetAvailDiapasones;
      if i<ParVolVFStringsTrackBar.max then
        ParVolVFStringsTrackBar.position:=GetAvailDiapasones;
    end;
    Label12.Caption:=inttostr(ParVolVFStringsTrackBar.max);
  end;

  if (
    FormGame.Pars[SelectedParameter].ViewFormatStrings[1].min
    <>
    FormGame.Pars[SelectedParameter].min
   )
   or
   (
    FormGame.Pars[SelectedParameter].ViewFormatStrings[FormGame.Pars[SelectedParameter].ValueOfViewStrings].max
    <>
    FormGame.Pars[SelectedParameter].max
   )
  then begin
    SetDefaultDiapasones;
    ShowParVF;
  end;
done:

end;

procedure TForm4.RangerEditChange(Sender: TObject);
begin
  FormGame.RRanger.text:=trim(RangerEdit.text);
end;

procedure TForm4.ToPlanetEditChange(Sender: TObject);
begin
  FormGame.RToPlanet.text:=trim(ToPlanetEdit.text);
end;

procedure TForm4.ToStarEditChange(Sender: TObject);
begin
  FormGame.RToStar.text:=trim(ToStarEdit.text);
end;

procedure TForm4.FromPlanetEditChange(Sender: TObject);
begin
  FormGame.RFromPlanet.text:=trim(FromPlanetEdit.text);
end;

procedure TForm4.FromStarEditChange(Sender: TObject);
begin
  FormGame.RFromStar.text:=trim(FromStarEdit.text);
end;

{procedure TForm4.ParRadioButton1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then ProcessRightParameterClick(1);
  if Button=mbLeft then RightClickedParameter:=0;
end;

procedure TForm4.ParRadioButton2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then  ProcessRightParameterClick(2);
  if Button=mbLeft then RightClickedParameter:=0;
end;

procedure TForm4.ParRadioButton3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then  ProcessRightParameterClick(3);
  if Button=mbLeft then RightClickedParameter:=0;
end;

procedure TForm4.ParRadioButton4MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then  ProcessRightParameterClick(4);
  if Button=mbLeft then RightClickedParameter:=0;
end;

procedure TForm4.ParRadioButton5MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(5);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton6MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(6);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton7MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(7);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton8MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(8);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton9MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(9);
if Button=mbLeft then RightClickedParameter:=0;

end;}

procedure TForm4.ParGameNameEditChange(Sender: TObject);
begin
//FormGame.Pars[SelectedParameter].GameName.Text:=ParGameNameEdit.text;
ProcessEnabledControls;
end;

procedure TForm4.ShowIfZeroRadioGroupClick(Sender: TObject);
var flag:boolean;
begin
        if  ShowIfZeroRadioGroup.ItemIndex=0 then flag:=true
                                             else flag:=false;

FormGame.Pars[SelectedParameter].ShowIfZero:=flag;
ProcessEnabledControls;
end;

procedure TForm4.NeedToReturnNoRadioButtonClick(Sender: TObject);
begin
FormGame.NeedNotToReturn:=true;
end;

procedure TForm4.NeedToReturnYesRadioButtonClick(Sender: TObject);
begin
FormGame.NeedNotToReturn:=false;
end;

procedure TForm4.ParVolVFStringsTrackBarChange(Sender: TObject);
begin
RedrawVFValParTrackBar;
if VFShowMode then exit;
if FormGame.Pars[SelectedParameter].ValueOfViewStrings
    =
   ParVolVFStringsTrackBar.Position then exit;

ResetDiapasones(1,ParVolVFStringsTrackBar.Position,
                FormGame.Pars[SelectedParameter].min,
                FormGame.Pars[SelectedParameter].max,false);

ParVolVFStringsLabel.Caption:=inttostr(ParVolVFStringsTrackBar.Position);
ShowParVF;

//ProcessEnabledControls;

end;

procedure TForm4.VF1EditChange(Sender: TObject);
begin
FormGame.Pars[SelectedParameter].ViewFormatStrings[1].str.text:=VF1Edit.text;

end;

procedure TForm4.VF2EditChange(Sender: TObject);
begin
FormGame.Pars[SelectedParameter].ViewFormatStrings[2].str.text:=VF2Edit.text;
end;

procedure TForm4.VF3EditChange(Sender: TObject);
begin
FormGame.Pars[SelectedParameter].ViewFormatStrings[3].str.text:=VF3Edit.text;
end;

procedure TForm4.VF4EditChange(Sender: TObject);
begin
FormGame.Pars[SelectedParameter].ViewFormatStrings[4].str.text:=VF4Edit.text;
end;

procedure TForm4.VF5EditChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].ViewFormatStrings[5].str.text:=VF5Edit.text;
end;

procedure TForm4.VF6EditChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].ViewFormatStrings[6].str.text:=VF6Edit.text;
end;

procedure TForm4.VF7EditChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].ViewFormatStrings[7].str.text:=VF7Edit.text;
end;

procedure TForm4.VF8EditChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].ViewFormatStrings[8].str.text:=VF8Edit.text;
end;

procedure TForm4.VF9EditChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].ViewFormatStrings[9].str.text:=VF9Edit.text;
end;

procedure TForm4.VF10EditChange(Sender: TObject);
begin
  FormGame.Pars[SelectedParameter].ViewFormatStrings[10].str.text:=VF10Edit.text;
end;



procedure TForm4.VFGateMin2EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(2,0, true);
end;

procedure TForm4.VFGateMin3EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(3,0, true);
end;

procedure TForm4.VFGateMin4EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(4,0, true);
end;

procedure TForm4.VFGateMin5EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(5,0, true);
end;

procedure TForm4.VFGateMin6EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(6,0, true);
end;

procedure TForm4.VFGateMin7EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(7,0, true);
end;

procedure TForm4.VFGateMin8EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(8,0, true);
end;

procedure TForm4.VFGateMin9EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(9,0, true);
end;

procedure TForm4.VFGateMax1EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(1,0, false);
end;

procedure TForm4.VFGateMax2EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(2,0, false);
end;

procedure TForm4.VFGateMax3EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(3,0, false);
end;

procedure TForm4.VFGateMax4EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(4,0, false);
end;

procedure TForm4.VFGateMax5EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(5,0, false);
end;

procedure TForm4.VFGateMax6EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(6,0, false);
end;

procedure TForm4.VFGateMax7EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(7,0, false);
end;

procedure TForm4.VFGateMax8EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(8,0, false);
end;

procedure TForm4.VFGateMax9EditClick(Sender: TObject);
begin
  ProcessOnDiapasoneEnter(9,0, false);
end;

procedure TForm4.VFGateMin10EditClick(Sender: TObject);
begin
ProcessOnDiapasoneEnter(10,0, true);
end;

procedure TForm4.VFValTrackBarGroundShapeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  currentposition:integer;
  dmax:integer;
begin
  if ssLeft in Shift then begin
    dmax:=ParVolVFStringsTrackBar.Max;

    currentposition:=round(dmax*(X)/VFValTrackBarGroundShape.Width);

    ParVolVFStringsTrackBar.Position:=currentposition;
  end;
end;

procedure TForm4.VFValTrackBarGroundShapeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  VFValTrackBarGroundShape.OnMouseMove(Sender,Shift,x,y);
end;

procedure TForm4.VFValTrackBarLeftImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ParVolVFStringsTrackBar.position>1 then
    ParVolVFStringsTrackBar.Position:=ParVolVFStringsTrackBar.Position-1;
end;

procedure TForm4.VFValTrackBarRightImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ParVolVFStringsTrackBar.position < ParVolVFStringsTrackBar.max then
    ParVolVFStringsTrackBar.Position:=ParVolVFStringsTrackBar.Position+1;
end;

procedure TForm4.VFValTrackBarLeftImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  RedrawVFValParTrackBar;
end;

procedure TForm4.VFValTrackBarRightImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  RedrawVFValParTrackBar;
end;

procedure TForm4.TrackBarLeftImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ParDeltaTrackBar.position>ParDeltaTrackBar.min then
    ParDeltaTrackBar.Position:=ParDeltaTrackBar.Position-1;
end;

procedure TForm4.TrackBarRightImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ParDeltaTrackBar.position < ParDeltaTrackBar.max then
    ParDeltaTrackBar.Position:= ParDeltaTrackBar.Position+1;
end;

procedure TForm4.TrackBarLeftImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  RedrawParDeltaTrackBar;
end;

procedure TForm4.TrackBarRightImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  RedrawParDeltaTrackBar;
end;

procedure TForm4.TrackBarGroundShapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TrackBarGroundShape.OnMouseMove(Sender,Shift,x,y);
end;

procedure TForm4.TrackBarGroundShapeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  currentposition:integer;
  dmax:integer;
begin
  if ssLeft in Shift then begin
    dmax:=ParDeltaTrackBar.Max-ParDeltaTrackBar.Min;

    currentposition:=ParDeltaTrackBar.Min+
    (round(dmax*(X/TrackBarGroundShape.Width)));

    ParDeltaTrackBar.Position:=currentposition;
  end;
end;

procedure TForm4.PageControl3Change(Sender: TObject);
begin
  RedrawParDeltaTrackBar;
  RedrawVFValParTrackBar;
end;

{procedure TForm4.ParEnabledCB10Click(Sender: TObject);
begin
  //FormGame.Pars[10].Enabled:=ParEnabledCBs[10]^.Checked;
  ProcessEnabledControls;
end;

procedure TForm4.ParEnabledCB11Click(Sender: TObject);
begin
  //FormGame.Pars[11].Enabled:=ParEnabledCBs[11]^.Checked;
  ProcessEnabledControls;
end;

procedure TForm4.ParEnabledCB12Click(Sender: TObject);
begin
  //FormGame.Pars[12].Enabled:=ParEnabledCBs[12]^.Checked;
  ProcessEnabledControls;
end;

procedure TForm4.ParRadioButton10Click(Sender: TObject);
begin
  SelectedParameter:=10;
  ProcessEnabledControls;
end;

procedure TForm4.ParRadioButton11Click(Sender: TObject);
begin
  SelectedParameter:=11;
  ProcessEnabledControls;
end;

procedure TForm4.ParRadioButton12Click(Sender: TObject);
begin
  SelectedParameter:=12;
  ProcessEnabledControls;
end;

procedure TForm4.ParRadioButton10MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then  ProcessRightParameterClick(10);
  if Button=mbLeft then RightClickedParameter:=0;
end;

procedure TForm4.ParRadioButton11MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then  ProcessRightParameterClick(11);
  if Button=mbLeft then RightClickedParameter:=0;
end;

procedure TForm4.ParRadioButton12MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then  ProcessRightParameterClick(12);
  if Button=mbLeft then RightClickedParameter:=0;
end;}

procedure TForm4.IsPlayerMoneyParCheckBoxClick(Sender: TObject);
var i:integer;
begin
  if IsPlayerMoneyParCheckBox.Checked then begin
    for i:=1 to maxparameters do begin
      FormGame.Pars[i].Money:=false;
    end;
  end;
  FormGame.Pars[SelectedParameter].Money:=IsPlayerMoneyParCheckBox.Checked;
end;

procedure TForm4.ParTabSetChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  //ProcessParTab(newtab);
  //ProcessTabParSelect(newtab);
end;

{procedure TForm4.ParEnabledCB13Click(Sender: TObject);
begin
  //FormGame.Pars[13].Enabled:=ParEnabledCBs[13]^.Checked;
  ProcessEnabledControls;
end;

procedure TForm4.ParEnabledCB14Click(Sender: TObject);
begin
  //FormGame.Pars[14].Enabled:=ParEnabledCBs[14]^.Checked;
  ProcessEnabledControls;
end;

procedure TForm4.ParEnabledCB15Click(Sender: TObject);
begin
  //FormGame.Pars[15].Enabled:=ParEnabledCBs[15]^.Checked;
  ProcessEnabledControls;
end;

procedure TForm4.ParEnabledCB16Click(Sender: TObject);
begin

 //FormGame.Pars[16].Enabled:=ParEnabledCBs[16]^.Checked;
 ProcessEnabledControls;

end;

procedure TForm4.ParEnabledCB17Click(Sender: TObject);
begin

 //FormGame.Pars[17].Enabled:=ParEnabledCBs[17]^.Checked;
 ProcessEnabledControls;

end;

procedure TForm4.ParEnabledCB18Click(Sender: TObject);
begin

 //FormGame.Pars[18].Enabled:=ParEnabledCBs[18]^.Checked;
 ProcessEnabledControls;

end;

procedure TForm4.ParEnabledCB19Click(Sender: TObject);
begin

 //FormGame.Pars[19].Enabled:=ParEnabledCBs[19]^.Checked;
 ProcessEnabledControls;

end;

procedure TForm4.ParEnabledCB20Click(Sender: TObject);
begin

 //FormGame.Pars[20].Enabled:=ParEnabledCBs[20]^.Checked;
 ProcessEnabledControls;

end;

procedure TForm4.ParEnabledCB21Click(Sender: TObject);
begin

 //FormGame.Pars[21].Enabled:=ParEnabledCBs[21]^.Checked;
 ProcessEnabledControls;

end;

procedure TForm4.ParEnabledCB22Click(Sender: TObject);
begin

 //FormGame.Pars[22].Enabled:=ParEnabledCBs[22]^.Checked;
 ProcessEnabledControls;

end;

procedure TForm4.ParEnabledCB23Click(Sender: TObject);
begin

 //FormGame.Pars[23].Enabled:=ParEnabledCBs[23]^.Checked;
 ProcessEnabledControls;

end;

procedure TForm4.ParEnabledCB24Click(Sender: TObject);
begin

 //FormGame.Pars[24].Enabled:=ParEnabledCBs[24]^.Checked;
 ProcessEnabledControls;

end;

procedure TForm4.ParRadioButton24Click(Sender: TObject);
begin
SelectedParameter:=24;
ProcessEnabledControls;

end;

procedure TForm4.ParRadioButton13Click(Sender: TObject);
begin
SelectedParameter:=13;
ProcessEnabledControls;
end;

procedure TForm4.ParRadioButton14Click(Sender: TObject);
begin
SelectedParameter:=14;
ProcessEnabledControls;

end;

procedure TForm4.ParRadioButton15Click(Sender: TObject);
begin
SelectedParameter:=15;
ProcessEnabledControls;

end;

procedure TForm4.ParRadioButton16Click(Sender: TObject);
begin
SelectedParameter:=16;
ProcessEnabledControls;

end;

procedure TForm4.ParRadioButton17Click(Sender: TObject);
begin
SelectedParameter:=17;
ProcessEnabledControls;

end;

procedure TForm4.ParRadioButton18Click(Sender: TObject);
begin
SelectedParameter:=18;
ProcessEnabledControls;

end;

procedure TForm4.ParRadioButton19Click(Sender: TObject);
begin
SelectedParameter:=19;
ProcessEnabledControls;

end;

procedure TForm4.ParRadioButton20Click(Sender: TObject);
begin
SelectedParameter:=20;
ProcessEnabledControls;

end;

procedure TForm4.ParRadioButton21Click(Sender: TObject);
begin
SelectedParameter:=21;
ProcessEnabledControls;

end;

procedure TForm4.ParRadioButton22Click(Sender: TObject);
begin
SelectedParameter:=22;
ProcessEnabledControls;

end;

procedure TForm4.ParRadioButton23Click(Sender: TObject);
begin
SelectedParameter:=23;
ProcessEnabledControls;

end;

procedure TForm4.ParRadioButton13MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

if Button=mbRight then  ProcessRightParameterClick(13);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton14MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(14);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton15MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(15);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton16MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(16);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton17MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(17);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton18MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(18);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton19MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(19);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton20MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(20);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton21MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(21);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton22MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(22);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton23MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(23);
if Button=mbLeft then RightClickedParameter:=0;

end;

procedure TForm4.ParRadioButton24MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then  ProcessRightParameterClick(24);
if Button=mbLeft then RightClickedParameter:=0;

end;}

procedure TForm4.AltStartValuesEditChange(Sender: TObject);
var
  tvg:TCPDiapazone;
  tstr:string;
begin
  if SelectedParameter<=0 then exit;
  tvg:=TCPDiapazone.Create;
  tvg.Clear;
  tstr:=tvg.Preprocess(AltStartValuesEdit.Text);
  if tstr<>';' then begin
    tvg.Assign(tstr+']');
  end else begin
    tvg.Clear;
  end;
  if not FormGame.Pars[SelectedParameter].AltDiapStartValues.IsEqualWith(tvg) then begin
    FormGame.Pars[SelectedParameter].AltDiapStartValues.CopyDataFrom(tvg);
    ProcessEnabledControls;
  end;
  tvg.Destroy;
end;

procedure TForm4.DefUnlPathGoTimesCheckClick(Sender: TObject);
begin
  if DefUnlPathGoTimesCheck.Checked then begin
    DefPathGoTimesEdit.Visible:=false;
    DefPathGoTimesEdit.Text:='0';
  end else begin
    DefPathGoTimesEdit.Visible:=true;
  end;
end;

procedure TForm4.DefPathGoTimesEditChange(Sender: TObject);
begin
  try
    strtoint('0'+DefPathGoTimesEdit.Text);
  except else begin
    DefPathGoTimesEdit.Text:=inttostr(FormGame.DefPathGoTimesValue);
    exit;
    end;
  end;
end;

procedure TForm4.QuestDifficultyTrackBarChange(Sender: TObject);
begin
  QuestDifficultyGauge.Progress:=QuestDifficultyTrackBar.position;
  FormGame.Difficulty:=QuestDifficultyTrackBar.position;
end;

procedure TForm4.ParListClick(Sender: TObject);
begin
  ProcessEnabledControls();
end;

procedure TForm4.ParListClickCheck(Sender: TObject);
var
  i: integer;
begin
  for i:=1 to maxparameters do FormGame.Pars[i].Enabled:=ParList.Checked[i-1];
  ProcessEnabledControls();
end;

end.

