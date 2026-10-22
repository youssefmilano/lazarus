unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  giorno, euro, totale: integer;
begin
  Randomize;
  Memo1.Clear;
  totale := 0;

  for giorno := 1 to 7 do
  begin
    euro := Random(5) + 1;
    totale := totale + euro;
    Memo1.Lines.Add('Giorno ' + IntToStr(giorno) + ': +' + IntToStr(euro) + ' euro');
  end;

  Memo1.Lines.Add('Totale settimana: ' + IntToStr(totale) + ' euro');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  giorni, euro, totale, prezzo: integer;
begin
  Randomize;
  prezzo := StrToInt(Edit2.Text);
  Memo1.Clear;
  totale := 0;
  giorni := 0;

  while (totale < prezzo) do
  begin
    euro := Random(5) + 1;
    totale := totale + euro;
    giorni := giorni + 1;
  end;

  Memo1.Lines.Add('Servono ' + IntToStr(giorni) + ' giorni per raggiungere ' + IntToStr(prezzo) + ' euro.');
  Memo1.Lines.Add('Cioè ' + IntToStr(giorni div 7) + ' settimane e ' + IntToStr(giorni mod 7) + ' giorni');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  giorni, euro, totale, prezzo: integer;
begin
  Randomize;
  prezzo := StrToInt(Edit2.Text);
  Memo1.Clear;
  totale := 0;
  giorni := 0;

  while (totale < prezzo) do
  begin
    giorni := giorni + 1;
    euro := Random(5) + 1;
    totale := totale + euro;

    if (giorni mod 7 = 6) then
    begin
      totale := totale + 10;
      Memo1.Lines.Add('Giorno ' + IntToStr(giorni) + ' (Sabato): paghetta +10 euro! Totale parziale: ' + IntToStr(totale) + ' euro');
    end;
  end;

  Memo1.Lines.Add('Totale raggiunto: ' + IntToStr(totale) + ' euro in ' + IntToStr(giorni) + ' giorni.');
  Memo1.Lines.Add('Cioè ' + IntToStr(giorni div 7) + ' settimane e ' + IntToStr(giorni mod 7) + ' giorni');
end;

end.
