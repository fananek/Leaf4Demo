import Foundation
import Leaf

struct NowTableTag: UnsafeUnescapedLeafTag {

    func render(_ ctx: LeafContext) throws -> LeafData {
        struct NowTableTagError: Error {}

        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        switch ctx.parameters.count {
        case 0: dateFormatter.dateFormat = "yyyy-MM-dd"
                timeFormatter.dateFormat = "HH:mm:ss"
        case 1:
            guard let string = ctx.parameters[0].string else {
                throw NowTableTagError()
            }
            dateFormatter.dateFormat = string
            timeFormatter.dateFormat = string
        default:
            throw NowTableTagError()
        }

        let dateTableAsString = "<table><tr><th>Date:</th><th>Time:</th></tr><tr><td>\(dateFormatter.string(from: Date()))</td><td>\(timeFormatter.string(from: Date()))</td></tr></table>"
        return LeafData.string(dateTableAsString)
    }
}
