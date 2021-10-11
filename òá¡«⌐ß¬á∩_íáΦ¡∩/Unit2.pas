unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, OleCtrls, SHDocVw, StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    WebBrowser1: TWebBrowser;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    Timer1: TTimer;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;
  
const TT_SPACE     = 5 ;
      Banniere     = 'Sami Oubbati';
var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+'offlake.gif');
 Randomize;
  with image1.Picture.Bitmap.Create do
  begin
    PixelFormat:=pf4bit;
    Width:=image1.Width;
    Height:=image1.Height;
    //LE DESSIN
    Canvas.Pen.Style:=psClear;
    Canvas.Brush.Color:=clWhite;
    //EFFACEMENT DE L'ARRIERE-PLAN
    Canvas.Brush.Style:=bsSolid;
    Canvas.Rectangle(-1,-1,image1.Width+1,image1.Height+1);
    //LA FONTE
    Canvas.Font.Name:='Times New Roman';
    Canvas.Font.Style:=[fsBold];
    Canvas.Font.Size:=28;
  end;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
AnimateWindow(Handle, 360, AW_BLEND or AW_HIDE);
  Close;

end;

procedure TForm2.Timer1Timer(Sender: TObject);
var i, x    : Integer;
  PX, PY  : Integer;
begin
  //EFFACEMENT DE L'ARRIERE-PLAN
  image1.Picture.Bitmap.Canvas.Brush.Style:=bsSolid;
  image1.Picture.Bitmap.Canvas.Rectangle(-1,-1,image1.Width+1,image1.Height+1);
  //DESSIN DES CARACTERES
  x:=0;
  for i:=1 to Length(Banniere) do
  begin
    PX:=random(10)+1+x;
    PY:=random(10)+1;
    image1.Picture.Bitmap.Canvas.Brush.Style:=bsClear;
    image1.Picture.Bitmap.Canvas.TextOut(PX,PY,Banniere[i]);
    x:=x+image1.Picture.Bitmap.Canvas.TextWidth(Banniere[i])+TT_SPACE;
  end;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
AnimateWindow(Handle, 250, Aw_BLEND);
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
AnimateWindow(Handle, 360, AW_BLEND or AW_HIDE);
end;

end.
