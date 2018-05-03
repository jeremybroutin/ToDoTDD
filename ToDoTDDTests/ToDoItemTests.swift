import XCTest
@testable import ToDoTDD
import CoreLocation

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
    XCTAssertEqual(item.location, location, "should set location")
  }

  func testEqualItems_AreEqual() {
    let first = ToDoItem(title: "Foo")
    let second = ToDoItem(title: "Foo")
    XCTAssertEqual(first, second)
  }

  func testItems_WhenTitlesDiffer_AreNotEqual() {
    let first = ToDoItem(title: "Foo")
    let second = ToDoItem(title: "Bar")
    XCTAssertNotEqual(first, second)
  }

  func testItems_WhenLocationDiffers_AreNotEqual() {
    let first = ToDoItem(title: "", location: Location(name: "Foo"))
    let second = ToDoItem(title: "", location: Location(name: "Bar"))
    XCTAssertNotEqual(first, second)
  }

  func testItems_WhenOnlyOneHasLocation_AreNotEqual() {
    let first = ToDoItem(title: "", location: Location(name: "Foo"))
    let second = ToDoItem(title: "", location: nil)
    XCTAssertNotEqual(first, second)
  }

  func testItems_WhenTimestampsDiffer_AreNotEqual() {
    let first = ToDoItem(title: "Foo", timestamp: 1.0)
    let second = ToDoItem(title: "Foo", timestamp: 0.0)
    XCTAssertNotEqual(first, second)
  }

  func testItems_WhenDescriptionsDiffer_AreNotEqual() {
    let first = ToDoItem(title: "Foo", description: "Bar")
    let second = ToDoItem(title: "Foo", description: "Baz")
    XCTAssertNotEqual(first, second)
  }
}
