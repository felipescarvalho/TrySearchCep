unit Endereco.JSON.Desserializador.Impl;

interface

uses
  System.SysUtils,
  JSON,
  RTTI;

type
  TEndereco = class
  private
    FCep: string;
    FLogradouro: string;
    FComplemento: string;
    FUnidade: string;
    FBairro: string;
    FLocalidade: string;
    FUf: string;
    FEstado: string;
    FRegiao: string;
    FIbge: string;
    FGia: string;
    FDDD: string;
    FSiafi: string;
  public
    property Cep: string read FCep write FCep;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Complemento: string read FComplemento write FComplemento;
    property Unidade: string read FUnidade write FUnidade;
    property Bairro: string read FBairro write FBairro;
    property Localidade: string read FLocalidade write FLocalidade;
    property Uf: string read FUf write FUf;
    property Estado: string read FEstado write FEstado;
    property Regiao: string read FRegiao write FRegiao;
    property Ibge: string read FIbge write FIbge;
    property Gia: string read FGia write FGia;
    property DDD: string read FDDD write FDDD;
    property Siafi: string read FSiafi write FSiafi;

    class function Desserializar(const pJSON: string): TEndereco;
  end;

{ TEndereco }

implementation


class function TEndereco.Desserializar(const pJSON: string): TEndereco;
begin
  var lJSON := TJSONObject.ParseJSONValue(pJSON) as TJSONObject;

  try
    try
      Result := TEndereco.Create;

      var lLogradouro: string;
      if (lJSON.TryGetValue<string>('logradouro', lLogradouro) or lJSON.TryGetValue<string>('address', lLogradouro))  then
        Result.FLogradouro := lLogradouro;

      var lBairro: string;
      if (lJSON.TryGetValue<string>('bairro', lBairro) or lJSON.TryGetValue<string>('district', lBairro))  then
        Result.FBairro := lBairro;

      var lEstado: string;
      if (lJSON.TryGetValue<string>('estado', lEstado) or lJSON.TryGetValue<string>('city', lEstado))  then
        Result.FEstado := lEstado;

      var lUF: string;
      if (lJSON.TryGetValue<string>('uf', lUF) or lJSON.TryGetValue<string>('state', lUF))  then
        Result.FUf := lUF;

      var lIbge: string;
      if (lJSON.TryGetValue<string>('ibge', lIbge) or lJSON.TryGetValue<string>('city_ibge', lIbge))  then
        Result.FIbge := lIbge;

      var lDDD: string;
      if lJSON.TryGetValue<string>('DDD', lDDD)  then
        Result.FDDD := lDDD;

    except on e: Exception do
      raise Exception.Create('Erro ao tentar desserializar JSON e:>'+ e.message);
    end;
  finally
    lJSON.Free;
  end;
end;

end.
