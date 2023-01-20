unit DRemoteControl.Controller.Registry;

interface

procedure Registry(AContext: string);

implementation

uses
  DRemoteControl.Controller.MediaControl;

procedure Registry(AContext: string);
begin
  AContext := AContext + '/api';
  DRemoteControl.Controller.MediaControl.Registry(AContext);
end;

end.
