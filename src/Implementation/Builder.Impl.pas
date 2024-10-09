{Class owned by all implementations and resources}
unit Builder.Impl;

interface

type
  TBuilder = class
  private
  strict protected
    class procedure RegistersEndPoints;
  public
    class procedure StartEngine;
  end;

implementation

uses
  Registers.API.Impl;

{ TBuilder }

class procedure TBuilder.RegistersEndPoints;
begin
  TRegisterApi.RegistersEndPoints;
end;

class procedure TBuilder.StartEngine;
begin
  RegistersEndPoints;
end;

end.
