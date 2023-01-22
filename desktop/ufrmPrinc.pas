unit ufrmPrinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnVolumeUp: TButton;
    btnMediaPause: TButton;
    procedure btnVolumeUpClick(Sender: TObject);
    procedure btnMediaPauseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnMediaPauseClick(Sender: TObject);
begin
  keybd_event(VK_MEDIA_PLAY_PAUSE, 0, 0, 0);
  keybd_event(VK_MEDIA_PLAY_PAUSE, 0, KEYEVENTF_KEYUP, 0);
end;

procedure TForm1.btnVolumeUpClick(Sender: TObject);
begin
  keybd_event(VK_VOLUME_UP, 0, 0, 0);
  keybd_event(VK_VOLUME_UP, 0, KEYEVENTF_KEYUP, 0);
end;

end.
