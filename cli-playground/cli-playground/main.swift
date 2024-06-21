func dfs(remain: [Int], i: Int, myArr: [Int], length: Int, result: inout [[Int]]) {
    if i == length {
        result.append(myArr)
        return
    }
    for r in remain {
        var newMyArr = myArr
        newMyArr.append(r)
        
        var newRemain = remain
        newRemain.removeAll { $0 == r }
        
        dfs(remain: newRemain, i: i + 1, myArr: newMyArr, length: length, result: &result)
    }
}

let arr = [3, 5, 6, 7, 8]
var result: [[Int]] = []

dfs(remain: arr, i: 0, myArr: [], length: arr.count, result: &result)
result.forEach {
    print($0)
}

func a(b: Int) {
    
}
