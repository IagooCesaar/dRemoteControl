unit App;

interface

procedure Start;

implementation

uses
  System.SyncObjs,
  System.SysUtils,

  Horse,
  Horse.Logger,
  Horse.Logger.Provider.Console,
  Horse.HandleException,
  Horse.GBSwagger,

  DRemoteControl.Controller.Registry;

const API_VERSION = '0.1.0';

procedure ConfigLogger();
var LLogFileConfig: THorseLoggerConsoleConfig;
begin
  LLogFileConfig := THorseLoggerConsoleConfig.New
    .SetLogFormat('${request_clientip} [${time}] "${request_method}::${request_path_translated}" '+
    '${response_status} ${execution_time}ms');

  THorseLoggerManager.RegisterProvider(THorseLoggerProviderConsole.New());
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
  LContext := '/d-remote-control';

  ConfigLogger();
  ConfigSwagger();

  THorse
    .Use(THorseLoggerManager.HorseCallback)
    .Use(HorseSwagger(LContext+'/swagger-ui', LContext+'/api-docs'));

  DRemoteControl.Controller.Registry.Registry(LContext);

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
