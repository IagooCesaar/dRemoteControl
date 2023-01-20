program dRemoteControlAPI;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  App in 'src\App.pas',
  DRemoteControl.Controller.MediaControl in 'src\controllers\DRemoteControl.Controller.MediaControl.pas',
  DRemoteControl.Controller.Registry in 'src\controllers\DRemoteControl.Controller.Registry.pas',
  DRemoteControl.Model.Interfaces in 'src\models\DRemoteControl.Model.Interfaces.pas',
  DRemoteControl.Model.AtalhosTeclado in 'src\models\DRemoteControl.Model.AtalhosTeclado.pas';

begin
  try
    App.Start;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
