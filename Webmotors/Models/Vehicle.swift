import ObjectMapper

struct Vehicle: Mappable {
    var id: String
    var make: String
    var model: String
    var version: String
    var image: String
    var km: Int
    var price: String
    var yearModel: Int
    var yearFab: Int
    var color: String

    init?(map: Map) {
        id = (try? map.value("ID")) ?? ""
        make = (try? map.value("Make")) ?? ""
        model = (try? map.value("Model")) ?? ""
        version = (try? map.value("Version")) ?? ""
        image = (try? map.value("Image")) ?? ""
        km = (try? map.value("KM")) ?? 0
        price = (try? map.value("Price")) ?? ""
        yearModel = (try? map.value("YearModel")) ?? 0
        yearFab = (try? map.value("YearFab")) ?? 0
        color = (try? map.value("Color")) ?? ""
    }

    mutating func mapping(map: Map) {
        id <- map["ID"]
        make <- map["Make"]
        model <- map["Model"]
        version <- map["Version"]
        image <- map["Image"]
        km <- map["KM"]
        price <- map["Price"]
        yearModel <- map["YearModel"]
        yearFab <- map["YearFab"]
        color <- map["Color"]
    }
}
