program PrjTrySearchCep;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  Horse,
  Builder.Impl in '..\src\Implementation\Builder.Impl.pas',
  Registers.API.Impl in '..\src\Implementation\Api\Registers.API.Impl.pas',
  Controller.Manager.Cep.Impl in '..\src\Implementation\Controller\Controller.Manager.Cep.Impl.pas',
  CircuitBreaker.Impl in '..\src\Implementation\CircuitBreaker.Impl.pas';

procedure Ping(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
  begin
    Res.Send('Pong');
  end;

begin
  try
    THorse.Get('/ping', ping);

    TBuilder.StartEngine;

    WriteLn('Servidor rodando em http://localhost:9000');
    WriteLn('Pressione Enter para encerrar o servidor...');
    THorse.Listen(9000);

    ReportMemoryLeaksOnShutdown := true;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.


