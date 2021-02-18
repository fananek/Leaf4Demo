struct ConditionsLoopsContext: Encodable {
    let title: String
    let description: String
    let loggedInUser: User?
    let cards: [Card]
}
