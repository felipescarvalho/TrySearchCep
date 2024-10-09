program prjExample;

uses
  Vcl.Forms,
  untSearchCep in 'untSearchCep.pas' {Form1},
  Endereco.JSON.Desserializador.Impl in 'Endereco.JSON.Desserializador.Impl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
