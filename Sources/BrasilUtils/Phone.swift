import Foundation

public enum Phone {

    /// Formats a Brazilian phone number.
    /// - Parameter digits: Only numbers (with or without country code)
    /// - Returns: Formatted string like (79) 99999-9999 or 0800...
    public static func format(_ input: String) -> String {
        let digits = input.filter { $0.isNumber }

        if digits.hasPrefix("0800") || digits.hasPrefix("0300") {
            return digits
        }

        if digits.count == 11 { // mobile with DDD
            let ddd = String(digits.prefix(2))
            let part1 = String(digits.dropFirst(2).prefix(5))
            let part2 = String(digits.suffix(4))
            return "(\(ddd)) \(part1)-\(part2)"
        }

        if digits.count == 10 { // landline
            let ddd = String(digits.prefix(2))
            let part1 = String(digits.dropFirst(2).prefix(4))
            let part2 = String(digits.suffix(4))
            return "(\(ddd)) \(part1)-\(part2)"
        }

        return digits
    }

    /// Returns only the digits suitable for tel: links.
    public static func digitsOnly(_ input: String) -> String {
        input.filter { $0.isNumber }
    }
}
