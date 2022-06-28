import UIKit



final class MainListView: BaseView {
    
    // MARK: - UI
    
    let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.separatorInset = .zero
        return table
    }()
    
    private let mainContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initialize
    
    override func initialize() {
        backgroundColor = .white
        clipsToBounds = false
        addSubview(mainContainer)
        mainContainer.addArrangedSubview(tableView)
    }
    
    override func installConstraints() {
        NSLayoutConstraint.activate([
            mainContainer.widthAnchor.constraint(equalTo: widthAnchor),
            mainContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableView.leftAnchor.constraint(equalTo: mainContainer.leftAnchor, constant: 16),
            tableView.rightAnchor.constraint(equalTo: mainContainer.rightAnchor, constant: -16),
            tableView.heightAnchor.constraint(equalTo: mainContainer.heightAnchor)
        ])
    }
    
    func setupTableView(to delegate: UITableViewDelegate,
                        dataSource: UITableViewDataSource,
                        identifier: String) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.register(CardViewCell.self,
                           forCellReuseIdentifier: identifier)
    }
}
