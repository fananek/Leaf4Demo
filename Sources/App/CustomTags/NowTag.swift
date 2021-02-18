import Foundation
import Leaf

struct NowTag: LeafTag {

    func render(_ ctx: LeafContext) throws -> LeafData {
        struct NowTagError: Error {}

        let formatter = DateFormatter()
        switch ctx.parameters.count {
        case 0: formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        case 1:
            guard let string = ctx.parameters[0].string else {
                throw NowTagError()
            }
            formatter.dateFormat = string
        default:
            throw NowTagError()
        }

        let dateAsString = formatter.string(from: Date())
        return LeafData.string(dateAsString)
    }
}
