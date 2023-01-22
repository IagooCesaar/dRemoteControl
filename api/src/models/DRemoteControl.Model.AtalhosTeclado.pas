unit DRemoteControl.Model.AtalhosTeclado;

interface

uses
  System.Classes,
  Winapi.Windows,
  DRemoteControl.Model.Interfaces;

type
  TDRemoteControlModelAtalhosTeclados = class(TInterfacedObject,
    IDRemoteControlModelAtalhosTeclado)
  private
    function PressionarLiberarTecla(Tecla: Byte): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IDRemoteControlModelAtalhosTeclado;


    function MediaPressionarPlayPause: Boolean;
    function MediaPressionarStop: Boolean;
    function MediaPressionarNextTrack: Boolean;
    function MediaPressionarPreviousTrack: Boolean;
    function MediaPressionarAumentarVolume: Boolean;
    function MediaPressionarDiminuirVolume: Boolean;
    function MediaPressionarMutarVolume: Boolean;

  end;

implementation

{ TDRemoteControlModelAtalhosTeclados }

constructor TDRemoteControlModelAtalhosTeclados.Create;
begin

end;

destructor TDRemoteControlModelAtalhosTeclados.Destroy;
begin

  inherited;
end;

function TDRemoteControlModelAtalhosTeclados.MediaPressionarDiminuirVolume: Boolean;
begin
  Self.PressionarLiberarTecla(VK_VOLUME_DOWN);
end;

function TDRemoteControlModelAtalhosTeclados.MediaPressionarAumentarVolume: Boolean;
begin
  Self.PressionarLiberarTecla(VK_VOLUME_UP);
end;

function TDRemoteControlModelAtalhosTeclados.MediaPressionarMutarVolume: Boolean;
begin
  Self.PressionarLiberarTecla(VK_VOLUME_MUTE);
end;

function TDRemoteControlModelAtalhosTeclados.MediaPressionarNextTrack: Boolean;
begin
  Self.PressionarLiberarTecla(VK_MEDIA_NEXT_TRACK);
end;

function TDRemoteControlModelAtalhosTeclados.MediaPressionarPlayPause: Boolean;
begin
  Self.PressionarLiberarTecla(VK_MEDIA_PLAY_PAUSE);
end;

function TDRemoteControlModelAtalhosTeclados.MediaPressionarPreviousTrack: Boolean;
begin
  Self.PressionarLiberarTecla(VK_MEDIA_PREV_TRACK);
end;

function TDRemoteControlModelAtalhosTeclados.MediaPressionarStop: Boolean;
begin
  Self.PressionarLiberarTecla(VK_MEDIA_STOP);
end;

class function TDRemoteControlModelAtalhosTeclados.New: IDRemoteControlModelAtalhosTeclado;
begin
  Result := Self.Create;
end;

function TDRemoteControlModelAtalhosTeclados.PressionarLiberarTecla(
  Tecla: Byte): Boolean;
begin
  keybd_event(Tecla, 0, 0, 0);
  keybd_event(Tecla, 0, KEYEVENTF_KEYUP, 0);
end;

end.
