import Foundation

struct NumberEntry: Identifiable, Hashable {
    var id = UUID()
    var date: String
    var number: Int
}
