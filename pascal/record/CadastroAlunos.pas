Program CadastroAlunos;

Type
  Endereco = Record
    rua: String;
    numero: Integer;
    bairro: String;
    cidade: String;
    estado: String;
  End;

  Filiacao = Record
    mae: String;
    pai: String;
  End;

  Aluno = Record
    nome: String;
    CPF: String;
    numero_matricula: Integer;
    idade: Integer;
    endereco: Endereco;
    filiacao: Filiacao;
  End;

Const
  MAX_ALUNOS = 100; // Define um limite máximo de alunos

Var
  alunos: Array[1..MAX_ALUNOS] of Aluno;
  totalAlunos: Integer;
  opcaoMenu: Integer;
  matriculaBusca: Integer; // Declarada no bloco principal
  indiceEncontrado: Integer; // Declarada no bloco principal

Procedure CadastrarAluno();
Var
  novoAluno: Aluno;
Begin
  Writeln('--- Cadastro de Novo Aluno ---');
  Write('Nome: ');
  Readln(novoAluno.nome);
  Write('CPF: ');
  Readln(novoAluno.CPF);
  Write('Número de Matrícula: ');
  Readln(novoAluno.numero_matricula);
  Write('Idade: ');
  Readln(novoAluno.idade);

  Writeln('--- Endereço ---');
  Write('Rua: ');
  Readln(novoAluno.endereco.rua);
  Write('Número: ');
  Readln(novoAluno.endereco.numero);
  Write('Bairro: ');
  Readln(novoAluno.endereco.bairro);
  Write('Cidade: ');
  Readln(novoAluno.endereco.cidade);
  Write('Estado: ');
  Readln(novoAluno.endereco.estado);

  Writeln('--- Filiação ---');
  Write('Nome da Mãe: ');
  Readln(novoAluno.filiacao.mae);
  Write('Nome do Pai: ');
  Readln(novoAluno.filiacao.pai);

  totalAlunos := totalAlunos + 1;
  alunos[totalAlunos] := novoAluno;
  Writeln('Aluno cadastrado com sucesso!');
  Readln; // Pausa para o usuário ver a mensagem
End;

Procedure ListarAlunos();
Var
  i: Integer;
Begin
  Writeln('--- Lista de Alunos Cadastrados ---');
  If totalAlunos = 0 Then
    Writeln('Nenhum aluno cadastrado.')
  Else
    For i := 1 to totalAlunos do
    Begin
      Writeln('------------------------------');
      Writeln('Nome: ', alunos[i].nome);
      Writeln('CPF: ', alunos[i].CPF);
      Writeln('Matrícula: ', alunos[i].numero_matricula);
      Writeln('Idade: ', alunos[i].idade);
      Writeln('Endereço: ', alunos[i].endereco.rua, ', ', alunos[i].endereco.numero, ' - ', alunos[i].endereco.bairro, ', ', alunos[i].endereco.cidade, ' - ', alunos[i].endereco.estado);
      Writeln('Mãe: ', alunos[i].filiacao.mae);
      Writeln('Pai: ', alunos[i].filiacao.pai);
    End;
  Writeln('------------------------------');
  Readln; // Pausa para o usuário ver a lista
End;

Function BuscarAlunoPorMatricula(matricula: Integer): Integer;
Var
  i: Integer;
Begin
  BuscarAlunoPorMatricula := 0; // Retorna 0 se não encontrado
  For i := 1 to totalAlunos do
  Begin
    If alunos[i].numero_matricula = matricula Then
    Begin
      BuscarAlunoPorMatricula := i;
      Exit;
    End;
  End;
End;

Procedure ExibirDadosAluno(indice: Integer);
Begin
  Writeln('--- Dados do Aluno ---');
  Writeln('Nome: ', alunos[indice].nome);
  Writeln('CPF: ', alunos[indice].CPF);
  Writeln('Matrícula: ', alunos[indice].numero_matricula);
  Writeln('Idade: ', alunos[indice].idade);
  Writeln('Endereço: ', alunos[indice].endereco.rua, ', ', alunos[indice].endereco.numero, ' - ', alunos[indice].endereco.bairro, ', ', alunos[indice].endereco.cidade, ' - ', alunos[indice].endereco.estado);
  Writeln('Mãe: ', alunos[indice].filiacao.mae);
  Writeln('Pai: ', alunos[indice].filiacao.pai);
  Readln; // Pausa para o usuário ver os dados
End;

Procedure AtualizarAluno();
Var
  matriculaBuscaLocal: Integer;
  indice: Integer;
  opcao: Char;
  codigoErro: Integer;
Begin
  Writeln('--- Atualizar Dados do Aluno ---');
  Write('Digite o número de matrícula do aluno que deseja atualizar: ');
  Readln(matriculaBuscaLocal);
  indice := BuscarAlunoPorMatricula(matriculaBuscaLocal);

  If indice > 0 Then
  Begin
    ExibirDadosAluno(indice);
    Writeln('Deseja realmente atualizar este aluno? (S/N)');
    Readln(opcao);
    If UpCase(opcao) = 'S' Then
    Begin
      Writeln('--- Digite os Novos Dados (deixe em branco para manter o valor atual) ---');

      Write('Novo Nome (', alunos[indice].nome, '): ');
      Readln(alunos[indice].nome);

      Write('Novo CPF (', alunos[indice].CPF, '): ');
      Readln(alunos[indice].CPF);

      Write('Nova Idade (', alunos[indice].idade, '): ');
      Readln(opcao);
      If opcao <> '' Then
      Begin
        Val(opcao, alunos[indice].idade, codigoErro);
        If codigoErro <> 0 Then
          Writeln('Erro ao converter idade. Mantendo valor atual.');
      End;

      Writeln('--- Novo Endereço ---');
      Write('Nova Rua (', alunos[indice].endereco.rua, '): ');
      Readln(alunos[indice].endereco.rua);

      Write('Novo Número (', alunos[indice].endereco.numero, '): ');
      Readln(opcao);
      If opcao <> '' Then
      Begin
        Val(opcao, alunos[indice].endereco.numero, codigoErro);
        If codigoErro <> 0 Then
          Writeln('Erro ao converter número do endereço. Mantendo valor atual.');
      End;

      Write('Novo Bairro (', alunos[indice].endereco.bairro, '): ');
      Readln(alunos[indice].endereco.bairro);

      Write('Nova Cidade (', alunos[indice].endereco.cidade, '): ');
      Readln(alunos[indice].endereco.cidade);

      Write('Novo Estado (', alunos[indice].endereco.estado, '): ');
      Readln(alunos[indice].endereco.estado);

      Writeln('--- Nova Filiação ---');
      Write('Novo Nome da Mãe (', alunos[indice].filiacao.mae, '): ');
      Readln(alunos[indice].filiacao.mae);

      Write('Novo Nome do Pai (', alunos[indice].filiacao.pai, '): ');
      Readln(alunos[indice].filiacao.pai);

      Writeln('Dados do aluno atualizados com sucesso!');
    End
    Else
      Writeln('Operação de atualização cancelada.');
  End
  Else
    Writeln('Aluno com matrícula ', matriculaBuscaLocal, ' não encontrado.');
  Readln; // Pausa para o usuário ver a mensagem
End;

Procedure ExcluirAluno();
Var
  matriculaExcluir: Integer;
  indice: Integer;
  opcao: Char;
  i: Integer;
Begin
  Writeln('--- Excluir Aluno ---');
  Write('Digite o número de matrícula do aluno que deseja excluir: ');
  Readln(matriculaExcluir);
  indice := BuscarAlunoPorMatricula(matriculaExcluir);

  If indice > 0 Then
  Begin
    ExibirDadosAluno(indice);
    Writeln('Deseja realmente excluir este aluno? (S/N)');
    Readln(opcao);
    If UpCase(opcao) = 'S' Then
    Begin
      // Shift dos elementos subsequentes para preencher o espaço do aluno excluído
      For i := indice to totalAlunos - 1 do
        alunos[i] := alunos[i + 1];
      totalAlunos := totalAlunos - 1;
      Writeln('Aluno excluído com sucesso!');
    End
    Else
      Writeln('Operação de exclusão cancelada.');
  End
  Else
    Writeln('Aluno com matrícula ', matriculaExcluir, ' não encontrado.');
  Readln; // Pausa para o usuário ver a mensagem
End;

Begin
  totalAlunos := 0; // Inicializa o contador de alunos

  Repeat
    Writeln('--- Menu Principal ---');
    Writeln('1 - Cadastrar Aluno');
    Writeln('2 - Listar Alunos');
    Writeln('3 - Buscar Aluno por Matrícula');
    Writeln('4 - Atualizar Aluno');
    Writeln('5 - Excluir Aluno');
    Writeln('0 - Sair');
    Write('Escolha uma opção: ');
    Readln(opcaoMenu);

    Case opcaoMenu of
      1: CadastrarAluno();
      2: ListarAlunos();
      3: Begin
         Write('Digite o número de matrícula para buscar: ');
         Readln(matriculaBusca);
         indiceEncontrado := BuscarAlunoPorMatricula(matriculaBusca);
         If indiceEncontrado > 0 Then
           ExibirDadosAluno(indiceEncontrado)
         Else
           Writeln('Aluno com matrícula ', matriculaBusca, ' não encontrado.');
         Readln; // Pausa para o usuário ver a mensagem
       End;
      4: AtualizarAluno();
      5: ExcluirAluno();
      0: Writeln('Saindo do sistema...');
      Else
        Writeln('Opção inválida.');
        Readln; // Pausa para o usuário ver a mensagem
    End;
  Until opcaoMenu = 0;
End.

