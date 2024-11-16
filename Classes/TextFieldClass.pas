unit TextFieldClass;

interface

uses  Classes,SysUtils;

type PText=^file;

type TTextField=class(TObject)
  public
    Text:WideString;

    procedure Save(f:PText);
    procedure Load(f:PText);
    procedure Clear;
    procedure CopyDataFrom(var source:TTextField);
end;


implementation

procedure TtextField.Clear;
begin
  Text:='';
end;

procedure TTextField.CopyDataFrom(var source:TTextField);
begin
  Text:=source.Text;
end;

procedure TTextField.Save(f:PText);
var
  c,t,l:integer;
  tempstr:widestring;
begin
  t:=1;
  BlockWrite(f^,t,sizeof(t));

  tempstr:=trim(Text);
  l:=length(tempstr);

  BlockWrite(f^,l,sizeof(l));

  for c:=1 to l do
    BlockWrite(f^,tempstr[c],sizeof(tempstr[c]));
end;

procedure TTextField.Load(f:PText);
var
  tempstr:widestring;
  c,q,m,t:integer;
begin
  Clear;
  BlockRead(f^,m,sizeof(m));
  for q:=1 to m do begin
    BlockRead(f^,t,sizeof(t));
    SetLength(tempstr,t);
    for c:=1 to t do BlockRead(f^,tempstr[c],sizeof(tempstr[c]));

    Text:=Text+#13#10+tempstr;
  end;
end;

end.
