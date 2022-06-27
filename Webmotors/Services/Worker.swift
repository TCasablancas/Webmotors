import UIKit
import Alamofire
import ObjectMapper

protocol WorkerDelegate: AnyObject {
    func getMakeData(completion: @escaping (_ response: Response<Make>) -> Void)
}

final class Worker: Request, WorkerDelegate {
    func getMakeData(completion: @escaping (Response<Make>) -> Void) {
        let url = "\(Endpoints.getEndpoint)Make"
        
        AF.request(url,
                          method: .get,
                          parameters: [String:Any],
                   headers: .default).responseString {(response) in

            parser.decodeRequest(response: response.map { $0 as Any }, completionHandler: {(decodeResponse, error) in
                SVProgressHUD.dismiss()

                self.completionBlock?(decodeResponse, error)
            })
        
        AF.request(url).responseJSON() { (data: DataResponse<Any, AFError>) in
            let statusCode = data.response?.statusCode
            
            switch data.result {
            case .success(let value):
                
                print(value)
                
                guard let resultValue = value as? [String:Any] else { return }
                
                    print(resultValue.map({ $0.value }))
                
                if statusCode == 200 {
                    let model = Mapper<Make>().map(JSON: resultValue)
                    completion(.success(model: model!))
                }
            case .failure(let error):
                let errorCode = error._code
                if errorCode == -1009 {
                    let erro = ServerError(msgError: error.localizedDescription, statusCode: errorCode)
                    completion(.noConnection(description: erro))
                } else if errorCode == -1001 {
                    let erro = ServerError(msgError: error.localizedDescription, statusCode: errorCode)
                    completion(.timeOut(description: erro))
                }
            }
        }
    }
}
