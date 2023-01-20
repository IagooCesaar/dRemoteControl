unit DRemoteControl.Model.Interfaces;

interface

uses
  System.Classes;


type
  IDRemoteControlModelAtalhosTeclado = interface
    ['{D6E85B25-4CA2-4BA7-9B94-1384F422A108}']
    function MediaPlayPause: Boolean;
    function MediaNextTrack: Boolean;
    function MediaPreviousTrack: Boolean;
  end;

implementation

end.
