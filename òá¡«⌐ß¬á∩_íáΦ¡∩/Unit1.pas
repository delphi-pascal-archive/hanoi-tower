unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, Menus, ToolWin,
  ComCtrls, ImgList;

type
  TForm1 = class(TForm)
    Support: TShape;
    Machine: TShape;
    Magnetique: TShape;
    Corde2: TShape;
    Corde1: TShape;
    Mur1: TShape;
    Mur4: TShape;
    Mur2: TShape;
    Mur3: TShape;
    Platforme: TShape;
    DisqueVert: TShape;
    DisqueViolet: TShape;
    DisqueBleu: TShape;
    btnU: TImage;
    btnO: TImage;
    btnL: TImage;
    btnR: TImage;
    btnNM: TImage;
    btnM: TImage;
    btnINIT: TImage;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Timer1: TTimer;
    Shape1: TShape;
    Label5: TLabel;
    Label4: TLabel;
    Shape2: TShape;
    Label3: TLabel;
    Label2: TLabel;
    ToolBar: TToolBar;
    QuitBtn: TToolButton;
    Separator1: TToolButton;
    NewBtn: TToolButton;
    LoadBtn: TToolButton;
    ToolList: TImageList;
    Bevel1: TBevel;
    SaveBtn: TToolButton;
    StatusBar2: TStatusBar;
    StatusBar1: TStatusBar;
    Image1: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Roue2: TShape;
    Roue1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure btnUMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnOMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnOMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnLMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnLMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnRMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnRMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnMClick(Sender: TObject);
    procedure btnNMClick(Sender: TObject);
    procedure btnINITClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure agauche;
    procedure adroite;
    procedure enbas;
    procedure ahaut;
    procedure FormCenter;
    procedure btnUMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Quitter1Click(Sender: TObject);
    procedure APropos2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NewBtnClick(Sender: TObject);
    procedure QuitBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure LoadBtnClick(Sender: TObject);
  private
    { Private declarations }
 check: boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  offlake,Pos1, violet, vert, Bleu: Boolean;
  Collision: Integer;
  DateTime1, DateTime2, DateTime3 : TDateTime;
  str1,str2,str3, Anzeige : string;
  
implementation

uses Unit2;

{$R *.dfm}
{$R cursors.res}

procedure Tform1.FormCenter;
begin
  with form1 do begin
  Left := Screen.Width  div 2 - Width  div 2;
  Top  := Screen.Height div 2 - Height div 2;
end;
end;

function IsCollision(Rec1, Rec2 : Trect):Boolean;
begin
  Result:=  (Rec1.Right > Rec2.Left) and
            (Rec2.Right > Rec1.Left) and
            (Rec1.Bottom > Rec2.Top) and
            (Rec2.Bottom > Rec1.Top);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  check:=true;
     Screen.Cursors[1]:=LoadCursor(Hinstance,'Cur3');
     Screen.Cursors[2]:=LoadCursor(hinstance,'Cur2');
     QuitBtn.Cursor:=2;
     NewBtn.Cursor:=2;
     btnINIT.Cursor:=2;
     btnL.Cursor:=1;
     btnR.Cursor:=1;
     btnO.Cursor:=1;
     btnU.Cursor:=1;

  Form1.DoubleBuffered := True;
  violet:= False;
  vert := False;
  Bleu := False;
  Machine.Left := 200 ;
  Machine.Top:=122 ;
  Roue1.Left :=215 ;
  Roue1.Top :=142;
  Roue2.Left :=255;
  Roue2.Top :=142;
  Corde1.Left :=235;
  Corde1.Top :=152;
  Corde1.Height := 90;
  Corde2.Left :=245;
  Corde2.Top :=152;
  Corde2.Height := 90;
  Magnetique.Left :=215;
  Magnetique.Top := 242 ;
  DisqueViolet.Left := 104;
  DisqueViolet.Top := 567;
  DisqueVert.Left := 88;
  DisqueVert.Top := 584;
  DisqueBleu.Left := 72;
  DisqueBleu.Top := 600;
  Form1.Position := poScreenCenter;
  DateTime1 := Time;  // Actualités enregistrer la date et l'heure

end;

procedure ColSound;             // Le son lors d'une collision !!
begin
  Windows.Beep(500,1000);
    Inc(Collision);
    Form1.Label2.Caption := IntToStr(collision);
end;

//Magnétique vers le bas
procedure TForm1.btnUMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pos1 := False;
end;

procedure TForm1.enbas;
begin
   pos1 := True;
  if Magnetique.Brush.Color  = clYellow then
  repeat
    if Magnetique.Top >= Platforme.Top - Magnetique.Height then Exit;
    if isCollision(Magnetique.BoundsRect,DisqueViolet.BoundsRect) then Exit;
    if isCollision(Magnetique.BoundsRect,DisqueVert.BoundsRect) then Exit;
    if isCollision(Magnetique.BoundsRect,DisqueBleu.BoundsRect) then Exit;
    if pos1 = False then exit;
    application.ProcessMessages;
    Magnetique.Top := Magnetique.Top +1;
    Corde1.Height := Corde1.Height +1;
    Corde2.Height := Corde2.Height +1;
    sleep(10);
  until Magnetique.Top >= Platforme.Top - Magnetique.Height;
    if Magnetique.Brush.Color  = clRed then
  repeat
    if isCollision(DisqueViolet.BoundsRect,Mur1.BoundsRect) then ColSound;
    if isCollision(DisqueViolet.BoundsRect,Mur2.BoundsRect) then ColSound;
    if isCollision(DisqueViolet.BoundsRect,Mur3.BoundsRect)then ColSound;
    if isCollision(DisqueViolet.BoundsRect,Mur4.BoundsRect)then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur1.BoundsRect) then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur2.BoundsRect) then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur3.BoundsRect) then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur4.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur1.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur2.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur3.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur4.BoundsRect) then ColSound;
    if Magnetique.Top >= Platforme.Top - Magnetique.Height then Exit;
    if isCollision(Magnetique.BoundsRect,DisqueViolet.BoundsRect) then violet := True;
    if isCollision(Magnetique.BoundsRect,DisqueVert.BoundsRect) then
    begin
      vert := True;
    end;
    if isCollision(Magnetique.BoundsRect,DisqueBleu.BoundsRect) then Bleu := True;
    if pos1 = False then exit;
    application.ProcessMessages;
    Magnetique.Top := Magnetique.Top +1;
    Corde1.Height := Corde1.Height +1;
    Corde2.Height := Corde2.Height +1;
    If violet = True then DisqueViolet.Top := DisqueViolet.Top +1;
    If vert = True then DisqueVert.Top := DisqueVert.Top +1;
    If Bleu = True then DisqueBleu.Top := DisqueBleu.Top +1;
    sleep(10);
    if violet = True then
      if isCollision(DisqueViolet.BoundsRect, Platforme.BoundsRect )or
      isCollision(DisqueViolet.BoundsRect, DisqueVert.BoundsRect )or
      isCollision(DisqueViolet.BoundsRect, DisqueBleu.BoundsRect )then
      begin
        violet := False;
        exit;
      end;
      if vert = True then
        if isCollision(DisqueVert.BoundsRect, Platforme.BoundsRect )or
          isCollision(DisqueVert.BoundsRect, DisqueViolet.BoundsRect )or
            isCollision(DisqueVert.BoundsRect, DisqueBleu.BoundsRect )then
            begin
              vert := False;
              exit;
            end;
      if Bleu = True then
        if isCollision(DisqueBleu.BoundsRect, Platforme.BoundsRect )or
          isCollision(DisqueBleu.BoundsRect, DisqueViolet.BoundsRect )or
            isCollision(DisqueBleu.BoundsRect, DisqueVert.BoundsRect )then
            begin
              Bleu := False;
              exit;
            end;
  until Magnetique.Top >= Platforme.Top - Magnetique.Height;



end;


procedure TForm1.ahaut;
begin

  pos1 := True;
  if Magnetique.Brush.Color  = clYellow then
  repeat
    if pos1 = False then Exit;
    if Magnetique.Top <= Support.Top + Support.Height then Exit;
    application.ProcessMessages;
    Magnetique.Top := Magnetique.Top -1;
    Corde1.Height := Corde1.Height -1;
    Corde2.Height := Corde2.Height -1;
    sleep(10);
  until Magnetique.Top <= Support.Top + Support.Height;
    if Magnetique.Brush.Color  = clRed then
  repeat
    violet:= False;
    vert:=False;
    Bleu:=False;
    if isCollision(DisqueViolet.BoundsRect,Mur1.BoundsRect) then ColSound;
    if isCollision(DisqueViolet.BoundsRect,Mur2.BoundsRect) then ColSound;
    if isCollision(DisqueViolet.BoundsRect,Mur3.BoundsRect)then ColSound;
    if isCollision(DisqueViolet.BoundsRect,Mur4.BoundsRect)then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur1.BoundsRect) then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur2.BoundsRect) then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur3.BoundsRect) then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur4.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur1.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur2.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur3.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur4.BoundsRect) then ColSound;
    if isCollision(Magnetique.BoundsRect,DisqueViolet.BoundsRect) then violet:=True;
    if isCollision(Magnetique.BoundsRect,DisqueVert.BoundsRect) then vert:=True;
    if isCollision(Magnetique.BoundsRect,DisqueBleu.BoundsRect) then Bleu:=True;
    if pos1 = False then Exit;
    if Magnetique.Top <= Support.Top + Support.Height then Exit;
    application.ProcessMessages;
    Magnetique.Top := Magnetique.Top -1;
    Corde1.Height := Corde1.Height -1;
    Corde2.Height := Corde2.Height -1;
    if violet = True Then DisqueViolet.Top := DisqueViolet.Top -1;
    if vert = True Then DisqueVert.Top := DisqueVert.Top -1;
    if Bleu = True Then DisqueBleu.Top := DisqueBleu.Top -1;
    sleep(10);
   until Magnetique.Top <= Support.Top + Support.Height;

end;

//Magnétiques se déplacent vers le haut
procedure TForm1.btnOMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ahaut;
end;

procedure TForm1.btnOMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pos1 := False;
end;
procedure TForm1.agauche;
begin

  pos1 := True;
  repeat
    if pos1 = False then Exit;
    if isCollision(DisqueViolet.BoundsRect,Mur1.BoundsRect) then ColSound;
    if isCollision(DisqueViolet.BoundsRect,Mur2.BoundsRect) then ColSound;
    if isCollision(DisqueViolet.BoundsRect,Mur3.BoundsRect)then ColSound;
    if isCollision(DisqueViolet.BoundsRect,Mur4.BoundsRect)then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur1.BoundsRect) then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur2.BoundsRect) then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur3.BoundsRect) then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur4.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur1.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur2.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur3.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur4.BoundsRect) then ColSound;
    application.ProcessMessages;
    Machine.Left := Machine.Left -1;
    Roue1.Left := Roue1.Left -1;
    Roue2.Left := Roue2.Left -1;
    Corde1.Left := Corde1.Left -1;
    Corde2.Left := Corde2.Left -1;
    Magnetique.Left := Magnetique.Left -1;
    sleep(10);
    if violet = True then DisqueViolet.Left := DisqueViolet.Left -1;
    if vert = True then DisqueVert.Left := DisqueVert.Left -1;
    if Bleu = True then DisqueBleu.Left := DisqueBleu.Left -1;
  until Machine.Left <= Mur1.Left + Mur1.Width;

end;
//Magnétique vers la gauche
procedure TForm1.btnLMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
agauche;
end;

procedure TForm1.btnLMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pos1:=False;
end;

procedure TForm1.adroite;
begin

   pos1 := True;
  repeat
    if pos1 = False then Exit;
    if Machine.Left + Machine.Width >= Mur4.Left then Exit;
    if isCollision(DisqueViolet.BoundsRect,Mur1.BoundsRect) then ColSound;
    if isCollision(DisqueViolet.BoundsRect,Mur2.BoundsRect) then ColSound;
    if isCollision(DisqueViolet.BoundsRect,Mur3.BoundsRect)then ColSound;
    if isCollision(DisqueViolet.BoundsRect,Mur4.BoundsRect)then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur1.BoundsRect) then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur2.BoundsRect) then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur3.BoundsRect) then ColSound;
    if isCollision(DisqueVert.BoundsRect,Mur4.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur1.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur2.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur3.BoundsRect) then ColSound;
    if isCollision(DisqueBleu.BoundsRect,Mur4.BoundsRect) then ColSound;
    application.ProcessMessages;
    Machine.Left := Machine.Left +1;
    Roue1.Left := Roue1.Left +1;
    Roue2.Left := Roue2.Left +1;
    Corde1.Left := Corde1.Left +1;
    Corde2.Left := Corde2.Left +1;
    Magnetique.Left := Magnetique.Left +1;
    sleep(10);
    if violet = True then DisqueViolet.Left := DisqueViolet.Left +1;
    if vert = True then DisqueVert.Left := DisqueVert.Left +1;
    if Bleu = True then DisqueBleu.Left := DisqueBleu.Left +1;
  until Machine.Left + Machine.Width >= Mur4.Left;

end;

//Magnétique vers la droite
procedure TForm1.btnRMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 adroite;
end;

procedure TForm1.btnRMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pos1 := False;
end;


//Tension magnétique
procedure TForm1.btnMClick(Sender: TObject);
begin
  Magnetique.Brush.Color := clRed;
  btnM.Visible := False;
  btnNM.Visible := True;
end;
//Hors magnétique
procedure TForm1.btnNMClick(Sender: TObject);
begin
  Magnetique.Brush.Color := clYellow;
  violet:= False;
  vert := False;
  Bleu := False;
  btnM.Visible := True;
  btnNM.Visible := False;
end;

//Program redémarrage
procedure TForm1.btnINITClick(Sender: TObject);
begin
  Machine.Left := 200 ;
  Machine.Top:=122 ;
  Roue1.Left :=215 ;
  Roue1.Top :=142;
  Roue2.Left :=255;
  Roue2.Top :=142;
  Corde1.Left :=235;
  Corde1.Top :=152;
  Corde1.Height := 90;
  Corde2.Left :=245;
  Corde2.Top :=152;
  Corde2.Height := 90;
  Magnetique.Left :=215;
  Magnetique.Top := 242 ;
  DisqueViolet.Left := 104;
  DisqueViolet.Top := 567;
  DisqueVert.Left := 88;
  DisqueVert.Top := 584;
  DisqueBleu.Left := 72;
  DisqueBleu.Top := 600;
  Magnetique.Brush.Color := clYellow;
  violet:= False;
  vert := False;
  Bleu := False;
  btnM.Visible := True;
  btnNM.Visible := False;
  Inc(Collision);
  Label2.Caption := IntToStr(Collision);
  DateTime1 := time;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  DateTime2 := Time;  // Actualités enregistrer la date et l'heure
  Datetime3 := DateTime2 - DateTime1;
  str2 := TimeToStr(DateTime3); // Convertir en chaîne moment
  label4.Caption := str2
end;

//*****************************************************************
// Begin DEMO
//*****************************************************************
procedure TForm1.btnUMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
enbas;
end;

procedure TForm1.Quitter1Click(Sender: TObject);
begin
pos1:=false;
close;
end;

procedure TForm1.APropos2Click(Sender: TObject);
begin
form2.showmodal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TForm1.NewBtnClick(Sender: TObject);
begin
   btnINIT.visible := False;
   NewBtn.enabled := false;
   LoadBtn.Enabled:=false;
   QuitBtn.Enabled:=false;
  repeat
                                      // Magnétique vers la gauche
    application.ProcessMessages;
    Machine.Left := Machine.Left -1;
    Roue1.Left := Roue1.Left -1;
    Roue2.Left := Roue2.Left -1;
    Corde1.Left := Corde1.Left -1;
    Corde2.Left := Corde2.Left -1;
    Magnetique.Left := Magnetique.Left -1;
    sleep(10);
  until Magnetique.Left <= DisqueViolet.Left + 7;
    Magnetique.Brush.Color := clRed;      //Tension magnétique
    btnM.Visible := False;
    btnNM.Visible := True;
  repeat
                                      //Magnétique vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     sleep(10);
  until Magnetique.Top >= DisqueViolet.Top - Magnetique.Height +1;
  repeat                              //Disque Violet vers le haut
      application.ProcessMessages;
      Magnetique.Top := Magnetique.Top -1;
      Corde1.Height := Corde1.Height -1;
      Corde2.Height := Corde2.Height -1;
      DisqueViolet.Top := DisqueViolet.Top -1;
      sleep(10);
  until DisqueViolet.Top <= Mur2.Top - DisqueViolet.Height;
  repeat                             //disque Violet a droite
      application.ProcessMessages;
      Machine.Left := Machine.Left +1;
      Roue1.Left := Roue1.Left +1;
      Roue2.Left := Roue2.Left +1;
      Magnetique.Left := Magnetique.Left +1;
      Corde1.Left := Corde1.Left +1;
      Corde2.Left := Corde2.Left +1;
      DisqueViolet.Left := DisqueViolet.Left +1;
      sleep(10);
  until DisqueViolet.Left >= Mur3.Left + Mur3.Width +10;
    repeat                          // DisqueViolet vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     DisqueViolet.Top := DisqueViolet.Top +1;
     sleep(10);
  until DisqueViolet.Top >= Platforme.Top - DisqueViolet.Height;
    Magnetique.Brush.Color := clYellow;  //Hors magnétique
    btnM.Visible := True;
    btnNM.Visible := False;
  repeat                              //Magnétique vers le haut
      application.ProcessMessages;
      Magnetique.Top := Magnetique.Top -1;
      Corde1.Height := Corde1.Height -1;
      Corde2.Height := Corde2.Height -1;
      sleep(10);
  until Magnetique.Top <= Mur2.Top - Magnetique.Height;
    repeat                               // Magnétique vers la gauche
    application.ProcessMessages;
    Machine.Left := Machine.Left -1;
    Roue1.Left := Roue1.Left -1;
    Roue2.Left := Roue2.Left -1;
    Corde1.Left := Corde1.Left -1;
    Corde2.Left := Corde2.Left -1;
    Magnetique.Left := Magnetique.Left -1;
    sleep(10);
  until Magnetique.Left <= DisqueVert.Left + 10;
    Magnetique.Brush.Color := clRed;      // Tension magnétique
    btnM.Visible := False;
    btnNM.Visible := True;
  repeat                              // Magnétique vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     sleep(10);
  until Magnetique.Top >= DisqueVert.Top - Magnetique.Height +1;
    repeat                              // Disque Vert vers le haut
      application.ProcessMessages;
      Magnetique.Top := Magnetique.Top -1;
      Corde1.Height := Corde1.Height -1;
      Corde2.Height := Corde2.Height -1;
      DisqueVert.Top := DisqueVert.Top -1;
      sleep(10);
  until DisqueVert.Top <= Mur2.Top - DisqueViolet.Height;
  repeat                             // Disque Vert à droite
      application.ProcessMessages;
      Machine.Left := Machine.Left +1;
      Roue1.Left := Roue1.Left +1;
      Roue2.Left := Roue2.Left +1;
      Magnetique.Left := Magnetique.Left +1;
      Corde1.Left := Corde1.Left +1;
      Corde2.Left := Corde2.Left +1;
      DisqueVert.Left := DisqueVert.Left +1;
      sleep(10);
  until DisqueVert.Left >= Mur2.Left + Mur2.Width + 10;
    repeat                          // Disque Vert vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     DisqueVert.Top := DisqueVert.Top +1;
     sleep(10);
  until DisqueVert.Top >= Platforme.Top - DisqueVert.Height;
    Magnetique.Brush.Color := clYellow;  // Hors magnétique
    btnM.Visible := True;
    btnNM.Visible := False;
  repeat                                 // Magnétique vers le haut
    application.ProcessMessages;
    Magnetique.Top := Magnetique.Top -1;
    Corde1.Height := Corde1.Height -1;
    Corde2.Height := Corde2.Height -1;
    sleep(10);
  until Magnetique.Top <= Mur2.Top - Magnetique.Height;
 repeat                                 // Magnetique a droite
      application.ProcessMessages;
      Machine.Left := Machine.Left +1;
      Roue1.Left := Roue1.Left +1;
      Roue2.Left := Roue2.Left +1;
      Magnetique.Left := Magnetique.Left +1;
      Corde1.Left := Corde1.Left +1;
      Corde2.Left := Corde2.Left +1;
      sleep(10);
  until Magnetique.Left >= DisqueViolet.Left + +10;
      Magnetique.Brush.Color := clRed;      // Tension magnétique
      btnM.Visible := False;
      btnNM.Visible := True;
   repeat                                   // Magnétique vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     sleep(10);
  until Magnetique.Top >= DisqueViolet.Top - Magnetique.Height +1;
    repeat                                  //DisqueViolet vers le bas
      application.ProcessMessages;
      Magnetique.Top := Magnetique.Top -1;
      Corde1.Height := Corde1.Height -1;
      Corde2.Height := Corde2.Height -1;
      DisqueViolet.Top := DisqueViolet.Top -1;
      sleep(10);
  until DisqueViolet.Top <= Mur3.Top - DisqueViolet.Height;
  repeat                               // DisqueViolet à gauche
    application.ProcessMessages;
    Machine.Left := Machine.Left -1;
    Roue1.Left := Roue1.Left -1;
    Roue2.Left := Roue2.Left -1;
    Corde1.Left := Corde1.Left -1;
    Corde2.Left := Corde2.Left -1;
    Magnetique.Left := Magnetique.Left -1;
    DisqueViolet.Left := DisqueViolet.Left -1;
    sleep(10);
  until DisqueViolet.Left <= DisqueVert.Left + 7;
  repeat                                // DisqueViolet vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     DisqueViolet.Top := DisqueViolet.Top +1;
     sleep(10);
  until DisqueViolet.Top >= DisqueVert.Top - DisqueViolet.Height;
    Magnetique.Brush.Color := clYellow;  // Hors magnétique
    btnM.Visible := True;
    btnNM.Visible := False;
  repeat                                 // Magnétique vers le haut
    application.ProcessMessages;
    Magnetique.Top := Magnetique.Top -1;
    Corde1.Height := Corde1.Height -1;
    Corde2.Height := Corde2.Height -1;
    sleep(10);
  until Magnetique.Top <= Mur2.Top - Magnetique.Height;
    repeat                               // Magnétique vers la gauche
    application.ProcessMessages;
    Machine.Left := Machine.Left -1;
    Roue1.Left := Roue1.Left -1;
    Roue2.Left := Roue2.Left -1;
    Corde1.Left := Corde1.Left -1;
    Corde2.Left := Corde2.Left -1;
    Magnetique.Left := Magnetique.Left -1;
    sleep(10);
  until Magnetique.Left <= DisqueBleu.Left + 10;
    Magnetique.Brush.Color := clRed;      // Tension magnétique
    btnM.Visible := False;
    btnNM.Visible := True;

  repeat                                  // Magnétique vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     sleep(10);
  until Magnetique.Top >= DisqueBleu.Top - Magnetique.Height +1;
    repeat                                // Disque bleu vers le haut
      application.ProcessMessages;
      Magnetique.Top := Magnetique.Top -1;
      Corde1.Height := Corde1.Height -1;
      Corde2.Height := Corde2.Height -1;
      DisqueBleu.Top := DisqueBleu.Top -1;
      sleep(10);
  until DisqueBleu.Top <= Mur2.Top - DisqueBleu.Height;
  repeat                             // Disque bleu à droite
      application.ProcessMessages;
      Machine.Left := Machine.Left +1;
      Roue1.Left := Roue1.Left +1;
      Roue2.Left := Roue2.Left +1;
      Magnetique.Left := Magnetique.Left +1;
      Corde1.Left := Corde1.Left +1;
      Corde2.Left := Corde2.Left +1;
      DisqueBleu.Left := DisqueBleu.Left +1;
      sleep(10);
  until DisqueBleu.Left >= Mur3.Left + Mur3.Width + 15;
    repeat                          // Disque bleu vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     DisqueBleu.Top := DisqueBleu.Top +1;
     sleep(10);
  until DisqueBleu.Top >= Platforme.Top - DisqueBleu.Height;
    Magnetique.Brush.Color := clYellow;  // Hors magnétique
    btnM.Visible := True;
    btnNM.Visible := False;

 repeat                                  // Magnétique vers le haut
      application.ProcessMessages;
      Magnetique.Top := Magnetique.Top -1;
      Corde1.Height := Corde1.Height -1;
      Corde2.Height := Corde2.Height -1;
      sleep(10);
  until Magnetique.Top <= Mur2.Top - Magnetique.Height;
  repeat                                 // Magnétique vers la gauche
    application.ProcessMessages;
    Machine.Left := Machine.Left -1;
    Roue1.Left := Roue1.Left -1;
    Roue2.Left := Roue2.Left -1;
    Corde1.Left := Corde1.Left -1;
    Corde2.Left := Corde2.Left -1;
    Magnetique.Left := Magnetique.Left -1;
    sleep(10);
  until Magnetique.Left <= DisqueViolet.Left + 10;
    Magnetique.Brush.Color := clRed;      // Tension magnétique
    btnM.Visible := False;
    btnNM.Visible := True;
 repeat                              // Magnétique vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     sleep(10);
  until Magnetique.Top >= DisqueViolet.Top - Magnetique.Height +1;
    repeat                              // DisqueViolet vers le haut
      application.ProcessMessages;
      Magnetique.Top := Magnetique.Top -1;
      Corde1.Height := Corde1.Height -1;
      Corde2.Height := Corde2.Height -1;
      DisqueViolet.Top := DisqueViolet.Top -1;
      sleep(10);
    until DisqueViolet.Top <= Mur2.Top - DisqueViolet.Height;
  repeat                               // DisqueViolet à gauche
    application.ProcessMessages;
    Machine.Left := Machine.Left -1;
    Roue1.Left := Roue1.Left -1;
    Roue2.Left := Roue2.Left -1;
    Corde1.Left := Corde1.Left -1;
    Corde2.Left := Corde2.Left -1;
    Magnetique.Left := Magnetique.Left -1;
    DisqueViolet.Left := DisqueViolet.Left -1;
    sleep(10);
  until DisqueViolet.Left <= Mur2.Left - DisqueViolet.Width - 7;
  repeat                          // DisqueViolet vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     DisqueViolet.Top := DisqueViolet.Top +1;
     sleep(10);
  until DisqueViolet.Top >= Platforme.Top - DisqueViolet.Height;
    Magnetique.Brush.Color := clYellow;  // Hors magnétique
    btnM.Visible := True;
    btnNM.Visible := False;
  repeat                              // Magnétique vers le haut
    application.ProcessMessages;
    Magnetique.Top := Magnetique.Top -1;
    Corde1.Height := Corde1.Height -1;
    Corde2.Height := Corde2.Height -1;
    sleep(10);
  until Magnetique.Top <= Mur2.Top - Magnetique.Height;
 repeat                             // Magnetique a droite
      application.ProcessMessages;
      Machine.Left := Machine.Left +1;
      Roue1.Left := Roue1.Left +1;
      Roue2.Left := Roue2.Left +1;
      Magnetique.Left := Magnetique.Left +1;
      Corde1.Left := Corde1.Left +1;
      Corde2.Left := Corde2.Left +1;
      sleep(10);
  until Magnetique.Left >= DisqueVert.Left  +10;
      Magnetique.Brush.Color := clRed;      // Tension magnétique
      btnM.Visible := False;
      btnNM.Visible := True;
   repeat                              // Magnétique vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     sleep(10);
  until Magnetique.Top >= DisqueVert.Top - Magnetique.Height +1;
  repeat                              // disque Vert vers le haut
      application.ProcessMessages;
      Magnetique.Top := Magnetique.Top -1;
      Corde1.Height := Corde1.Height -1;
      Corde2.Height := Corde2.Height -1;
      DisqueVert.Top := DisqueVert.Top -1;
      sleep(10);
  until DisqueVert.Top <= Mur2.Top - DisqueVert.Height;
  repeat                             // Disque vert à droite
      application.ProcessMessages;
      Machine.Left := Machine.Left +1;
      Roue1.Left := Roue1.Left +1;
      Roue2.Left := Roue2.Left +1;
      Magnetique.Left := Magnetique.Left +1;
      Corde1.Left := Corde1.Left +1;
      Corde2.Left := Corde2.Left +1;
      DisqueVert.Left := DisqueVert.Left + 1;
      sleep(10);
  until DisqueVert.Left >= Mur3.Left + Mur3.Width + 28;
    repeat                          // Disque vert vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     DisqueVert.Top := DisqueVert.Top +1;
     sleep(10);
  until DisqueVert.Top >= DisqueBleu.Top - DisqueVert.Height;
    Magnetique.Brush.Color := clYellow;  // Hors magnétique
    btnM.Visible := True;
    btnNM.Visible := False;
 repeat                              // Magnétique vers le haut
      application.ProcessMessages;
      Magnetique.Top := Magnetique.Top -1;
      Corde1.Height := Corde1.Height -1;
      Corde2.Height := Corde2.Height -1;
      sleep(10);
  until Magnetique.Top <= Mur2.Top - Magnetique.Height;
  repeat                               // Magnétique vers la gauche
    application.ProcessMessages;
    Machine.Left := Machine.Left -1;
    Roue1.Left := Roue1.Left -1;
    Roue2.Left := Roue2.Left -1;
    Corde1.Left := Corde1.Left -1;
    Corde2.Left := Corde2.Left -1;
    Magnetique.Left := Magnetique.Left -1;
    sleep(10);
  until Magnetique.Left <= DisqueViolet.Left + 10;
    Magnetique.Brush.Color := clRed;      // Tension magnétique
    btnM.Visible := False;
    btnNM.Visible := True;
 repeat                              // Magnétique vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     sleep(10);
  until Magnetique.Top >= DisqueViolet.Top - Magnetique.Height +1;
    repeat                              // vers le haut
      application.ProcessMessages;
      Magnetique.Top := Magnetique.Top -1;
      Corde1.Height := Corde1.Height -1;
      Corde2.Height := Corde2.Height -1;
      DisqueViolet.Top := DisqueViolet.Top -1;
      sleep(10);
    until DisqueViolet.Top <= Mur2.Top - DisqueViolet.Height;

  repeat                             // Disque Violet a droite
      application.ProcessMessages;
      Machine.Left := Machine.Left +1;
      Roue1.Left := Roue1.Left +1;
      Roue2.Left := Roue2.Left +1;
      Magnetique.Left := Magnetique.Left +1;
      Corde1.Left := Corde1.Left +1;
      Corde2.Left := Corde2.Left +1;
      DisqueViolet.Left := DisqueViolet.Left +1;
      sleep(10);
  until DisqueViolet.Left >= Mur3.Left + Mur3.Width + 40;
    repeat                          // Disque Violet vers le bas
     application.ProcessMessages;
     Magnetique.Top := Magnetique.Top +1;
     Corde1.Height := Corde1.Height +1;
     Corde2.Height := Corde2.Height +1;
     DisqueViolet.Top := DisqueViolet.Top +1;
     sleep(10);
  until DisqueViolet.Top >= DisqueVert.Top - DisqueViolet.Height;
    Magnetique.Brush.Color := clYellow;  //Hors magnétique
    btnM.Visible := True;
    btnNM.Visible := False;
    Anzeige := 'Vous avez réussi à ' + Label4.Caption ;
    MessageDlg(Anzeige,mtInformation,[mbOK],0);
    btnINIT.visible := true;
    NewBtn.enabled := true;
    LoadBtn.Enabled:=true;
    QuitBtn.Enabled:=true;
end;

procedure TForm1.QuitBtnClick(Sender: TObject);
begin
pos1:=false;
close;
application.terminate;
end;

procedure TForm1.SaveBtnClick(Sender: TObject);
begin
  with Form2 do begin
  Form2 := TForm2.Create(Application);
  FormCenter;
  AnimateWindow(Handle, 360, AW_BLEND);
  Show;
end;
end;

procedure TForm1.LoadBtnClick(Sender: TObject);
begin
  Machine.Left := 200 ;
  Machine.Top:=122 ;
  Roue1.Left :=215 ;
  Roue1.Top :=142;
  Roue2.Left :=255;
  Roue2.Top :=142;
  Corde1.Left :=235;
  Corde1.Top :=152;
  Corde1.Height := 90;
  Corde2.Left :=245;
  Corde2.Top :=152;
  Corde2.Height := 90;
  Magnetique.Left :=215;
  Magnetique.Top := 242 ;
  DisqueViolet.Left := 104;
  DisqueViolet.Top := 567;
  DisqueVert.Left := 88;
  DisqueVert.Top := 584;
  DisqueBleu.Left := 72;
  DisqueBleu.Top := 600;
  Magnetique.Brush.Color := clYellow;
  violet:= False;
  vert := False;
  Bleu := False;
  btnM.Visible := True;
  btnNM.Visible := False;
  Inc(Collision);
  Label2.Caption := IntToStr(Collision);
  DateTime1 := time;
end;

end.
