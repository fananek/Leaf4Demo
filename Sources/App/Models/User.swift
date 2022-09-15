import Vapor

struct User: Encodable, Authenticatable {
    let id: UUID
    let fullName: String
    let email: String
}
