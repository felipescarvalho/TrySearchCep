unit Controller.Manager.Cep.Impl;

interface

type
  TSearchManagerCep = class
  public
    class function RequestAPI(const aCEP: string ): string;
  end;

implementation

uses
  SysUtils,
  CircuitBreaker.Impl;

{ TSearchManagerCep }

class function TSearchManagerCep.RequestAPI(const ACEP: string ): string;
begin
  var lClassDeafaultApiList := TClassDeafaultApiList.Create(ACEP);
  try
    for var lItemConumerApi in lClassDeafaultApiList.ListClassApi do
    begin
      if lItemConumerApi.CanAttempt then
      begin
        var lError: string := '';
        Result := lItemConumerApi.Request(lError);
        if (lError.IsEmpty) and (Result <> EmptyStr) then
        begin
          lItemConumerApi.RecordSuccess;
          Exit;
        end
        else
          lItemConumerApi.RecordFailure;
      end;
    end;
    if Result.IsEmpty then
      Result := 'Not found';

  finally
    lClassDeafaultApiList.Free;
  end;
end;

end.
