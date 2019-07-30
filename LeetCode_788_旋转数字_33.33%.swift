class Solution {
    func rotatedDigits(_ N: Int) -> Int {
        var count: Int = 0
        for i in 1...N {
            let array = "\(i)".utf8.map{Int(($0 as UInt8)) - 48}
            if (array.contains(3) || array.contains(4) || array.contains(7) || isSame(array)) {
                continue
            } else {
                count += 1
            }
        }
        return count
    }
    
    private func isSame(_ d: [Int]) -> Bool {
        for i in d {
            if (i == 2 || i == 5 || i == 6 || i == 9) { return false }
        }
        return true
    }
}
