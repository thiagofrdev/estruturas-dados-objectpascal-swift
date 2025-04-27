print("Inicializações de Arrays\n")

let numeros = [1, 2, 3, 4, 5, 6, 7, 8] //Tamanho fixo (let)
var numeros0 = Array(repeating: 0, count: 10) //Tamanho dinâmico (var)
var arrayDeDoubles: [Double] = [] //Array vazio com tipo determinado

print("Array fixo: ", numeros)
print("Array dinâmico: ", numeros0)
print("Array vazio do tipo Double: ", arrayDeDoubles)

print("\nMétodos de manipulação de Arrays\n")

print("Append - Insere 100.0 no array de doubles")
arrayDeDoubles.append(100.0)

print("Append ContentsOf - Insere 101.0 a 106.0 no array de doubles")
arrayDeDoubles.append(contentsOf: [102.0, 105.0, 101.0, 103.0, 106.0, 104.0])

print("\nInsert - Insere 107.0 no array de doubles")
arrayDeDoubles.insert(107.0, at: 7)

print("\nArray de doubles: ", arrayDeDoubles)
      
print("\nRemove - Remove o elemento na posição 0 do array de doubles")
arrayDeDoubles.remove(at: 0)

print("Remove Last - Remove o último elemento do array de doubles")
arrayDeDoubles.removeLast()

print("\nArray de doubles: ", arrayDeDoubles)

print("\nContains - Retorna true ou false para a presença de um elemento no array")
print("Array de doubles contém 103.0? ", arrayDeDoubles.contains(103.0))

print("isEmpty - Verifica se o array está vazio")
print("Array de doubles está vazio? ", arrayDeDoubles.isEmpty)

print("\nFirst - Retorna o primeiro elemento do array: ", arrayDeDoubles.first ?? "Array vazio")
print("Last - Retorna o último elemento do array: ", arrayDeDoubles.last ?? "Array vazio")

print("\nCount - Retorna o tamanho do array: ", arrayDeDoubles.count)
print("Reversed - Retorna o array invertido: ", Array(arrayDeDoubles.reversed()))
print("Sorted - Retorna o array ordenado: ", arrayDeDoubles.sorted())