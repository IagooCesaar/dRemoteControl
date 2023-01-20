unit DRemoteControl.Controller.MediaControl;

interface

procedure Registry(AContext: string);
procedure ConfigSwagger(AContext: string);

implementation

uses
  Horse,
  Horse.GBSwagger,
  GBSwagger.Model.Interfaces,

  DRemoteControl.Model.AtalhosTeclado;

procedure PostPlayPause(Req: THorseRequest; Resp: THorseResponse);
begin
  TDRemoteControlModelAtalhosTeclados.New
    .MediaPlayPause;

  Resp.Status(THTTPStatus.NoContent);
end;

procedure PostNextTrack(Req: THorseRequest; Resp: THorseResponse);
begin
  TDRemoteControlModelAtalhosTeclados.New
    .MediaNextTrack;

  Resp.Status(THTTPStatus.NoContent);
end;

procedure PostPreviousTrack(Req: THorseRequest; Resp: THorseResponse);
begin
  TDRemoteControlModelAtalhosTeclados.New
    .MediaPreviousTrack;

  Resp.Status(THTTPStatus.NoContent);
end;

procedure Registry(AContext: string);
const cResource = '/media-control';
begin
  THorse.Post(AContext + cResource + '/play-pause', PostPlayPause);
  THorse.Post(AContext + cResource + '/next-track', PostNextTrack);
  THorse.Post(AContext + cResource + '/previous-track', PostPreviousTrack);


  ConfigSwagger(AContext + cResource);
end;

procedure ConfigSwagger(AContext: string);
begin
  Swagger
    .Path(AContext+'/play-pause')
    .Tag('Controles de M�dia')
      .POST('Play/Pause')
        .Description('Altera o estado da m�dia em execu��o para Play ou Pause')

        .AddResponse(Integer(THTTPStatus.NoContent)).&End
        .AddResponse(Integer(THTTPStatus.BadRequest)).&End
      .&End
    .&End

    .Path(AContext+'/next-track')
    .Tag('Controles de M�dia')
      .POST('Pr�xima m�dia')
        .Description('Altera o estado da m�dia em execu��o para Play ou Pause')

        .AddResponse(Integer(THTTPStatus.NoContent)).&End
        .AddResponse(Integer(THTTPStatus.BadRequest)).&End
      .&End
    .&End

    .Path(AContext+'/previous-track')
    .Tag('Controles de M�dia')
      .POST('M�dia anteroior')
        .Description('Altera o estado da m�dia em execu��o para Play ou Pause')

        .AddResponse(Integer(THTTPStatus.NoContent)).&End
        .AddResponse(Integer(THTTPStatus.BadRequest)).&End
      .&End
    .&End
end;

end.
