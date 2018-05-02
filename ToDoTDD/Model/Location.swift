import CoreLocation

struct Location {
  let name: String
  let coordinates: CLLocationCoordinate2D?

  init(name: String, coordinates: CLLocationCoordinate2D? = nil) {
    self.name = name
    self.coordinates = coordinates
  }
}

extension Location: Equatable {
  static func ==(lhs: Location, rhs: Location) -> Bool {
    return lhs.name == rhs.name
      && lhs.coordinates?.latitude == rhs.coordinates?.longitude
      && lhs.coordinates?.longitude == rhs.coordinates?.longitude
  }
}
