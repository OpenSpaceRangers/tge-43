unit CalcParseClass;

interface

uses SysUtils, Dialogs,
    ParameterClass,
	CPDiapClass, CPVarClass;

const maxparameters=ParameterClass.maxparameters;

type TParValues=array [1..maxparameters] of integer;

Type TCalcParse=class
public
	orig_str:string;
    internal_str:string;
    answer:integer;
    currparnum:integer;
    default_expression:boolean;
    sym_warning:boolean;
    parentheses_error:boolean;
    num_error:boolean;
    parameters_error:boolean;
    diapazone_error:boolean;
    calc_error:boolean;
    error:boolean;

    Constructor Create();
    procedure Clear();
    function InsertParValues(var values:TParValues):string;
    procedure AssignAndPreprocess(str:string; currparnum:integer);
    procedure Parse(var values:TParValues);
    function Calc(expr:string):TCPVariant;

    function CheckParentheses(var s:string; startpos,endpos:integer):boolean; overload;
    function CheckSParentheses(var s:string; startpos,endpos:integer):boolean;
    function CheckParentheses(var s:string):boolean; overload;
    function StrIsValue(var s:string; len:integer):boolean;
    function FindOperation(var s:string; len:integer):integer;
	function GetOperationOrder(op:char):integer;

	function FixOp(var str:string):string;
    function FixSeparate(var str:string):string;
    function FixLitNorm(str:string):string;
    function FixLitDP(str:string):string;
    function FixLitD(str:string):string;
    function FixLitP(str:string):string;
    function FixNum(str:string):string;
    function FixFinal(str:string):string;

    procedure OpAdd(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpSub(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpMul(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpDiv(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpDivTrunc(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpMod(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpIn(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpTo(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpLo(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpHi(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpLoEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpHiEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpNotEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpAnd(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
    procedure OpOr(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);

    function ConvertToInternal(var str:string):string;
    function ConvertToExternal(var str:string):string;
end;

function StringReplace(str:string; sold:string; snew:string):string;

implementation

procedure TCalcParse.OpAdd(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
	result.vf:=left.GetValue + right.GetValue;
end;

procedure TCalcParse.OpSub(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
    result.vf:=left.GetValue - right.GetValue;
end;

procedure TCalcParse.OpMul(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
    result.vf:=left.GetValue * right.GetValue;
end;

procedure TCalcParse.OpDiv(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
var l,r:extended;
begin
	result.Clear;
    l:=left.GetValue;
    r:=right.GetValue;
    if r=0 then begin
    	if (l<0) then begin
        	result.vf:=-2000000000;
        end else begin
        	result.vf:=2000000000;
        end;
     end else begin
    	try
    		result.vf:=l/r;
    	except
        	on EDivByZero do begin
//        	calc_error:=true;
        	end;
    	end;
    end;
end;

procedure TCalcParse.OpDivTrunc(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
var l,r:extended;
begin
	result.Clear;
    l:=left.GetValue;
    r:=right.GetValue;
    if r=0 then begin
    	if (l<0) then begin
        	result.vf:=-2000000000;
        end else begin
        	result.vf:=2000000000;
        end;
     end else begin
    	try
    		result.vf:=trunc(l/r);
    	except
        	on EDivByZero do begin
//        	calc_error:=true;
        	end;
    	end;
    end;
end;
procedure TCalcParse.OpMod(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
var l,r:extended;
	lisdegreezero:boolean;
begin
	result.Clear;
    l:=left.GetValue;
    lisdegreezero:=false;
    r:=trunc(right.GetValue);
    if r=0 then begin
    	if (l<0) then begin
        	result.vf:=-2000000000;
        end else begin
        	result.vf:=2000000000;
        end;
     end else begin
    	try
            if r<0 then begin
            	r:=(-1)*r;
            end;
            if l<0 then begin
            	l:=(-1)*l;
                lisdegreezero:=true;
            end;
            result.vf:=trunc(l - r*trunc(l/r));
            if lisdegreezero then result.vf:=result.vf*(-1);
    	except
        	on EDivByZero do begin
//        	calc_error:=true;
        	end;
    	end;
    end;
end;

procedure TCalcParse.OpTo(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
var min,max:int64;
begin
	result.Clear;
    max:=0; min:=0;
    if left.vtype=ext then begin
    	min:=round(left.vf);
    end;
    if left.vtype=diap then begin
    	min:=left.vd.GetMinimum;
    end;
    if right.vtype=ext then begin
    	max:=round(right.vf);
    end;
    if right.vtype=diap then begin
    	max:=right.vd.GetMaximum;
    end;
    result.vtype:=diap;
    result.vd.Add(min,max);
end;

procedure TCalcParse.OpIn(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
    if (left.vtype=ext)and(right.vtype=ext) then begin
    	if left.vf=right.vf then begin
        	result.vf:=1;
        end else begin
            result.vf:=0;
        end;
        exit;
    end;
    if ((left.vtype=diap)and(right.vtype=ext)) then begin
 		if left.vd.Have(right.vf) then begin
            result.vf:=1;
        end else begin
            result.vf:=0;
        end;
        exit;
    end;
    if ((left.vtype=ext)and(right.vtype=diap)) then begin
 		if right.vd.Have(left.vf) then begin
            result.vf:=1;
        end else begin
            result.vf:=0;
        end;
        exit;
    end;
    if ((left.vtype=diap)and(right.vtype=diap)) then begin
        if right.vd.Have(left.GetValue) then begin
        	result.vf:=1;
        end else begin
        	result.vf:=0;
        end;
        exit;
    end;
end;

procedure TCalcParse.OpLo(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
    if left.GetValue<right.GetValue then begin
    	result.vf:=1;
    end else begin
    	result.vf:=0;
    end;
end;

procedure TCalcParse.OpHi(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
    if left.GetValue>right.GetValue then begin
    	result.vf:=1;
    end else begin
    	result.vf:=0;
    end;
end;

procedure TCalcParse.OpLoEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
    if left.GetValue<=right.GetValue then begin
    	result.vf:=1;
    end else begin
    	result.vf:=0;
    end;
end;

procedure TCalcParse.OpHiEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
    if left.GetValue>=right.GetValue then begin
    	result.vf:=1;
    end else begin
    	result.vf:=0;
    end;
end;


procedure TCalcParse.OpEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
    if left.GetValue=right.GetValue then begin
    	result.vf:=1;
    end else begin
    	result.vf:=0;
    end;
end;

procedure TCalcParse.OpNotEq(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
    if left.GetValue<>right.GetValue then begin
    	result.vf:=1;
    end else begin
    	result.vf:=0;
    end;
end;

procedure TCalcParse.OpAnd(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
    if (left.vtype=ext)and(right.vtype=ext) then begin
		if (left.vf<>0)and(right.vf<>0) then begin
        	result.vf:=1;
        end else begin
        	result.vf:=0;
        end;
    end;
    if (left.vtype=diap)and(right.vtype=diap) then begin
		result.CopyDataFrom(left);
        result.vd.Add(right.vd);
    end;
    if (left.vtype=ext)and(right.vtype=diap) then begin
		result.CopyDataFrom(right);
        result.vd.Add(left.vf);
    end;
    if (left.vtype=diap)and(right.vtype=ext) then begin
		result.CopyDataFrom(left);
        result.vd.Add(right.vf);
    end;

end;

procedure TCalcParse.OpOr(var left:TCPVariant;var right:TCPVariant;var result:TCPVariant);
begin
	result.Clear;
    if (left.vtype=ext)and(right.vtype=ext) then begin
		if (left.vf<>0)or(right.vf<>0) then begin
        	result.vf:=1;
        end else begin
        	result.vf:=0;
        end;
    end;
    if (left.vtype=diap)and(right.vtype=diap) then begin
		result.CopyDataFrom(left);
        result.vd.Add(right.vd);
    end;
    if (left.vtype=ext)and(right.vtype=diap) then begin
		result.CopyDataFrom(right);
        result.vd.Add(left.vf);
    end;
    if (left.vtype=diap)and(right.vtype=ext) then begin
		result.CopyDataFrom(left);
        result.vd.Add(right.vf);
    end;
end;


//Перевести строку во внутренний формат
function TCalcParse.ConvertToInternal(var str:string):string;
var answer,tstr:string;
begin
	tstr:=LowerCase(str);
    repeat
    	answer:=tstr;

   		tstr:=StringReplace(tstr,'div','f');
   		tstr:=StringReplace(tstr,'mod','g');
   		tstr:=StringReplace(tstr,'in','#');
   		tstr:=StringReplace(tstr,'to','$');
        tstr:=StringReplace(tstr,'or','|');
        tstr:=StringReplace(tstr,'and','&');
		tstr:=StringReplace(tstr,'<>','e');
        tstr:=StringReplace(tstr,'>=','c');
        tstr:=StringReplace(tstr,'<=','b');
        tstr:=StringReplace(tstr,'..','h');
        tstr:=StringReplace(tstr,'.',',');
		tstr:=StringReplace(tstr,' ','');

   		tstr:=StringReplace(tstr,'d','');
   		tstr:=StringReplace(tstr,'m','');
   		tstr:=StringReplace(tstr,'o','');
   		tstr:=StringReplace(tstr,'t','');
   		tstr:=StringReplace(tstr,'i','');
		tstr:=StringReplace(tstr,'a','');
		tstr:=StringReplace(tstr,'n','');
		tstr:=StringReplace(tstr,'d','');

    until tstr=answer;
    ConvertToInternal:='('+answer+')';
end;

//Перевести строку в формат пользователя
function TCalcParse.ConvertToExternal(var str:string):string;
var answer,tstr,t:string;
    l,i:integer;
begin
	tstr:=LowerCase(str);
//    showmessage(tstr);
    repeat
    	answer:=tstr;
   		tstr:=StringReplace(tstr,'$',' to ');
   		tstr:=StringReplace(tstr,'#',' in ');
        tstr:=StringReplace(tstr,'|',' or ');
        tstr:=StringReplace(tstr,'&',' and ');
        tstr:=StringReplace(tstr,'e','<>');
        tstr:=StringReplace(tstr,'c','>=');
        tstr:=StringReplace(tstr,'b','<=');
        tstr:=StringReplace(tstr,'f',' div ');
        tstr:=StringReplace(tstr,'g',' mod ');
        tstr:=StringReplace(tstr,'h','..');
        tstr:=StringReplace(tstr,'(0-','(-');
    until tstr=answer;
    l:=length(tstr);
    t:='';
    if (l>=2) and (tstr[1]='(') and (tstr[l]=')') then begin
          for i:=2 to l-1 do t:=t+tstr[i];
          if CheckParentheses(tstr,2,l-1) then answer:=t;
    end;
    ConvertToExternal:=answer;
end;

//Вычислить приоритет операции
function TCalcParse.GetOperationOrder(op:char):integer;
var answer:integer;
begin
	answer:=-1;
    case op of
    	'/' : begin answer:=1; end;
    	'f' : begin answer:=1; end;
    	'g' : begin answer:=1; end;
    	'*' : begin answer:=2; end;
    	'-' : begin answer:=3; end;
    	'+' : begin answer:=4; end;
    	'$' : begin answer:=5; end;
    	'#' : begin answer:=6; end;
    	'c' : begin answer:=7; end;
    	'b' : begin answer:=7; end;
    	'e' : begin answer:=7; end;
    	'>' : begin answer:=7; end;
    	'<' : begin answer:=7; end;
    	'=' : begin answer:=7; end;
    	'&' : begin answer:=8; end;
    	'|' : begin answer:=9; end;
    end;
	GetOperationOrder:=answer;
end;

//Находит в строке справа налево самый старшую по приоритету операцию
//и оставляет ее. Перед этим преобразованием проводится упрощение комбинации
//знаков + и -
function TCalcParse.FixOp(var str:string):string;
var i,c,q,l:integer;
	tstr:string;
begin
	l:=length(str);
    c:=0;
    q:=0;
    for i:=1 to l do begin
    	if str[i]='-' then inc(c);
    	if str[i]='+' then inc(q);
    end;
    tstr:=StringReplace(str,'-','');
	tstr:=StringReplace(tstr,'+','');
    if c mod 2 = 1 then begin
    	tstr:=tstr+'-';
    end else begin
    	if (q>0) or (c>0) then tstr:=tstr+'+';
    end;
    l:=length(tstr);
    c:=0;
    q:=0;
    for i:=l downto 1 do begin
    	if c<=GetOperationOrder(tstr[i]) then begin
        	q:=i;
            c:=GetOperationOrder(tstr[i]);
        end;
    end;
    FixOp:=tstr[q];
end;

// Вся строка делится на строки в [ ] и вне них
// для строк без [] вызывается FixLitNorm, а в [] FixLitDP
function TCalcParse.FixSeparate(var str:string):string;
var c,l:integer;
	tstr,answer:string;
    normalscan:boolean;
begin
	answer:='';
    c:=1;
    l:=length(str);
    tstr:='';
    normalscan:=true;
    while c<=l do begin
    	if normalscan then begin
    		if str[c]='[' then begin
            	answer:=answer+FixLitNorm(tstr);
                tstr:='[';
                normalscan:=false;
                inc(c);
                continue;
			end;
            if str[c]<>'[' then begin
            	tstr:=tstr+str[c];
                inc(c);
                if c>l then answer:=answer+FixLitNorm(tstr);
                continue;
            end;
        end;
        if not normalscan then begin
            if (c>l)or(str[c]=']') then begin
            	answer:=answer+FixLitDP(tstr+']');
                tstr:='';
                normalscan:=true;
            end else begin
                tstr:=tstr+str[c];
            end;
            inc(c);
        end;
    end;
  //  showmessage(answer);
    FixSeparate:=answer;
end;

//упрощаем конструкции, стоящие за скобками []
function TCalcParse.FixLitNorm(str:string):string;
var gstr,tstr, answer:string;
	c,l:integer;
begin
//Убираем заведомо ненужные символы
	gstr:='';
    l:=length(str);
    for c:=1 to l do begin
    	case str[c] of
        	'+': ;
            '-': ;
            '*': ;
            '/': ;
            '#': ;
            '$': ;
            'c': ;
            'b': ;
            'e': ;
            'f': ;
            'g': ;
            '=': ;
            '>': ;
            '<': ;
            '&': ;
            '|': ;
            '0'..'9': ;
            ',': ;
            '(': ;
            ')': ;
			else continue;
        end;
        gstr:=gstr+str[c];
    end;
    str:=gstr;
//Начинаем преобразование конструкций
    repeat
    	gstr:=str;
		tstr:=str;
	    repeat   //Скобки поглощают некоторые рядом стоящие символы
	    	str:=tstr;
	        tstr:=StringReplace(tstr,')(',')*(');
	        tstr:=StringReplace(tstr,'()','');
	        tstr:=StringReplace(tstr,'.',',');
	        tstr:=StringReplace(tstr,',,',',');
	        tstr:=StringReplace(tstr,'(,','(0,');
	        tstr:=StringReplace(tstr,'),',')*0,');
	        tstr:=StringReplace(tstr,')0',')*0');
	        tstr:=StringReplace(tstr,')1',')*1');
	        tstr:=StringReplace(tstr,')2',')*2');
	        tstr:=StringReplace(tstr,')3',')*3');
	        tstr:=StringReplace(tstr,')4',')*4');
	        tstr:=StringReplace(tstr,')5',')*5');
	        tstr:=StringReplace(tstr,')6',')*6');
	        tstr:=StringReplace(tstr,')7',')*7');
	        tstr:=StringReplace(tstr,')8',')*8');
	        tstr:=StringReplace(tstr,')9',')*9');
	        tstr:=StringReplace(tstr,',(',',*(');
	        tstr:=StringReplace(tstr,'0(','0*(');
	        tstr:=StringReplace(tstr,'1(','1*(');
	        tstr:=StringReplace(tstr,'2(','2*(');
	        tstr:=StringReplace(tstr,'3(','3*(');
	        tstr:=StringReplace(tstr,'4(','4*(');
	        tstr:=StringReplace(tstr,'5(','5*(');
	        tstr:=StringReplace(tstr,'6(','6*(');
	        tstr:=StringReplace(tstr,'7(','7*(');
			tstr:=StringReplace(tstr,'8(','8*(');
	        tstr:=StringReplace(tstr,'9(','9*(');
	    until str=tstr;

        //Упрощаем конструкции из рядом стоящих операций
		l:=length(str);
        tstr:='';
        answer:='';
        c:=1;
        while c<=l do begin
            if (GetOperationOrder(str[c])>0)and(c<=l) then begin
                tstr:='';
                while (GetOperationOrder(str[c])>0)and(c<=l) do begin
                    tstr:=tstr+str[c];
                    inc(c);
                end;
                answer:=answer+FixOp(tstr);
            end;
            if GetOperationOrder(str[c])<0 then begin
                tstr:='';
                while (GetOperationOrder(str[c])<0)and(c<=l) do begin
                    tstr:=tstr+str[c];
                    inc(c);
                end;
                answer:=answer+tstr;
            end;
        end;

 		str:=answer;
    	tstr:=str;
    	repeat   //Cнова скобки вносят преобразования
    		str:=tstr;
    		tstr:=StringReplace(tstr,'(+','(');
    		tstr:=StringReplace(tstr,'(*','(');
    		tstr:=StringReplace(tstr,'(/','(');
    		tstr:=StringReplace(tstr,'(&','(');
    		tstr:=StringReplace(tstr,'(|','(');
    		tstr:=StringReplace(tstr,'(#','(');
    		tstr:=StringReplace(tstr,'($','(');
    		tstr:=StringReplace(tstr,'(c','(');
    		tstr:=StringReplace(tstr,'(b','(');
    		tstr:=StringReplace(tstr,'(e','(');
    		tstr:=StringReplace(tstr,'(f','(');
    		tstr:=StringReplace(tstr,'(g','(');
    		tstr:=StringReplace(tstr,'(<','(');
    		tstr:=StringReplace(tstr,'(>','(');
    		tstr:=StringReplace(tstr,'(=','(');
    		tstr:=StringReplace(tstr,'-)',')');
    		tstr:=StringReplace(tstr,'+)',')');
    		tstr:=StringReplace(tstr,'*)',')');
    		tstr:=StringReplace(tstr,'/)',')');
    		tstr:=StringReplace(tstr,'&)',')');
    		tstr:=StringReplace(tstr,'|)',')');
    		tstr:=StringReplace(tstr,'$)',')');
    		tstr:=StringReplace(tstr,'#)',')');
    		tstr:=StringReplace(tstr,'c)',')');
    		tstr:=StringReplace(tstr,'b)',')');
    		tstr:=StringReplace(tstr,'e)',')');
    		tstr:=StringReplace(tstr,'f)',')');
    		tstr:=StringReplace(tstr,'g)',')');
    		tstr:=StringReplace(tstr,'>)',')');
    		tstr:=StringReplace(tstr,'<)',')');
    		tstr:=StringReplace(tstr,'=)',')');
    		tstr:=StringReplace(tstr,'()','');
    		tstr:=StringReplace(tstr,')(',')*(');
    	until str=tstr;
    until gstr=str; //если поменять больше нечего - получаем ответ
	FixLitNorm:=str;
end;

//упрощает и распознает диапазон или параметр
function TCalcParse.FixLitDP(str:string):string;
begin
   if StringReplace(str,'p','')<>str then FixLitDP:=FixLitP(str)
   else FixLitDP:=FixLitD(str);
end;

//упрощает и распознает параметр
function TCalcParse.FixLitP(str:string):string;
var l,i:integer;
	tstr:string;
begin
    l:=length(str);
	tstr:='';
    for i:=1 to l do begin
    	if length(tstr)>2 then break;
		if (str[i]>='0')and(str[i]<='9') then begin
            tstr:=tstr+str[i];
        end;
    end;
    i:=strtoint('0'+tstr);
    if (i>0)and(i<97) then begin
        FixLitP:='[p'+inttostr(i)+']';
    end else begin
    	FixLitP:='[err]';
		parameters_error:=true;
        error:=true;
    end;
end;

//упрощает и распознает диапазон
function TCalcParse.FixLitD(str:string):string;
var i,l:integer;
	tstr:string;
    d:TCPDiapazone;
begin
	tstr:='';
    l:=length(str);
	for i:=1 to l do begin
        case str[i] of
        	'0'..'9': ;
            '-': ;
            ';': ;
            'h': ;
        	else continue;
         end;
         tstr:=tstr+str[i];
    end;
    str:=';'+tstr+';';
    tstr:=str;
    repeat
    	str:=tstr;
        tstr:=StringReplace(tstr,'--','');
        tstr:=StringReplace(tstr,';;',';');
        tstr:=StringReplace(tstr,'h;',';');
        tstr:=StringReplace(tstr,';h',';');
        tstr:=StringReplace(tstr,'-;',';');
        tstr:=StringReplace(tstr,'-h','h');
        tstr:=StringReplace(tstr,'hh','h');
    until str=tstr;
    if (tstr<>';')and(length(str)>0) then begin
        str[1]:='[';
        str[length(str)]:=']';
        d:=TCPDiapazone.Create;
		d.Assign(str);
        str:=d.GetString;
        d.Destroy;
        FixLitD:=str;
    end else begin
    	FixLitD:='[err]';
		diapazone_error:=true;
        error:=true;
    end;
end;

function TCalcParse.FixFinal(str:string):string;
	var tstr:string;
begin
	tstr:=str;
    repeat
    	str:=tstr;
		tstr:=StringReplace(tstr,'-,','-0,');

    	tstr:=StringReplace(tstr,')[',')*[');
		tstr:=StringReplace(tstr,'](',']*(');
    	tstr:=StringReplace(tstr,')(',')*(');
		tstr:=StringReplace(tstr,'][',']*[');

		tstr:=StringReplace(tstr,'],',']*0,');
		tstr:=StringReplace(tstr,']0',']*0');
		tstr:=StringReplace(tstr,']1',']*1');
		tstr:=StringReplace(tstr,']2',']*2');
		tstr:=StringReplace(tstr,']3',']*3');
		tstr:=StringReplace(tstr,']4',']*4');
		tstr:=StringReplace(tstr,']5',']*5');
		tstr:=StringReplace(tstr,']6',']*6');
		tstr:=StringReplace(tstr,']7',']*7');
		tstr:=StringReplace(tstr,']8',']*8');
		tstr:=StringReplace(tstr,']9',']*9');
   		tstr:=StringReplace(tstr,',[',',*[');
   		tstr:=StringReplace(tstr,'0[','0*[');
   		tstr:=StringReplace(tstr,'1[','1*[');
   		tstr:=StringReplace(tstr,'2[','2*[');
   		tstr:=StringReplace(tstr,'3[','3*[');
   		tstr:=StringReplace(tstr,'4[','4*[');
   		tstr:=StringReplace(tstr,'5[','5*[');
   		tstr:=StringReplace(tstr,'6[','6*[');
   		tstr:=StringReplace(tstr,'7[','7*[');
   		tstr:=StringReplace(tstr,'8[','8*[');
   		tstr:=StringReplace(tstr,'9[','9*[');
    until str=tstr;
    FixFinal:=str;
end;

//Находит в строке самую младшую по приоритету операцию, стоящую вне скобок
function TCalcParse.FindOperation(var s:string; len:integer):integer;
var newoporder,oporder,pos,i:integer;
	spcount,pcount:integer;
begin
	//!! Проверено: 100/10/10 - вычисляется правильно 100/10=10, 10/10=1
    //!! КАК и договаривались с Димой
	oporder:=0;
    pos:=0;
    spcount:=0;
    pcount:=0;
	for	i:=1 to len do begin
    	if s[i]='(' then inc(pcount);
    	if s[i]='[' then inc(spcount);
    	if s[i]=')' then dec(pcount);
    	if s[i]=']' then dec(spcount);
        if (pcount=0) and (spcount=0) then begin
            newoporder:=GetOperationOrder(s[i]);
			if (oporder<=newoporder) then begin
				oporder:=newoporder;
            	pos:=i;
            end;
        end
    end;
    FindOperation:=pos;
end;

function TCalcParse.StrIsValue(var s:string; len:integer):boolean;
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

function TCalcParse.Calc(expr:string):TCPVariant;
label finalize;
var lenexpr:integer;
	t,left,right:string;
    i,c:integer;
    lf,rf,af:TCPVariant;
begin
	af:=TCPVariant.Create;
	lf:=TCPVariant.Create;
	rf:=TCPVariant.Create;
	if not calc_error then begin
    	lenexpr:=length(expr);
    	if af.Assign(expr) then begin
//        	showmessage(expr);
            goto finalize;
        end;
        if (((expr[1]='(')and(expr[lenexpr]=')'))and(CheckParentheses(expr,2,lenexpr-1))) then begin
                t:='';
                for i:=2 to lenexpr-1 do t:=t+expr[i];
                af.CopyDataFrom(Calc(t));
            end
            else begin
                c:=FindOperation(expr,lenexpr);
                if c<1 then begin calc_error:=true; goto finalize; end;
                left:='';
                for i:=1 to c-1 do left:=left+expr[i];
                right:='';
                for i:=c+1 to lenexpr do right:=right+expr[i];

 //	showmessage('    ~'+left+'~    ~'+expr[c]+'~    ~'+right+'~');

                rf.CopyDataFrom(Calc(right));
                if calc_error then begin
 //               	Showmessage('err: Calc right ~'+right+'~');
                	goto finalize;
                end;
                lf.CopyDataFrom(Calc(left));
                if calc_error then begin
//                	Showmessage('err: Calc left ~'+left+'~');
                	goto finalize;
                end;

                try
                	if expr[c]='+' then begin OpAdd(lf,rf,af); end else
                  	if expr[c]='-' then begin OpSub(lf,rf,af); end else
                	if expr[c]='*' then begin OpMul(lf,rf,af); end else
                	if expr[c]='/' then begin OpDiv(lf,rf,af); end else
                	if expr[c]='f' then begin OpDivTrunc(lf,rf,af); end else
                	if expr[c]='g' then begin OpMod(lf,rf,af); end else
                	if expr[c]='$' then begin OpTo(lf,rf,af); end else
                	if expr[c]='#' then begin OpIn(lf,rf,af); end else
                	if expr[c]='>' then begin OpHi(lf,rf,af); end else
                	if expr[c]='<' then begin OpLo(lf,rf,af); end else
                	if expr[c]='c' then begin OpHiEq(lf,rf,af); end else
                	if expr[c]='b' then begin OpLoEq(lf,rf,af); end else
                	if expr[c]='e' then begin OpNotEq(lf,rf,af); end else
                	if expr[c]='=' then begin OpEq(lf,rf,af); end else
                	if expr[c]='&' then begin OpAnd(lf,rf,af); end else
                	if expr[c]='|' then begin OpOr(lf,rf,af); end;
                except
              	  	on EMathError do begin
//                	ShowMessage(expr[c]+' @ ' +left+ ' @ '+right);
                    	calc_error:=true;
                        error:=true;
                    end;
               	  	on EInvalidOp do begin
//                	ShowMessage(expr[c]+' @ ' +left+ ' @ '+right);
                    	calc_error:=true;
                        error:=true;
                    end;
               	  	on EOverflow do begin
 //               	ShowMessage(expr[c]+' @ ' +left+ ' @ '+right);
                    	calc_error:=true;
                        error:=true;
                    end;
               	  	on EZeroDivide do begin
//                	ShowMessage(expr[c]+' @ ' +left+ ' @ '+right);
                    	calc_error:=true;
                        error:=true;
                    end;
                end;
            end;
    end;
finalize:
    Calc:=TCPVariant.Create;
    Calc.CopyDataFrom(af);
    af.Destroy;
    rf.Destroy;
    lf.Destroy;
end;

procedure TCalcParse.Parse(var values:TParValues);
var af:TCPVariant;
	f:extended;
begin
	af:=TCPVariant.Create;
    if error then exit;
   	af.CopyDataFrom(Calc('('+InsertParValues(values)+')'));
    f:=af.GetValue;
    af.Destroy;
    if (f<-2000000000) then f:=-2000000000;
    if (f>2000000000) then f:=2000000000;
    try
      answer:=round(f+0.00000000001);
    except
    	on EInvalidOp do begin
        	calc_error:=true;
            error:=true;
            answer:=0;
        end;
    end;
    if (answer<0) and (f>0) then begin
    	calc_error:=true;
    	error:=true;
		answer:=0;
    end;
    if calc_error then error:=true;
end;

function StringReplace(str:string; sold:string; snew:string):string;
var
    strlen,soldlen,i,u:integer;
begin
    Result:='';
    strlen:=Length(str);
    soldlen:=Length(sold);
    if (strlen<soldlen) or (strlen<1) or (soldlen<1) then begin Result:=str; Exit; end;
    i:=0;
    while i<=strlen-soldlen do begin
        u:=0;
        while u<soldlen do begin
            if str[i+u+1]<>sold[u+1] then break;
            inc(u);
        end;
        if u>=soldlen then begin
            Result:=Result+snew;
            i:=i+soldlen;
        end else begin
            Result:=Result+str[i+1];
            inc(i);
        end;
    end;
    if i<strlen then begin
        Result:=Result+Copy(str,i+1,strlen-i);
    end;
end;

procedure TCalcParse.AssignAndPreprocess(str:string; currparnum:integer);
var i,c:integer;
	tempstr:string;
begin
	Clear;
    orig_str:=str;
	str:=ConvertToInternal(str);
    str:=FixSeparate(str);
    str:=FixFinal(str);
    str:=FixNum(str);
    parentheses_error:=not CheckParentheses(str);
    if parentheses_error then error:=true;

    tempstr:=str;
	if not error then begin
	    i:=length(str);
	    if ((i>=2)and(str[1]='(')and(str[i]=')')and CheckParentheses(str,2,i-1))then begin
			tempstr:='';
			for c:=2 to i-1 do tempstr:=tempstr+str[c];
        end;
    end;
    if orig_str<>ConvertToExternal(tempstr) then sym_warning:=true;

    if (str='') or (str='[p'+inttostr(currparnum)+']') then begin
        default_expression:=true;
        str:='[p'+inttostr(currparnum)+']';
    end;

    internal_str:=str;
end;

constructor TCalcParse.Create();
begin
Clear();
end;

procedure TCalcParse.Clear();
begin
	orig_str:='';
    internal_str:='';
    answer:=0;
    currparnum:=0;
    sym_warning:=false;
    parentheses_error:=false;
    num_error:=false;
    parameters_error:=false;
	diapazone_error:=false;
    calc_error:=false;
	default_expression:=false;
    error:=false;
end;

//возвращает true если скобки расставлены верно
function TCalcParse.CheckParentheses(var s:string; startpos,endpos:integer):boolean;
var i,c:integer;
    answer:boolean;
begin
	i:=0;
    answer:=true;
    for c:=startpos to endpos do begin
        if s[c]='(' then inc(i);
        if s[c]=')' then dec(i);
        if i<0 then begin answer:=false; break; end;
    end;
    if i<>0 then answer:=false;
    CheckParentheses:=answer;
end;

function TCalcParse.CheckSParentheses(var s:string; startpos,endpos:integer):boolean;
var i,c:integer;
    answer:boolean;
begin
	i:=0;
    answer:=true;
    for c:=startpos to endpos do begin
        if s[c]='[' then inc(i);
        if s[c]=']' then dec(i);
        if i<0 then begin answer:=false; break; end;
    end;
    if i<>0 then answer:=false;
    CheckSParentheses:=answer;
end;

function TCalcParse.InsertParValues(var values:TParValues):string;
var i:integer;
	tstr:string;
begin
	tstr:=internal_str;
	for i:=1 to maxparameters do begin
        if values[i]<0 then begin
			tstr:=StringReplace(tstr,'[p'+inttostr(i)+']','(0'+inttostr(values[i])+')');
        end
        else begin
			tstr:=StringReplace(tstr,'[p'+inttostr(i)+']',inttostr(values[i]));
        end;
    end;
    InsertParValues:=tstr;
end;

function TCalcParse.CheckParentheses(var s:string):boolean;
var f:boolean;
begin
	f:=CheckParentheses(s,1,length(s));
//	if  f then showmessage(s+'  !! no error')
//	else showmessage(s+'  !!  error');
    CheckParentheses:=f;
end;


function TCalcParse.FixNum(str:string):string;
var i,c:integer;
	f:extended;
    s,s1:string;
begin
	i:=1;
    c:=length(str);
    s:='';
    s1:='';
    f:=0;
    while i<=c do begin
        if (((str[i]>='0')and(str[i]<='9'))or(str[i]=',')) then begin
            s:=s+str[i];
        end else begin
        	if (s<>'') then begin
   		   		try
                	f:=strtofloat(s);
                except
               	   on EConvertError do begin
                   		error:=true;
                   		num_error:=true;
                        exit;
                   end;
                end;
                if (f>999999999) then f:=999999999;
                if ((f<0.0001)and(f<>0)) then f:=0.0001;
                s1:=s1+floattostr(f)+str[i];
                s:='';
            end
            else begin
				s1:=s1+str[i];
            end;
        end;
    	inc(i);
    end;
    FixNum:=s1;
end;

end.

