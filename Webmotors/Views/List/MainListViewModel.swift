import UIKit

protocol MainListViewModelDelegate: AnyObject {
    
}

class MainListViewModel {
    weak var delegate: MainListViewModelDelegate?
    let worker: Worker?
    
    init(worker: Worker) {
        self.worker = worker
    }
    
    func setupMake() {
        self.worker?.getMakeData { (response) in
            switch response {
            case .success(let model):
                print("!!!.>>>> MODEL: ", model)
            case .serverError(let error):
                let errorData = "\(error.statusCode), -, \(error.msgError)"
//                output.didGetError(errorData)
                print("Server error: \(errorData) \n")
                break
            case .timeOut(let description):
                print("Server error noConnection: \(description) \n")
//                output.didGetError("Timeout")
                
            case .noConnection(let description):
//                output.didGetError("Offline")
                print("Server error timeOut: \(description) \n")
            }
        }
    }
}
