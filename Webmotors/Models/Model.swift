import ObjectMapper

struct Model: Mappable {
    var makeId: String
    var id: String
    var name: String

    init?(map: Map) {
        makeId = (try? map.value("MakeID")) ?? ""
        id = (try? map.value("ID")) ?? ""
        name = (try? map.value("Name")) ?? ""
    }

    mutating func mapping(map: Map) {
        makeId <- map["MakeID"]
        id <- map["ID"]
        name <- map["Name"]
    }
}
