# lazarus
CODICE: unit Unit1;

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
var giorno, euro, totale: integer;
begin
  Randomize;
  Memo1.Clear;
  totale := 0;
  // QUI il ciclo FOR: giorno da 1 a 7
  for giorno := 1 to 7 do
  begin
    // QUI euro a caso da 1 a 5
    euro := Random(5) + 1;
    // QUI aggiungi euro al totale
    totale := totale + euro;
    // QUI scrivi nel Memo: Giorno 1: +3 euro
    Memo1.Lines.Add('Giorno ' + IntToStr(giorno) + ': +' + IntToStr(euro) + ' euro');
  end;
  // QUI, dopo il ciclo, scrivi il totale della settimana
  Memo1.Lines.Add('Totale settimana: ' + IntToStr(totale) + ' euro');
end;

procedure TForm1.Button2Click(Sender: TObject);
var giorni, euro, totale, prezzo: integer;
begin
  Randomize;
  prezzo := StrToInt(Edit2.Text);
  Memo1.Clear;
  totale := 0;
  giorni := 0;
  // QUI il ciclo WHILE: finché il totale è minore del prezzo
  while (totale < prezzo) do
  begin
    // QUI euro a caso da 1 a 5
    euro := Random(5) + 1;
    // QUI aggiungi euro al totale
    totale := totale + euro;
    // QUI conta un giorno in più
    giorni := giorni + 1;
  end;
  // QUI, dopo il ciclo, scrivi quanti giorni servono
  Memo1.Lines.Add('Servono ' + IntToStr(giorni) + ' giorni per raggiungere ' + IntToStr(prezzo) + ' euro.');
  Memo1.Lines.Add('Cioè ' + IntToStr(giorni div 7) + ' settimane e ' + IntToStr(giorni mod 7) + ' giorni');
end;

procedure TForm1.Button3Click(Sender: TObject);
var giorni, euro, totale, prezzo: integer;
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

    // Se giorni si incrementa e si arriva al 6° giorno (sabato)
    if (giorni mod 7 = 6) then
    begin
      totale := totale + 10;
      Memo1.Lines.Add('Sabato: paghetta +10 euro!');
    end;
  end;

  Memo1.Lines.Add('Servono ' + IntToStr(giorni) + ' giorni.');
  Memo1.Lines.Add('Cioè ' + IntToStr(giorni div 7) + ' settimane e ' + IntToStr(giorni mod 7) + ' giorni');
end;

end.
