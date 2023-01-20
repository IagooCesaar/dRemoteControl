unit DRemoteControl.Controller.MediaControl;

interface

procedure Registry(AContext: string);
procedure ConfigSwagger(AContext: string);

implementation

uses
  Horse,
  Horse.GBSwagger,
  GBSwagger.Model.Interfaces;

procedure PostPlayPause(Req: THorseRequest; Resp: THorseResponse);
begin

end;

procedure Registry(AContext: string);
const cResource = '/media-control';
begin
  THorse.Post(AContext + cResource + '/play-pause', PostPlayPause);


  ConfigSwagger(AContext + cResource);
end;

procedure ConfigSwagger(AContext: string);
begin
  Swagger
    .Path(AContext+'/play-pause')
    .Tag('Controles de M�dia')
      .POST('Altera o estado da m�dia em execu��o para Play ou Pause')
        .Description('Altera o estado da m�dia em execu��o para Play ou Pause')

        .AddResponse(Integer(THTTPStatus.NoContent)).&End
        .AddResponse(Integer(THTTPStatus.BadRequest)).&End
      .&End
    .&End
end;

end.
