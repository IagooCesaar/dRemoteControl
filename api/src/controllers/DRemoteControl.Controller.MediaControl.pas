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
    .MediaPressionarPlayPause;

  Resp.Status(THTTPStatus.NoContent);
end;

procedure PostStop(Req: THorseRequest; Resp: THorseResponse);
begin
  TDRemoteControlModelAtalhosTeclados.New
    .MediaPressionarStop;

  Resp.Status(THTTPStatus.NoContent);
end;

procedure PostNextTrack(Req: THorseRequest; Resp: THorseResponse);
begin
  TDRemoteControlModelAtalhosTeclados.New
    .MediaPressionarNextTrack;

  Resp.Status(THTTPStatus.NoContent);
end;

procedure PostPreviousTrack(Req: THorseRequest; Resp: THorseResponse);
begin
  TDRemoteControlModelAtalhosTeclados.New
    .MediaPressionarPreviousTrack;

  Resp.Status(THTTPStatus.NoContent);
end;

procedure PostVolumeUp(Req: THorseRequest; Resp: THorseResponse);
begin
  TDRemoteControlModelAtalhosTeclados.New
    .MediaPressionarAumentarVolume;

  Resp.Status(THTTPStatus.NoContent);
end;

procedure PostVolumeDown(Req: THorseRequest; Resp: THorseResponse);
begin
  TDRemoteControlModelAtalhosTeclados.New
    .MediaPressionarDiminuirVolume;

  Resp.Status(THTTPStatus.NoContent);
end;

procedure PostVolumeMute(Req: THorseRequest; Resp: THorseResponse);
begin
  TDRemoteControlModelAtalhosTeclados.New
    .MediaPressionarMutarVolume;

  Resp.Status(THTTPStatus.NoContent);
end;

procedure Registry(AContext: string);
const cResource = '/media-control';
begin
  THorse.Post(AContext + cResource + '/play-pause', PostPlayPause);
  THorse.Post(AContext + cResource + '/stop', PostStop);
  THorse.Post(AContext + cResource + '/next-track', PostNextTrack);
  THorse.Post(AContext + cResource + '/previous-track', PostPreviousTrack);

  THorse.Post(AContext + cResource + '/volume-up', PostVolumeUp);
  THorse.Post(AContext + cResource + '/volume-down', PostVolumeDown);
  THorse.Post(AContext + cResource + '/volume-mute', PostVolumeMute);


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

    .Path(AContext+'/stop')
    .Tag('Controles de M�dia')
      .POST('Stop')
        .Description('Altera o estado da m�dia em execu��o para Stop')

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

    .Path(AContext+'/volume-up')
    .Tag('Controles de M�dia')
      .POST('Aumentar o volume')
        .Description('Aumentar� o volume do �udio do dispositivo')

        .AddResponse(Integer(THTTPStatus.NoContent)).&End
        .AddResponse(Integer(THTTPStatus.BadRequest)).&End
      .&End
    .&End

    .Path(AContext+'/volume-down')
    .Tag('Controles de M�dia')
      .POST('Diminuir o volume')
        .Description('Diminuir� o volume do �udio do dispositivo')

        .AddResponse(Integer(THTTPStatus.NoContent)).&End
        .AddResponse(Integer(THTTPStatus.BadRequest)).&End
      .&End
    .&End

    .Path(AContext+'/volume-mute')
    .Tag('Controles de M�dia')
      .POST('Selenciar o volume')
        .Description('Silenciar� o volume do �udio do dispositivo')

        .AddResponse(Integer(THTTPStatus.NoContent)).&End
        .AddResponse(Integer(THTTPStatus.BadRequest)).&End
      .&End
    .&End
end;

end.
