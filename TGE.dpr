program TGE;

uses
  Forms,
  LocationEditForm in 'Forms\LocationEditForm.pas' {LocationEditForm},
  MainForm in 'Forms\MainForm.pas' {MainForm},
  PathEditForm in 'Forms\PathEditForm.pas' {PathEditForm},
  MainPropertiesEdit in 'Forms\MainPropertiesEdit.pas' {MainPropertiesEdit},
  PlayForm in 'Forms\PlayForm.pas' {PlayForm},
  ColorOptionsForm in 'Forms\ColorOptionsForm.pas' {ColorOptionsForm},
  StatisticsForm in 'Forms\StatisticsForm.pas' {StatisticsForm},
  ParFailEditForm in 'Forms\ParFailEditForm.pas' {ParFailEditForm},
  StatisticsCalculationStyle in 'Forms\StatisticsCalculationStyle.pas' {StatisticsCalculationStyleForm},
  SearchForm in 'Forms\SearchForm.pas' {SearchForm},

  EC_BlockPar in 'EC\EC_BlockPar.pas',
  EC_Buf in 'EC\EC_Buf.pas',
  EC_File in 'EC\EC_File.pas',
  EC_Mem in 'EC\EC_Mem.pas',
  EC_Str in 'EC\EC_Str.pas',

  GameContent in 'GameContent.pas',
  MessageText in 'MessageText.pas',

  CalcParseClass in 'Classes\CalcParseClass.pas',
  CPDiapClass in 'Classes\CPDiapClass.pas',
  CPVarClass in 'Classes\CPVarClass.pas',
  LocationClass in 'Classes\LocationClass.pas',
  ParameterClass in 'Classes\ParameterClass.pas',
  ParameterDeltaClass in 'Classes\ParameterDeltaClass.pas',
  ParViewStringClass in 'Classes\ParViewStringClass.pas',
  PathClass in 'Classes\PathClass.pas',
  TextFieldClass in 'Classes\TextFieldClass.pas',
  ValueListClass in 'Classes\ValueListClass.pas';


{$R *.RES}

begin
  Application.Initialize;
  
  MessageText.M:=TBlockParEC.Create;
  MessageText.M.LoadFromFile('messages_cfg.txt');
  Application.Title := 'TGE';
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TStatisticsCalculationStyleForm, StatisticsCalculationStyleForm);
  Application.CreateForm(TLPSearchForm, LPSearchForm);
  LPSearchForm.Hide;
  Application.Run;
end.
