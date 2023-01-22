program dRemoteControlDesktop;

uses
  Vcl.Forms,
  ufrmPrinc in 'src\ufrmPrinc.pas' {frmPrinc};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.Run;
end.
