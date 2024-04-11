let inp = readLine()!.split(separator: " ")

var arr = Array(repeating: 0, count: 20000)

inp.map { Array(String($0)).map { Int(String($0))! } }.forEach { ar in
    ar.enumerated().forEach { idx, i in
        arr[idx] = i
    }
}
print(arr)
