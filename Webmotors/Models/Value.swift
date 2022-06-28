import Foundation
import ObjectMapper

struct Value: Mappable {
    var valueData: [Make]

    init?(map: Map) {
        valueData = [(try? map.value("")) ?? Make(map: map)!]
    }

    mutating func mapping(map: Map) {
        valueData <- map[""]
    }
}
