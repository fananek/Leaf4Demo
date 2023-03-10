struct ConditionsLoopsContext: Encodable {
    let title: String
    let description: String
    let cards: [Card]
    let board: [[String]]
}