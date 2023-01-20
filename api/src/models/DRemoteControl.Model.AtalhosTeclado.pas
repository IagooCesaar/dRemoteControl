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


    function MediaPlayPause: Boolean;
    function MediaNextTrack: Boolean;
    function MediaPreviousTrack: Boolean;

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

function TDRemoteControlModelAtalhosTeclados.MediaNextTrack: Boolean;
begin
  Self.PressionarLiberarTecla(VK_MEDIA_NEXT_TRACK);
end;

function TDRemoteControlModelAtalhosTeclados.MediaPlayPause: Boolean;
begin
  Self.PressionarLiberarTecla(VK_MEDIA_PLAY_PAUSE);
end;

function TDRemoteControlModelAtalhosTeclados.MediaPreviousTrack: Boolean;
begin
  Self.PressionarLiberarTecla(VK_MEDIA_PREV_TRACK);
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
