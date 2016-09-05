unit Photo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TFPhoto = class(TForm)
    Panel_Photo: TPanel;
    Image_Photo: TImage;
    procedure Image_PhotoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPhoto: TFPhoto;

implementation

{$R *.dfm}

procedure TFPhoto.FormCreate(Sender: TObject);
var
  CatJPG: TJPEGImage;
  JPGStream: TResourceStream;
begin
  CatJPG:= TJpegImage.Create;
  JPGStream:= TResourceStream.Create(hInstance, 'badcat', RT_RCDATA);
  CatJPG.LoadfromStream(JPGStream);
  Image_Photo.Picture.Bitmap.Assign(CatJPG);
end;

procedure TFPhoto.Image_PhotoClick(Sender: TObject);
begin
  Close;
end;

end.
