unit untSearchCep;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    pnlMain: TPanel;
    edtCep: TLabeledEdit;
    edtLogradouro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtBairro: TLabeledEdit;
    btnConsultaCep: TButton;
    procedure btnConsultaCepClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function Request(const aCep: string): string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  JSON,
  System.Net.HttpClient,
  Endereco.JSON.Desserializador.Impl;

{$R *.dfm}

procedure TForm1.btnConsultaCepClick(Sender: TObject);
begin
  var lEndereco := TEndereco.Desserializar(Request(edtCep.Text));
  try
    edtLogradouro.Text := lEndereco.Logradouro;
    edtBairro.Text := lEndereco.Bairro;
    edtCidade.Text := lEndereco.Estado;
  finally
    lEndereco.Free;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

function TForm1.Request(const aCep: string): string;
begin
  var lHttpClient:= THTTPClient.Create;
  try
    var lResponse:= lHttpClient.Get('http://localhost:9000/searchcep/'+aCep);
    try
      if lResponse.StatusCode = 200 then
        Result := lResponse.ContentAsString(TEncoding.UTF8)
     else
     case lResponse.StatusCode of
        400: Result := lResponse.StatusText; {implementar retorno}
        404: Result := lResponse.StatusText;{implementar retorno}
     end;
    except
      on e: Exception do
        raise Exception.Create(lResponse.StatusText + ' ' + e.Message);
    end;
  finally
    lHttpClient.Free;
  end;

end;

end.
