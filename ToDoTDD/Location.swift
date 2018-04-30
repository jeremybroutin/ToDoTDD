import CoreLocation

struct Location {
  let name: String
  let coordinates: CLLocationCoordinate2D?

  init(name: String, coordinates: CLLocationCoordinate2D? = nil) {
    self.name = name
    self.coordinates = coordinates
  }
}
