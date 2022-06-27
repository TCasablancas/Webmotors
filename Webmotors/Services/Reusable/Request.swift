import UIKit
import Alamofire

class Request {
    let alamofireManager: Session = {
        let configure = URLSessionConfiguration.default
        configure.timeoutIntervalForRequest = 1000
        configure.timeoutIntervalForResource = 1000
        return Session(configuration: configure)
    }()
}
