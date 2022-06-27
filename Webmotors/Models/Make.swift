import ObjectMapper

struct Make: Mappable {
    var id: String
    var name: String
    
    init?(map: Map) {
        id = (try? map.value("ID")) ?? ""
        name = (try? map.value("Name")) ?? ""
    }
    
    mutating func mapping(map: Map) {
        id <- map["ID"]
        name <- map["Name"]
    }
}
