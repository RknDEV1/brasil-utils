import Foundation

public enum CEP {

    /// Formats a CEP (Brazilian postal code).
    public static func format(_ input: String) -> String {
        let digits = input.filter { $0.isNumber }
        guard digits.count == 8 else { return digits }

        let prefix = String(digits.prefix(5))
        let suffix = String(digits.suffix(3))
        return "\(prefix)-\(suffix)"
    }

    /// Validates basic CEP structure (8 digits).
    public static func isValid(_ input: String) -> Bool {
        let digits = input.filter { $0.isNumber }
        return digits.count == 8
    }
}
