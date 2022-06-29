import UIKit
import Foundation
import Alamofire
import ObjectMapper

protocol WorkerDelegate: AnyObject {
    func getMakeData(completion: @escaping (Response<Make>) -> Void)
    func getModelData(makeId: String,
                      completion: @escaping (Response<Model>) -> Void)
    func getVersionData(modelId: String,
                        completion: @escaping (Response<Version>) -> Void)
    func getVehiclesData(page: Int,
                         completion: @escaping (Response<Vehicle>) -> Void)
}

final class Worker: Request, WorkerDelegate {
    
    let network = NetworkParser()
    
    func getMakeData(completion: @escaping (Response<Make>) -> Void) {
        guard let url = URL(string: "\(Endpoints.getEndpoint)Make") else {
            return
        }
        
        network.setupParser(url: url, completion: completion)
    }
    
    func getModelData(makeId: String, completion: @escaping (Response<Model>) -> Void) {
        guard let url = URL(string: "\(Endpoints.getEndpoint)Model?MakeID=\(makeId)") else {
            return
        }
        
        network.setupParser(url: url, completion: completion)
    }
    
    func getVersionData(modelId: String, completion: @escaping (Response<Version>) -> Void) {
        guard let url = URL(string: "\(Endpoints.getEndpoint)Version?ModelID=\(modelId)") else {
            return
        }
        
        network.setupParser(url: url, completion: completion)
    }
    
    func getVehiclesData(page: Int, completion: @escaping (Response<Vehicle>) -> Void) {
        guard let url = URL(string: "\(Endpoints.getEndpoint)Vehicles?Page=\(page)") else {
            return
        }
        
        network.setupParser(url: url, completion: completion)
    }
}
