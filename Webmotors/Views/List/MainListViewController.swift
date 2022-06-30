import UIKit

final class MainListViewController: BaseViewController<MainListView> {
    
    private let reuseIdentifier = "MainListView"
    
    var viewModel: MainListViewModel
    var model = [Vehicle]()
    var currentPage = 1
    
    init(viewModel: MainListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Webmotors"
        view.backgroundColor = Colors.mainBackground
        baseView.setupTableView(to: self,
                                dataSource: self,
                                identifier: reuseIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.setupVehicleList(currentPage: currentPage)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource and UIScrollViewDelegate

extension MainListViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = baseView.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CardViewCell else {
            return UITableViewCell()
        }
        
        let item = model[indexPath.row]
        cell.setupCell(from: item)
        
        cell.selectedBackgroundView = cell.selectionBackgroundView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetails(model: model[indexPath.row])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (baseView.tableView.contentSize.height - 100 - scrollView.frame.size.height) {
            baseView.tableView.tableFooterView = createSpinner()
            DispatchQueue.main.async {
                self.baseView.tableView.tableFooterView = nil
                self.viewModel.setupVehicleList(currentPage: self.currentPage + 1)
                self.baseView.tableView.reloadData()
            }
        }
    }
}

// MARK: - ViewModelDelegate and Navigation

extension MainListViewController: MainListViewModelDelegate {
    private func navigateToDetails(model: Vehicle) {
        let viewController = DetailViewController(vehicleData: model)
        self.navigationController?.present(viewController, animated: true)
    }
    
    func setupVehicleData(model: Vehicle) {
        self.model.append(model)
        baseView.tableView.reloadData()
    }
    
    private func createSpinner() -> UIView {
        baseView.spinnerView.startAnimating()
        return baseView.spinnerContainer
    }
}
