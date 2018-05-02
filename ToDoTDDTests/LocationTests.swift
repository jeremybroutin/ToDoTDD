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

  func testEqualLocations_AreEqual() {
    let first = Location(name: "Foo")
    let second = Location(name: "Foo")
    XCTAssertEqual(first, second)
  }

  func testLocations_WhenNamesDiffer_AreNotEqual() {
    assertLocationNotEqualWith(firstName: "Foo", firstLongLat: nil, secondName: "Bar", secondLongLat: nil)
  }

  func testLocations_WhenLatitudeDiffers_AreNotEqual() {
    assertLocationNotEqualWith(firstName: "Foo", firstLongLat: (1,0), secondName: "Foo", secondLongLat: (0,0))
  }

  func testLocations_WhenLongitudeDiffers_AreNotEqual() {
    assertLocationNotEqualWith(firstName: "Foo", firstLongLat: (0,1), secondName: "Foo", secondLongLat: (0,0))
  }

  func testLocations_WhenOnlyOneHasCoordinate_AreNotEqual() {
    assertLocationNotEqualWith(firstName: "Foo", firstLongLat: (1,0), secondName: "Foo", secondLongLat: nil)
  }

  // MARK: - Helpers

  func assertLocationNotEqualWith(firstName: String, firstLongLat: (Double, Double)?, secondName: String, secondLongLat: (Double, Double)?, line: UInt = #line) {
    var firstCoord: CLLocationCoordinate2D? = nil
    if let firstLongLat = firstLongLat {
      firstCoord = CLLocationCoordinate2DMake(firstLongLat.0, firstLongLat.1)
    }
    let first = Location(name: firstName, coordinates: firstCoord)
    var secondCoord : CLLocationCoordinate2D? = nil
    if let secondLongLat = secondLongLat {
      secondCoord = CLLocationCoordinate2DMake(secondLongLat.0, secondLongLat.1)
    }
    let second = Location(name: secondName, coordinates: secondCoord)
    XCTAssertNotEqual(first, second)
  }
}
