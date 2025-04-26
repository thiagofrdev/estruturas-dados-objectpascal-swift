Program Aluno2;
type  aluno= record
    nome: string[100]
    cpf: string[14];
    matricula: string[20];
    idade: Integer;
    endereco: string[150];
    filiacao mae: string[100];
    filiacao pai: string(100);
end;
var a = aluno;