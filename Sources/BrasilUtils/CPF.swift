import Foundation

public enum CPF {

    /// Validates a Brazilian CPF (with or without punctuation).
    public static func isValid(_ input: String) -> Bool {
        let digits = input.filter { $0.isNumber }
        guard digits.count == 11 else { return false }

        // Reject known invalid sequences
        if Set(digits).count == 1 { return false }

        let numbers = digits.map { Int(String($0))! }

        // First digit
        var sum = 0
        for i in 0..<9 {
            sum += numbers[i] * (10 - i)
        }
        var first = (sum * 10) % 11
        if first == 10 { first = 0 }
        guard first == numbers[9] else { return false }

        // Second digit
        sum = 0
        for i in 0..<10 {
            sum += numbers[i] * (11 - i)
        }
        var second = (sum * 10) % 11
        if second == 10 { second = 0 }
        return second == numbers[10]
    }

    /// Formats a CPF.
    public static func format(_ input: String) -> String {
        let digits = input.filter { $0.isNumber }
        guard digits.count == 11 else { return digits }

        let p1 = String(digits.prefix(3))
        let p2 = String(digits.dropFirst(3).prefix(3))
        let p3 = String(digits.dropFirst(6).prefix(3))
        let p4 = String(digits.suffix(2))
        return "\(p1).\(p2).\(p3)-\(p4)"
    }
}
