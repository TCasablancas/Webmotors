import Alamofire
import ObjectMapper

struct NetworkParser {
    
    func setupParser<T: Mappable>(url: URL, completion: @escaping ((Response<T>) -> Void)) {
        do {
            var request = try URLRequest(url: url, method: .get)
            request.setValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")

            Alamofire.request(request).responseJSON { (data) in
                let statusCode = data.response?.statusCode

                switch data.result {
                case .success(let value):
                    if statusCode == 200 {
                        for item in value as! [[String:Any]] {
                            let model = Mapper<T>().map(JSON: item)
                            completion(.success(model: model!))
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
        } catch let jsonError {
            print(jsonError)
        }
    }
}
