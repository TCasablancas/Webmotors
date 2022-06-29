import UIKit

final class MainListViewController: BaseViewController<MainListView> {
    
    private let reuseIdentifier = "MainListView"
    
    var viewModel: MainListViewModel
    var model = [Vehicle]()
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension MainListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = baseView.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CardViewCell else {
            return UITableViewCell()
        }
        
        let item = model[indexPath.row]
        cell.setupCell(from: item)
        
//        if let returnedModel = model {
//            cell.setupCell(from: returnedModel)
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
}

extension MainListViewController: MainListViewModelDelegate {
    func setupVehicleData(model: Vehicle) {
        self.model.append(model)
        baseView.tableView.reloadData()
    }
}
