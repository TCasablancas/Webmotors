import UIKit

final class MainListViewController: BaseViewController<MainListView> {
    
    private let reuseIdentifier = "MainListView"
    
    var viewModel: MainListViewModel
    var model: Vehicle?
    
    init(viewModel: MainListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.setupTableView(to: self,
                                dataSource: self,
                                identifier: reuseIdentifier)
        viewModel.setupVehicleList()
    }
}

extension MainListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = baseView.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CardViewCell else {
            return UITableViewCell()
        }
        
        if let returnedModel = model {
            cell.setupCell(from: returnedModel)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
}

extension MainListViewController: MainListViewModelDelegate {
    func setupVehicleData(model: Vehicle) {
        self.model = model
        baseView.tableView.reloadData()
    }
}
