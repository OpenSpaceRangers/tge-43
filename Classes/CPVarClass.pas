unit CPVarClass;

interface

uses CPDiapClass,SysUtils;

type TCPVType=(diap,ext);

type TCPVariant=class
	vd:TCPDiapazone;
    vf:extended;
    vtype:TCPVType;

    constructor Create;
    procedure Clear;
    procedure CopyDataFrom(source:TCPVariant);
    function Assign(str:string):boolean;
    function GetValue:extended;
    function StrIsValue(var s:string; len:integer):boolean;

end;

implementation

constructor TCPVariant.Create;
begin
 //
 	vd:=TCPDiapazone.Create;
    clear;
end;

procedure TCPVariant.Clear;
begin
//
    vf:=0;
    vd.Clear;
    vtype:=ext;
end;

procedure TCPVariant.CopyDataFrom(source:TCPVariant);
begin
//
	vd.CopyDataFrom(source.vd);
    vf:=source.vf;
    vtype:=source.vtype;
end;

function TCPVariant.Assign(str:string):boolean;
var i,l:integer;
begin
	Assign:=false;
    l:=length(str);
    if l=0 then str:='0';
	if StrIsValue(str,l) then begin
    	vtype:=ext;
        vd.Clear;
        vf:=strtofloat(str);
        Assign:=true;
        exit;
    end;
    if (l>1)and(str[1]='[')and(str[l]=']') then begin
    	for i:=1 to l do begin
        	case str[i] of
            	'h':;
            	';':;
            	'[':;
            	']':;
            	'0'..'9':;
            	'-':;
            	else begin
                	Assign:=false;
                    exit;
                end;
            end
        end;
    	vtype:=diap;
        vd.Assign(str);
        vf:=0;
        Assign:=true;
    end;
end;

function TCPVariant.StrIsValue(var s:string; len:integer):boolean;
var i:integer;
	answer:boolean;
begin
    answer:=true;
	for i:=1 to len do begin
        if (((s[i]>='0')and(s[i]<='9'))or(s[i]=',')or(s[i]='E')) then
        else begin answer:=false; break; end;
    end;
    StrIsValue:=answer;
end;

function TCPVariant.GetValue:extended;
begin
//
    GetValue:=0;
	if vtype=diap then begin
		GetValue:=vd.GetRandom;
    end;
	if vtype=ext then begin
        GetValue:=vf;
    end;
end;




end.
