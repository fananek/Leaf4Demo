struct TagsContext: Encodable {
    let title: String
    let description: String
    let loggedInUser: User?
    let name: String
    let myArray: [String]
}
