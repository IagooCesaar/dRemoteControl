unit DRemoteControl.Model.Interfaces;

interface

uses
  System.Classes;


type
  IDRemoteControlModelAtalhosTeclado = interface
    ['{D6E85B25-4CA2-4BA7-9B94-1384F422A108}']
    function MediaPressionarPlayPause: Boolean;
    function MediaPressionarStop: Boolean;
    function MediaPressionarNextTrack: Boolean;
    function MediaPressionarPreviousTrack: Boolean;
    function MediaPressionarAumentarVolume: Boolean;
    function MediaPressionarDiminuirVolume: Boolean;
    function MediaPressionarMutarVolume: Boolean;
  end;

implementation

end.
