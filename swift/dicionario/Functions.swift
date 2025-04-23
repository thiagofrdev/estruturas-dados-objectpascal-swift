var people = ["Silvio": 80, "Alessandra": 50, "Matheus": 27, "Ricardo": 10, "Márcia": 16, "Renata": 35]
people.removeValue(forKey: "Alessandra")
people.updateValue(75 ,forKey: "Silvio")
let names = people.map {$0.key}
let ages = people.map {$0.value}

print("Os nomes das pessoas analisadas são: ", names)
print("As idades dessas pessoas são: ", ages)

print("-----------------------------------------------")
var people2 = ["João": 27, "Vladimir": 65, "Renata": 35]
let newPeople = people.merging(people2) {atual, novo in novo}
print("Novas pessoas foram adicionadas à análise, observe: ")
newPeople.forEach { name, age in 
    print("\(name) tem \(age) anos.")
}
//Note, inclusive, que o merging não duplica chaves. 
//"Renata" estava presente nos 2 dicionários e foi adicionada apenas 1 vez no novo dicionário.

let underagePeople = people.filter{$0.value < 18}
print("Essas pessoas são menores de idade: ", underagePeople)


if people.contains(where: {$0.value >= 65}){
    print("Existe pelo menos uma pessoa idosa.")
} else {
    print("Nessa análise não existe nenhuma pessoa idosa.")
}

if let elderly = people.first(where: { $0.value >= 65 }) {
    print("A primeira pessoa idosa encontrada foi \(elderly.key), com \(elderly.value) anos.")
} else {
    print("Nenhuma pessoa idosa foi encontrada.")
}