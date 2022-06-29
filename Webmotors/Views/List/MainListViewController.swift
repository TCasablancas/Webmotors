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
        title = "Webmotors"
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.red
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        
        baseView.setupTableView(to: self,
                                dataSource: self,
                                identifier: reuseIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.setupVehicleList()
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetails(model: model[indexPath.row])
    }
}

extension MainListViewController: MainListViewModelDelegate {
    func navigateToDetails(model: Vehicle) {
        let viewController = DetailViewController(vehicleData: model)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func setupVehicleData(model: Vehicle) {
        self.model.append(model)
        baseView.tableView.reloadData()
    }
}
