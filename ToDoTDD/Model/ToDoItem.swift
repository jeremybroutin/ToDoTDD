import Foundation

struct ToDoItem {
  let title: String
  let description: String?
  let timestamp: Double?
  let location: Location?

  init(title: String, description: String? = nil, timestamp: Double? = nil, location: Location? = nil) {
    self.title = title
    self.description = description
    self.timestamp = timestamp
    self.location = location
  }
}

extension ToDoItem: Equatable {
  static func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
    if lhs.location?.name != rhs.location?.name {
      return false
    }
    return true
  }
}
