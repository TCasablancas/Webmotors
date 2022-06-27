import UIKit

protocol MainListViewModelDelegate: AnyObject {
    
}

class MainListViewModel {
    weak var delegate: MainListViewModelDelegate?
}
