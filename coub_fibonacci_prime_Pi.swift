// Coub 3D
var array  : [[[UInt32]]] = []
var array2 : [[UInt32]] = []
var array3 : [UInt32] = []
let Length = arc4random_uniform(7)+3

for i in 1...Length {
    for i in 1...Length {
        for i in 1...Length {
            array3.append((arc4random_uniform(89)+10))
        }
        array2.append(array3)
        array3 = []
    }
    array.append(array2)
    array2 = []
}
//print(array)
//Coub 3D end


// print coub 3D
func printArray(_ arr: [[[Any]]]) -> String {
    var str  = ""
    str += "["
    for (i, el) in arr.enumerated() {
        str += "["
        for (i2, el2) in el.enumerated() {
            str += "["
            for (i3, el3) in el2.enumerated() {
                el2.endIndex-1 == i3 ? (str += "\(el3)") : (str += "\(el3), ")
            }
            el2.endIndex-1 == i2 ? (str += "]") : (str += "], ")
        }
        arr.endIndex-1 == i ? (str += "]") : (str += "], ")
    }
    str += "]"
    return str
}

func printCoub(_ arr: [[[Any]]]) -> String {
    var str  = ""
    for el in arr {
        for (i2, el2) in el.enumerated() {
            str += "["
            for (i3, el3) in el2.enumerated() {
                el2.endIndex-1 == i3 ? (str += "\(el3)") : (str += "\(el3), ")
            }
            el2.endIndex-1 == i2 ? (str += "]\n\n") : (str += "]\n")
        }
    }
    return str
}
//print(printCoub(array))
// print coub 3D end


/// MARK: Fibonacci
func fib(count: Int, positive: Bool) -> [Int] {
    var arr: [Int] = [0, 1]
    while arr.count < count {
        if positive {
            if Int.max - fib_positive(arr) < arr.last! {
                arr.append(fib_positive(arr))
                break
            }
            arr.append(fib_positive(arr))
        } else {
            if abs(Double(Int.min)) - abs(Double(fib_negative(arr))) < abs(Double(arr.last!)) {
                arr.append(fib_negative(arr))
                break
            }
            arr.append(fib_negative(arr))
        }
    }
    return arr
}

func fib_positive(_ arr: [Int]) -> Int {
    return arr.last! + arr[arr.endIndex-2]
}

func fib_negative(_ arr: [Int]) -> Int {
    return arr[arr.endIndex-2] - arr.last!
}
//print(fib(count: 5, positive: true))
/// Fibonacci end


/// MARK: Prime number
func checkPrime (_ n: Float) -> Bool {
    if Int(n) & 1 == 0 && Int(n) != 2 { return false }
    for i in stride(from: 3, to: Int(sqrtf(n)) + 1, by: 2) {
        if Int(n) % Int(i) == 0 {
            return false
        }
    }
    return true
}

func prime(count: Int) -> [Int] {
    var arr = [Int]()
    for i in 2..<Int.max {
        if arr.count == count  { break }
        if checkPrime(Float(i)) { arr.append(i) }
    }
    return arr
}
//print(prime(count: 5))
/// Prime number end


// MARK: Pi
func summandPi(_ number: Double) -> Double {
    return 4 / (number * (number+1) * (number+2))
}

func digit(_ num: Double, _ digit: Int) -> Double {
    return Double(Int(num*pow(10, Double(digit))))/pow(10, Double(digit))
}

func pi(precision: Int = 2) -> Double {
    let x             : Double = 3
    var tempSumm      : Double = 0
    var comparableNum : Double = 0
    var toggle        : Bool   = true
    
    for i in stride(from: 2, to: Int.max, by: 2) {
        if toggle {
            tempSumm += summandPi(Double(i))
            if digit(tempSumm, precision) == comparableNum { break }
            comparableNum = digit(tempSumm, precision)
            toggle        = false
        } else {
            tempSumm     -= summandPi(Double(i))
            comparableNum = digit(tempSumm, precision)
            toggle        = true
        }
    }
    return x + comparableNum
}
//print(pi(precision: 2))
// Pi end


// MARK: Factorial
func fact(_ num: Int) -> Int {
    var reslt = 1
    if num == 0 { return reslt }
    
    for i in 1...num {
        if i+2 > Int.max/reslt { break }
        reslt *= i
    }
    return reslt
}
print(fact(20))
// Factorial end