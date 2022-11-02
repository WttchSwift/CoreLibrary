import XCTest
@testable import WttchCoreLibrary

final class WttchCoreLibraryTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(WttchCoreLibrary().text, "Hello, World!")
        
    }
    
    
    func testDataSh1() throws {
        // sha1("123") = 40bd001563085fc35165329ea1ff5c5ecbdbbeef
        let r1 = "40bd001563085fc35165329ea1ff5c5ecbdbbeef"
        let data = "123".data(using: .utf8)!
        
        XCTAssertEqual(r1, data.sha1())
        XCTAssertEqual(r1.uppercased(), data.sha1(true))
        XCTAssertEqual(r1.uppercased(), "123".sha1(true))
    }
    
    func testCache() throws {
        print(FileCache.cachePath)
    }
}
