let students = ["João": 19, "Kaique": 19, "Lívia": 18]
let idade = students["João"] ?? -1 //Operador de Coalescência para evitar que o valor seja nulo
print("A idade de João é: ", idade)


//Criando um dicionário vazio e depois inserindo um valor nele.
var countries: [String: String] = [:]
countries["Brazil"] = "Brasilia"
print(countries)