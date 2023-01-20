unit App;

interface

procedure Start;

implementation

uses
  System.SyncObjs,
  System.SysUtils,
  Horse;

procedure Start;
var LPort : Integer; LContext : string;
begin
  // O número da porta pode ser passada por parâmetro para o executável
  LPort :=  StrToIntDef(ParamStr(1), 9000);



  THorse.Listen(LPort,
    procedure(Horse: THorse)
    begin
      Writeln(Format('Server is runing on %s:%d', [Horse.Host, Horse.Port]));
      Writeln(Format('Try use Swagger on http://localhost:%d%s/swagger-ui',
        [Horse.Port, LContext]));
      ReadLn;
    end);
end;

end.
