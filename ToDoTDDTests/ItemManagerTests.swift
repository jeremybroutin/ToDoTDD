import XCTest
@testable import ToDoTDD

class ItemManagerTests: XCTestCase {

  var sut: ItemManager!

  override func setUp() {
    sut = ItemManager()
  }

  override func tearDown() {
    sut = nil
  }

  func testToDoCount_Initially_IsZero() {
    XCTAssertEqual(sut.toDoCount, 0)
  }

  func testDoneCount_Initially_isZero() {
    XCTAssertEqual(sut.doneCount, 0)
  }

  func testAddItem_IncreasesToDoCountToOne() {
    sut.add(ToDoItem(title: ""))
    XCTAssertEqual(sut.toDoCount, 1)
  }

  func testItemAt_ReturnsAddedItem() {
    let item = ToDoItem(title: "Foo")
    sut.add(item)
    let returnedItem = sut.item(at: 0)
    XCTAssertEqual(returnedItem.title, item.title)
  }

  func testCheckItemAt_ChangesCounts() {
    sut.add(ToDoItem(title: ""))
    sut.checkItem(at: 0)
    XCTAssertEqual(sut.toDoCount, 0)
    XCTAssertEqual(sut.doneCount, 1)
  }

  func testCheckItemAt_RemovesItFromToDoItems() {
    let first = ToDoItem(title: "First")
    let second = ToDoItem(title: "Second")
    sut.add(first)
    sut.add(second)
    sut.checkItem(at: 0)
    XCTAssertEqual(sut.item(at: 0).title, "Second")
  }
}
