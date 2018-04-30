import XCTest
@testable import ToDoTDD

class ToDoItemTests: XCTestCase {

  func testInit_WithTitle_SetsTitle() {
    let item = ToDoItem(title: "Foo")
    XCTAssertEqual(item.title, "Foo", "should set title")
  }

  func testInit_WithDescription_SetsDescription() {
    let item = ToDoItem(title: "", description: "Bar")
    XCTAssertEqual(item.description, "Bar", "should set description")
  }

  func testInit_SetsTimeStamp() {
    let item = ToDoItem(title: "", timestamp: 0.0)
    XCTAssertEqual(item.timestamp, 0.0, "should set timestamp")
  }

  func testInit_WithLocation_SetsLocation() {
    let location = Location(name: "Foo")
    let item = ToDoItem(title: "", location: location)
    XCTAssertEqual(item.location?.name, location.name, "should set location")
  }
}
