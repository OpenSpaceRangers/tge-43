unit ParViewStringClass;

interface

uses TextFieldClass,SysUtils;

type PText=^file;

type TParWiewString=class
  public
    min,max:integer;
    str:TTextField;

    constructor Create(txt:Widestring);
    procedure CopyDataFrom(source:TParWiewString);
    procedure Save(fileout:ptext);
    procedure Load(filein:ptext);
end;

implementation


procedure TParWiewString.Save(fileout:ptext);
begin
  BlockWrite(fileout^,min,sizeof(min));
  BlockWrite(fileout^,max,sizeof(max));
  str.Save(TextFieldClass.PText(fileout));
end;

procedure TParWiewString.Load(filein:ptext);
begin
  BlockRead(filein^,min,sizeof(min));
  BlockRead(filein^,max,sizeof(max));
  str.Load(TextFieldClass.PText(filein));
end;

procedure TParWiewString.CopyDataFrom(source:TParWiewString);
begin
  min:=source.min;
  max:=source.max;
  str.text:=trim(source.str.text);
end;


constructor TParWiewString.Create(txt:Widestring);
begin
  str:=TTextField.Create;
  str.text:=txt;
end;

end.
 