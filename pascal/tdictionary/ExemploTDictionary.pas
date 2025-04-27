program ExemploTDictionary;
uses
  SysUtils, Generics.Collections;

var
  dicionario: TDictionary<String, Integer>;
  valor: Integer;
begin
  // Criando um novo TDictionary
  dicionario := TDictionary<String, Integer>.Create;

  try
    // Adicionando pares chave-valor
    dicionario.Add('Thiago', 25);
    dicionario.Add('Ana', 30);
    dicionario.AddOrSetValue('Thiago', 26); // Atualiza o valor da chave 'Thiago'

    // Verificando se uma chave existe
    if dicionario.ContainsKey('Ana') then
      Writeln('A chave "Ana" está presente no dicionário.');

    // Obtendo um valor associado a uma chave
    if dicionario.TryGetValue('Thiago', valor) then
      Writeln('Valor associado à chave "Thiago": ', valor);

    // Removendo uma chave
    dicionario.Remove('Ana');

    // Iterando sobre o dicionário
    for var par in dicionario do
      Writeln(par.Key, ': ', par.Value);

    // Limpando o dicionário
    dicionario.Clear;

  finally
    dicionario.Free; // Liberando a memória alocada
  end;
end.