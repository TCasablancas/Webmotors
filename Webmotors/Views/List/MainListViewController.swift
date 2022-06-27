import UIKit

final class MainListViewController: BaseViewController<MainListView> {
    
    var viewModel: MainListViewModel
    
    init(viewModel: MainListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
