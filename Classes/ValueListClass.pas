unit ValueListClass;

interface

uses SysUtils,Dialogs;

type PText=^file;

type TValuesList=class(TObject)
  Negation:boolean;
  Values:array of integer;
  Count:integer;

  constructor Create;

  procedure Clear;
  procedure SetFromString(txt:string);
  function TestString(txt:string):boolean;
  function GetString:string;

  function DelDeniedSymbols(txt:string):string;
  function StringReplace(str:string; sold:string; snew:string):string;
       
  procedure CopyDataFrom(var source:TValuesList);
  function  IsEqualWith(var source:TValuesList):boolean;

  procedure Save(fileout:ptext);
  procedure Load(filein:ptext);
end;

implementation


function TValuesList.StringReplace(str:string; sold:string; snew:string):string;
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

function TValuesList.DelDeniedSymbols(txt:string):string;
label done;
var
  i:integer;
  ttxt:string;
begin
  ttxt:='';
  for i:=1 to length(txt) do begin
    if(txt[i] in ['0'..'9']) or (txt[i]=';') or (txt[i]=',') or (txt[i]='-') then begin
      ttxt:=ttxt+txt[i];
    end;
  end;
  txt:=ttxt;
  ttxt:='('+txt+')';
  repeat
    txt:=ttxt;
    ttxt:=StringReplace(ttxt,',',';');
    ttxt:=StringReplace(ttxt,';;',';');
    ttxt:=StringReplace(ttxt,'-;',';');
    ttxt:=StringReplace(ttxt,'--','');
    ttxt:=StringReplace(ttxt,'(-;','(');
    ttxt:=StringReplace(ttxt,'(-)','(');
    ttxt:=StringReplace(ttxt,'(;','(');
    ttxt:=StringReplace(ttxt,';-)',')');
    ttxt:=StringReplace(ttxt,';)',')');
  until txt=ttxt;
  txt:=StringReplace(txt,'(','');
  txt:=StringReplace(txt,')','');
done:
  DelDeniedSymbols:=txt;
end;

constructor TValuesList.Create;
begin
  clear;
end;

procedure TValuesList.Save(fileout:ptext);
var
  i:integer;
begin
  BlockWrite(fileout^,count,sizeof(count));
  BlockWrite(fileout^,Negation,sizeof(Negation));

  for i:=1 to count do
    BlockWrite(fileout^,values[i],sizeof(values[i]));
end;

procedure TValuesList.Load(filein:ptext);
var
  i:integer;
begin
  BlockRead(filein^,count,sizeof(count));
  BlockRead(filein^,Negation,sizeof(Negation));

  SetLength(values,count+2);
  for i:=1 to count do
    BlockRead(filein^,values[i],sizeof(values[i]));
end;

function  TValuesList.IsEqualWith(var source:TValuesList):boolean;
label done;
var
  i:integer;
  answer:boolean;
begin
  answer:=true;

  if count<>source.Count then begin answer:=false; goto done; end;
  if Negation<>source.Negation then begin answer:=false; goto done; end;

  for i:=1 to count do
  if values[i]<>source.Values[i] then begin answer:=false; goto done; end;
done:
  IsEqualWith:=answer;
end;

procedure TValuesList.CopyDataFrom(var source:TValuesList);
var
  i:integer;
begin
  count:=source.count;
  Negation:=source.Negation;

  SetLength(Values,count+2);

  for i:=1 to count do values[i]:=source.values[i];
end;

procedure TValuesList.Clear;
begin
  SetLength(values,1);
  Count:=0;
  Negation:=true;
end;


function TValuesList.TestString(txt:string):boolean;
label done;
var
  ok:boolean;
begin
  ok:=true;
  txt:=DelDeniedSymbols(txt);
done:
  TestString:=ok;
end;

function TValuesList.GetString:string;
var
  i:integer;
  str:string;
begin
  str:='';
  for i:=1 to count do begin
    if i<>count then
      str:=str+inttostr(values[i])+';'
    else
      str:=str+inttostr(values[i]);
  end;
  GetString:=str;
end;

procedure TValuesList.SetFromString(txt:string);
var
  integers:array [1..100] of integer;
  i:integer;
  tstr:string;
begin
  Clear;
  i:=1;
  count:=0;
  tstr:='';
  txt:=trim(DelDeniedSymbols(txt));
  if TestString(txt) then begin
    while(i<=length(txt)) do begin
      if txt[i]<>';' then tstr:=tstr+txt[i];
      if (i=length(txt)) or (txt[i+1]=';') then begin
        inc(count);
        integers[count]:=strtoint(tstr);
        tstr:='';
      end;
      inc(i);
    end;
    setlength(values,count+2);
    for i:=1 to count do values[i]:=integers[i];
  end else begin
    ShowMessage('Формат списка неправилен');
  end;
end;

end.

