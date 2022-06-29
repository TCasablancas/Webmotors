import UIKit

protocol MainListViewModelDelegate: AnyObject {
    func setupVehicleData(model: Vehicle)
}

class MainListViewModel {
    weak var delegate: MainListViewModelDelegate?
    let worker: Worker?
    
    var model = [Vehicle]()
    
    init(worker: Worker) {
        self.worker = worker
    }
    
    func setupVehicleList() {
        worker?.getVehiclesData(page: 1) { [weak self] (response) in
            
            guard let self = self else { return }
            
            switch response {
            case .success(let model):
                self.delegate?.setupVehicleData(model: model)
                
                self.model.append(model)
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
