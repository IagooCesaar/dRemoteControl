unit ufrmPrinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmPrinc = class(TForm)
    pcPrinc: TPageControl;
    tsMedia: TTabSheet;
    tsConfig: TTabSheet;
    btnMediaPlayPause: TButton;
    lbHost: TLabel;
    edtHost: TEdit;
    Label1: TLabel;
    edtPort: TEdit;
    btnMediaStop: TButton;
    btnMediaNextTrack: TButton;
    btnMediaPrevTrack: TButton;
    btnMediaVolumeUp: TButton;
    btnMediaVolumeDown: TButton;
    btnMediaVolumeMute: TButton;
    sbarPrinc: TStatusBar;
    procedure btnMediaPlayPauseClick(Sender: TObject);
  private
    { Private declarations }
    function GetURI: String;
    function GetResource: string;
  public
    { Public declarations }
  end;

var
  frmPrinc: TfrmPrinc;

implementation

uses RESTRequest4D;

{$R *.dfm}

{ TForm1 }

procedure TfrmPrinc.btnMediaPlayPauseClick(Sender: TObject);
var LResponse: IResponse; LRoute: string;
  function GetRoute: string;
  begin
    case TButton(Sender).Tag of
      0: Result := '/play-pause';
      1: Result := '/stop';
      2: Result := '/next-track';
      3: Result := '/previous-track';
      4: Result := '/volume-up';
      5: Result := '/volume-down';
      6: Result := '/volume-mute';
    end;
    Result :=  GetURI + GetResource + Result;
  end;
begin
  LRoute := GetRoute;
  sbarPrinc.Panels[0].Text := 'Route: '+LRoute;
  sbarPrinc.Panels[1].Text := 'Method: POST';

  LResponse := TRequest.New.BaseURL(LRoute)
    .Post;

  sbarPrinc.Panels[2].Text := 'Status: '+LResponse.StatusCode.ToString;

end;

function TfrmPrinc.GetResource: string;
begin
  case pcPrinc.ActivePageIndex of
    1: Result := '/media-control'
  else
    Result := '';
  end;
end;

function TfrmPrinc.GetURI: String;
begin
  Result := Format('http://%s:%s/remote-control/api',
    [edtHost.Text, edtPort.Text]);
end;

end.
