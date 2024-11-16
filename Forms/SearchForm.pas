unit SearchForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TLPSearchForm = class(TForm)
    SEdit: TEdit;
    SearchTypeRG: TRadioGroup;
    EnterButton: TButton;
    Label1: TLabel;
    procedure CloseButtonClick(Sender: TObject);
    procedure EnterButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LPSearchForm: TLPSearchForm;

implementation

{$R *.dfm}

uses MainForm;

procedure TLPSearchForm.CloseButtonClick(Sender: TObject);
begin
Form2.NavigateToolButton.Down:=false;
end;

procedure TLPSearchForm.EnterButtonClick(Sender: TObject);
var tstr,tstr1:string;
	typesearch,i,c,number,x,y:integer;
begin
	typesearch:=0;
	tstr:=trim(SEdit.Text);
    if tstr='' then exit;
    if (tstr[1]='P') or (tstr[1]='p') then typesearch:=2;
    if (tstr[1]='L') or (tstr[1]='l') then typesearch:=1;
    tstr1:='';
    for i:=1 to length(tstr) do begin
        if (tstr[i]>='0') and (tstr[i]<='9') then tstr1:=tstr1+tstr[i];
    end;
    if tstr1='' then exit;
    try
    	number:=strtoint(tstr1);
    except
    	on EConvertError do begin
        	exit;
    	end;
    end;
    if typesearch=0 then begin
    	typesearch:=SearchTypeRG.itemindex+1;
    end;
	with Form2.Game do begin
    	if typesearch=1 then begin
        	i:=-1;
            for c:=1 to LocationsValue do begin
            	if Locations[c].LocationNumber=number then i:=c;
            end;
            if i>0 then begin
				x:=Locations[i].screenx;
                y:=Locations[i].screeny;

                Form2.NavigateTo(x,y);
            end;
    	end else begin
        	i:=-1;
            for c:=1 to PathesValue do begin
            	if Pathes[c].PathNumber=number then i:=c;
            end;
            if i>0 then begin
            	x:=Pathes[i].PathXCoords[10];
            	y:=Pathes[i].PathYCoords[10];
                Form2.NavigateTo(x,y);
            end;
    	end;
    end;
end;

end.
