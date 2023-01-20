program dRemoteControlAPI;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  App in 'src\App.pas',
  DRemoteControl.Controller.Registry in 'src\controllers\DRemoteControl.Controller.Registry.pas';

begin
  try
    App.Start;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
