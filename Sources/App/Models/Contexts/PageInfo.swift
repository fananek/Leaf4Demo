import Vapor

struct PageInfo<T>: Encodable where T: Encodable {
    let pageData: T
    let webpageURL: String
    let now: Date
}
