unit App;

interface

procedure Start;

implementation

uses
  StrUtils, DateUtils, SysUtils, Math;

procedure Start;
var LPort : Integer;
begin

  LPort :=  StrToIntDef(ParamStr(1), 9000);

end;

end.
