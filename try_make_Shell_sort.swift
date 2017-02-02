var c = "8, 5, 7, 3, 2, 10, 1, -9, 90, -100, -2"

func shellSort(_ str: inout String) -> [String] {
    var arr = str.components(separatedBy: ", ")
    var step : Int = arr.count / 2

    while(step > 0) {
        for i in 0..<step {
            for i2 in stride(from: i+step, to: arr.count, by: step) {
                for i3 in stride(from: i2, to: step-1, by: -step) {
                    let last = arr[i3]
                    if i3-step >= 0 && Int(arr[i3])! < Int(arr[i3-step])! {
                        arr[i3]      = arr[i3-step]
                        arr[i3-step] = last
                    } else { break }
                }
            }
        }
        step /= 2
    }
    return arr
}

shellSort(&c)