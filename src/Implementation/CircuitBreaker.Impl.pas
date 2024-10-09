unit CircuitBreaker.Impl;

interface

uses
  Generics.Collections;

type
  TClassDefaultApi = class
  private
    FURL: string;
    FMaxFailures: Integer;
    FFailures: Integer;
    FLastFailureTime: TDateTime;
    FTimeout: TDateTime;
  public
    constructor Create(const aBaseURL: string);
    function Request(out aError: string): string;
    function CanAttempt: Boolean;
    procedure RecordFailure;
    procedure RecordSuccess;
  end;

  TClassDeafaultApiList = class
  private
    FListClassApi: TList<TClassDefaultApi>;
  public
    property ListClassApi: TList<TClassDefaultApi> read FListClassApi write FListClassApi;
    constructor Create(const aCEP: string);
    destructor Destroy; override;
  end;

implementation

uses
  System.Classes,
  System.SysUtils,
  System.Net.HttpClient,
  System.Net.URLClient;

{ TClassDeafaultApiList }

constructor TClassDeafaultApiList.Create(const aCEP: string);
begin
  FListClassApi := TList<TClassDefaultApi>.create;

  FListClassApi.Add(TClassDefaultApi.Create('https://viacep.com.br/ws/' + aCEP + '/json/'));
  FListClassApi.Add(TClassDefaultApi.Create('https://cep.awesomeapi.com.br/json/' + aCEP));
  FListClassApi.Add(TClassDefaultApi.Create('https://cdn.apicep.com/file/apicep/' + aCEP + '.json'));
end;

destructor TClassDeafaultApiList.Destroy;
begin
  FListClassApi.Free;
  inherited;
end;

{ TClassDefaultApi }

function TClassDefaultApi.CanAttempt: Boolean;
begin
  if FFailures >= FMaxFailures then
    Result := Now > FLastFailureTime + FTimeout
  else
    Result := True;
end;

constructor TClassDefaultApi.Create(const aBaseURL: string);
begin
  FURL := aBaseURL;
  FMaxFailures := 1;
  FTimeout := 6000;
  FFailures := 0;
end;

procedure TClassDefaultApi.RecordFailure;
begin
  Inc(FFailures);
  FLastFailureTime := Now;
end;

procedure TClassDefaultApi.RecordSuccess;
begin
  FFailures := 0;
end;

function TClassDefaultApi.Request(out aError: string): string;
begin
  var lJSON: string := '';
  var lError: string;
  var lHttpClient:= THTTPClient.Create;
  try
    var lResponse:= lHttpClient.Get(FURL);
    try
      if lResponse.StatusCode = 200 then
        lJSON := lResponse.ContentAsString(TEncoding.UTF8)
      else
       case lResponse.StatusCode of
          400: {implementar retorno};
          404: {implementar retorno};
       end;
    except
      on e: Exception do
      begin
        lError := lResponse.StatusText + ' ' + e.Message;
      end;
    end;
  finally
    lHttpClient.Free;
  end;

  lError := aError;
  Result := lJSON;
end;

end.
