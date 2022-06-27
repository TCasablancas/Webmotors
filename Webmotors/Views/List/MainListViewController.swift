import UIKit

final class MainListViewController: BaseViewController<MainListView> {
    
    private let reuseIdentifier = "MainListView"
    
    var viewModel: MainListViewModel
    
    init(viewModel: MainListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

extension MainListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = baseView.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CardViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
}

private extension MainListViewController {
    func setupTableView() {
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
        baseView.tableView.register(CardViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
}
