import Vapor

struct PageInfo<T>: Encodable where T: Encodable {
    let pageData: T
    let webpageURL: String
    let loggedInUser: User?
    let now: Date
}
