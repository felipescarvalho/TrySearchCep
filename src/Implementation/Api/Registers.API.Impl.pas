unit Registers.API.Impl;

interface

type
  TRegisterApi = class
  strict private
    class procedure RegistersApiCep;
  strict protected
    class procedure DoRegistersEndPoints;
  public
    class procedure RegistersEndPoints;
  end;

implementation

uses
  Horse,
  Controller.Manager.Cep.Impl;

{ TRegisterApi }

class procedure TRegisterApi.DoRegistersEndPoints;
begin
  RegistersApiCep;
end;

class procedure TRegisterApi.RegistersApiCep;
begin
  THorse.Get('/searchcep/:cep',
    procedure (Req: THorseRequest; Res: THorseResponse; Next: TNextProc)
    begin
      var lResponse:= TSearchManagerCep.RequestApi(Req.Params.Items['cep']);
      Res.Send(lResponse);
    end);
end;

class procedure TRegisterApi.RegistersEndPoints;
begin
  DoRegistersEndPoints;
end;

end.
