import XCTest
@testable import RazeCore

final class RazeCoreTests: XCTestCase {
    func testColorRedEqual() {
      let color = RazeCore.fromHexString("FF0000")
      XCTAssertEqual(color, .red)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
    ]
}
