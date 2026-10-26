unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
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
  InputValue, ResultValue: Double;
begin
  if RadioGroup1.ItemIndex = 0 then
  begin

    InputValue := StrToFloat(Edit1.Text);
    ResultValue := InputValue * 1.6;
    Edit2.Text := FormatFloat('0.0', ResultValue);
  end
  else
  begin

    InputValue := StrToFloat(Edit2.Text);
    ResultValue := InputValue / 1.6;
    Edit1.Text := FormatFloat('0.0', ResultValue);
  end;
end;

end.

