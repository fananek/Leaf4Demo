struct BaseContext: Encodable {
    let title: String
    let description: String
    let loggedInUser: User?
}
