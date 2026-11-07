import XCTest
@testable import BrasilUtils

final class BrasilUtilsTests: XCTestCase {

    func testPhoneFormat() {
        XCTAssertEqual(Phone.format("79999999999"), "(79) 99999-9999")
        XCTAssertEqual(Phone.format("7933334444"), "(79) 3333-4444")
    }

    func testCEP() {
        XCTAssertEqual(CEP.format("49000000"), "49000-000")
        XCTAssertTrue(CEP.isValid("49000000"))
    }

    func testCPF() {
        // Valid test CPF (common example)
        XCTAssertTrue(CPF.isValid("390.533.447-05"))
        XCTAssertFalse(CPF.isValid("111.111.111-11"))
        XCTAssertEqual(CPF.format("39053344705"), "390.533.447-05")
    }

    func testCurrency() {
        let result = Currency.format(19.9)
        XCTAssertTrue(result.contains("19,90") || result.contains("19.90"))
    }
}
