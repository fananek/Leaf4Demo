import Foundation

struct User: Encodable {
    let id: UUID
    let fullName: String
    let email: String
}
