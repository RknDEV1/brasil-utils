import XCTest
@testable import BrasilUtils

final class BrasilUtilsTests: XCTestCase {

    func testPhoneFormat() {
        XCTAssertEqual(Phone.format("79999999999"), "(79) 99999-9999")
        XCTAssertEqual(Phone.format("7933334444"), "(79) 3333-4444")
    }

    func testCEPValid() {
        XCTAssertEqual(CEP.format("49000000"), "49000-000")
        XCTAssertTrue(CEP.isValid("49000000"))
        XCTAssertTrue(CEP.isValid("49000-000"))
    }

    func testCEPInvalid() {
        // Too short
        XCTAssertFalse(CEP.isValid("4900000"))
        XCTAssertFalse(CEP.isValid("490"))
        XCTAssertFalse(CEP.isValid(""))

        // Too long
        XCTAssertFalse(CEP.isValid("490000000"))
        XCTAssertFalse(CEP.isValid("4900000000"))

        // Letters / mixed
        XCTAssertFalse(CEP.isValid("49A00000"))
        XCTAssertFalse(CEP.isValid("ABCDEFGH"))

        // Formatting should not invent validity
        XCTAssertEqual(CEP.format("4900000"), "4900000") // less than 8 digits stays raw
        XCTAssertEqual(CEP.format("abc"), "")
    }

    func testCPFValid() {
        XCTAssertTrue(CPF.isValid("390.533.447-05"))
        XCTAssertTrue(CPF.isValid("39053344705"))
        XCTAssertEqual(CPF.format("39053344705"), "390.533.447-05")
    }

    func testCPFInvalid() {
        // All same digits
        XCTAssertFalse(CPF.isValid("111.111.111-11"))
        XCTAssertFalse(CPF.isValid("00000000000"))
        XCTAssertFalse(CPF.isValid("99999999999"))

        // Wrong length
        XCTAssertFalse(CPF.isValid("123"))
        XCTAssertFalse(CPF.isValid("1234567890"))
        XCTAssertFalse(CPF.isValid("123456789012"))
        XCTAssertFalse(CPF.isValid(""))

        // Invalid check digits
        XCTAssertFalse(CPF.isValid("390.533.447-00"))
        XCTAssertFalse(CPF.isValid("123.456.789-00"))
        XCTAssertFalse(CPF.isValid("111.444.777-00"))

        // Letters / mixed
        XCTAssertFalse(CPF.isValid("390.533.447-0A"))
        XCTAssertFalse(CPF.isValid("abcdefghijk"))
    }

    func testCurrency() {
        let result = Currency.format(19.9)
        XCTAssertTrue(result.contains("19,90") || result.contains("19.90"))
    }
}
