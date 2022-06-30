import UIKit

protocol MainListViewModelDelegate: AnyObject {
    func setupVehicleData(model: Vehicle)
}

class MainListViewModel {
    weak var delegate: MainListViewModelDelegate?
    let worker: Worker?
    var isPaginating = false
    var currentPage = 1
    var model = [Vehicle]()
    
    init(worker: Worker) {
        self.worker = worker
    }
    
    func setupVehicleList() {
        worker?.getVehiclesData(page: currentPage) { [weak self] (response) in
            
            guard let self = self else { return }
            
            switch response {
            case .success(let model):
                self.delegate?.setupVehicleData(model: model)
                self.model.append(model)
                
            case .serverError(let error):
                let errorData = "\(error.statusCode), -, \(error.msgError)"
                print("Server error: \(errorData) \n")
                break
            case .timeOut(let description):
                print("Server error noConnection: \(description) \n")
                
            case .noConnection(let description):
                print("Server error timeOut: \(description) \n")
            }
        }
    }
    
    func isPaginating(_ pagination: Bool) {
        self.isPaginating = pagination ? true : false
    }
}
