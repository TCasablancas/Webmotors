import ObjectMapper

struct MainList: Mappable {
    var vahicles: [Vehicle]

    init?(map: Map) {
        vahicles = [(try? map.value("")) ?? Vehicle(map: map)!]
    }

    mutating func mapping(map: Map) {
        vahicles <- map[""]
    }
}
