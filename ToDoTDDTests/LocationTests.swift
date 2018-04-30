import XCTest
@testable import ToDoTDD
import CoreLocation

class LocationTests: XCTestCase {

  func testInit_SetsName() {
    let location = Location(name: "Foo")
    XCTAssertEqual(location.name, "Foo")
  }
    
  func testInit_SetsCoordinates() {
    let coordinates = CLLocationCoordinate2DMake(1, 2)
    let location = Location(name: "", coordinates: coordinates)
    XCTAssertEqual(location.coordinates?.latitude, coordinates.latitude, "should set the coordinates latitude")
    XCTAssertEqual(location.coordinates?.longitude, coordinates.longitude, "should set the coordinates longitude")
  }
}
