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
    
    //    func findIndex(of: Character) -> Int {
    //        let range: Range<String.Index> = self.range(of: "a")!
    //        return self.distance(from: self.startIndex, to: range.lowerBound)
    //    }
}
