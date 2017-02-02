extension String {
    subscript(index: Int) -> String {
        get {
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
        set {
            self.remove(at: self.index(self.startIndex, offsetBy: index))
            self.insert(Character(newValue), at: self.index(self.startIndex, offsetBy: index))
        }
    }
    
    func indexLast(_ num: Int) -> String.Index {
        return self.index(self.startIndex, offsetBy: self.characters.count - 1 + num)
    }
    
    func indexStart(_ num: Int) -> String.Index {
        return self.index(self.startIndex, offsetBy: num)
    }
    
    var lastIndex: String.Index {
        get { return self.index(before: self.endIndex) }
    }
    
    var last: String {
        get { return String(self[self.lastIndex])}
    }
    
    var first: String {
        get { return String(self[self.startIndex])}
    }
    
    func findIndex(of: Character) -> Int {
        let range: Range<String.Index> = self.range(of: "b")!
        return self.distance(from: self.startIndex, to: range.lowerBound)
    }
}






// 1
func mister8Bit(_ num: UInt8, _ digit: UInt8 = 2, str: String = "") -> String {
    var tempStr = str
    if num < 1 {
        for _ in 0..<8 - tempStr.characters.count {
            tempStr.insert("0", at: tempStr.startIndex)
        }
        return tempStr
    }
    tempStr.insert(Character(String(num % digit)), at: tempStr.startIndex)
    
    return mister8Bit(num / digit, digit, str: tempStr)
}
mister8Bit(188)
String(188, radix: 2)


// 2
func misterBit(_ num: Int, _ digit: Int = 2, str: String = "") -> String {
    var tempStr = str
    if num < 1 { return tempStr }
    tempStr.insert(Character(String(num % digit)), at: tempStr.startIndex)
    return misterBit(num / digit, digit, str: tempStr)
}
misterBit(2553, 2)
String(2553, radix: 2)



// 3
func misterBin(_ n: UInt8, _ digit: UInt8 = 2) -> String {
    var tempStr = ""
    var num     = n
    for _ in 1...8 {
        tempStr.insert(Character(String(num % digit)), at: tempStr.startIndex)
        num /= digit
    }
    return tempStr
}
misterBin(255, 9)
String(255, radix: 9)




// MARK: Universal Bit
// recursive
func mister16Bit(_ num: Int, _ digit: Int = 2, str: String = "") -> String {
    let arr: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
                           "A", "B", "C", "D", "E", "F"]
    var tempStr = str
    if num < 1 { return tempStr }
    tempStr.insert(arr[num % digit], at: tempStr.startIndex)
    return mister16Bit(num / digit, digit, str: tempStr)
}
mister16Bit(255, 16)
String(255, radix: 16)

// not recursive
func hexToInt(_ str: String, _ digit: Int = 2) -> Int {
    let arr: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
                           "A", "B", "C", "D", "E", "F"]
    var tempStr      = str
    var reslt: Double = 0
    
    for i in 0...tempStr.characters.count-1 {
        reslt += Double( arr.index(of: tempStr[tempStr.indexLast(-i)])! ) * pow(Double(digit), Double(i))
    }
    return Int(reslt)
}
hexToInt("20", 10)
String(111, radix: 16)


func perevod(_ val: String, _ at: Int, _ to: Int) -> String {
    return mister16Bit(hexToInt(val, at), to)
}
perevod("10", 10, 2)
// Universal Bit end
