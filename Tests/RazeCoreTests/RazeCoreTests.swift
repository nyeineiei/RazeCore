import XCTest
@testable import RazeCore

final class RazeCoreTests: XCTestCase {
    func testColorRedEqual() {
      let color = RazeCore.fromHexString("FF0000")
      XCTAssertEqual(color, .red)
    }
    
    func testRazeColorsAreEqual() {
      let color = RazeCore.fromHexString("006736")
      XCTAssertEqual(color, RazeCore.razeColor)
    }

    public static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testRazeColorsAreEqual", testRazeColorsAreEqual),
    ]
}
