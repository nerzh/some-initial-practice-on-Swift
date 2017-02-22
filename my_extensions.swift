import UIKit
import Foundation

extension String {
    func heightSelf(_ width: CGFloat, _ font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let rect = (self as NSString).boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return rect.height
    }
    
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
        let range: Range<String.Index> = self.range(of: String(of))!
        return self.distance(from: self.startIndex, to: range.lowerBound)
    }
    
    var count : Int {
        get { return self.distance(from: self.startIndex, to: self.endIndex) }
    }
    
    var size : Int {
        get { return self.count }
    }
    
    // regexp temporary betta version
    subscript(pattern: String) -> String? {
        get {
            var result : String?
            
            do {
                let regexp = try NSRegularExpression(pattern: pattern)
                let matches = regexp.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
                
                for match in matches {
                    for count in 0..<match.numberOfRanges {
                        let rangeOfMatch = match.rangeAt(count)
                        
                        let resultRange = self.index(self.startIndex, offsetBy: rangeOfMatch.location) ..<
                            self.index(self.startIndex, offsetBy: rangeOfMatch.location+rangeOfMatch.length)
                        
                        return self.substring(with: resultRange)
                    }
                }
            } catch {
                result = nil
            }
            
            return result
        }
    }
    
    // regexp2 temporary betta version
    func regexp(_ pattern: String) -> [Int:String]? {
        var result : [Int:String]? = [Int:String]()
        
        do {
            let regexp = try NSRegularExpression(pattern: pattern)
            let matches = regexp.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
            for match in matches {
                for count in 0..<match.numberOfRanges {
                    let rangeOfMatch = match.rangeAt(count)
                    
                    let resultRange = self.index(self.startIndex, offsetBy: rangeOfMatch.location) ..<
                        self.index(self.startIndex, offsetBy: rangeOfMatch.location+rangeOfMatch.length)
                    
                    result?[count] = self.substring(with: resultRange)
                }
                return result
            }
            
            return nil
        } catch { result = nil }
        
        return result
    }
}

// for keyboard hidden
extension UIViewController {
    func setKeyboardEvent() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}


