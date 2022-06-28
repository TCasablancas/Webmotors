import ObjectMapper

struct Version: Mappable {
    var modelId: String
    var id: String
    var name: String

    init?(map: Map) {
        modelId = (try? map.value("ModelID")) ?? ""
        id = (try? map.value("ID")) ?? ""
        name = (try? map.value("Name")) ?? ""
    }

    mutating func mapping(map: Map) {
        modelId <- map["ModelID"]
        id <- map["ID"]
        name <- map["Name"]
    }
}
