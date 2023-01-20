unit App;

interface

procedure Start;

implementation

uses
  System.SyncObjs,
  System.SysUtils,

  Horse,
  Horse.HandleException,
  Horse.GBSwagger;

const API_VERSION = '0.1.0';

procedure ConfigLogger();
begin

end;

procedure ConfigSwagger();
begin
  Swagger
    .BasePath(THorse.Host)
    .Register
      .Response(Integer(THTTPStatus.NoContent)).Description('No Content').&End
      .Response(Integer(THTTPStatus.BadRequest)).Description('Bad Request').&End
      .Response(Integer(THTTPStatus.NotFound)).Description('Not Found').&End
      .Response(Integer(THTTPStatus.InternalServerError)).Description('Internal Server Error').&End
    .&End
    .AddProtocol(TGBSwaggerProtocol.gbHttp)
    .AddProtocol(TGBSwaggerProtocol.gbHttps)
    .Info
      .Title('dRemoteControl API')
      .Version(API_VERSION)
      .Contact
        .Name('dRemoteControl API - API para Controle Remoto')
      .&End
    .&End
  .&End;
end;

procedure Start;
var LPort : Integer; LContext : string;
begin
  {$IFDEF MSWINDOWS}
  IsConsole := False;
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  // O número da porta pode ser passada por parâmetro para o executável
  LPort :=  StrToIntDef(ParamStr(1), 9000);
  LContext := '/d-remote-control-api';

  ConfigLogger();
  ConfigSwagger();

  THorse
    .Use(HorseSwagger(LContext+'/swagger-ui', LContext+'/api-docs'));

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
