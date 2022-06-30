import UIKit

final class MainListView: BaseView {
    
    // MARK: - UI
    
    let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = Colors.mainBackground
        table.sectionIndexBackgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let mainContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let spinnerView: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    let spinnerContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let paginatorView: PaginatorView = {
        let paginator = PaginatorView()
        paginator.translatesAutoresizingMaskIntoConstraints = false
        return paginator
    }()
    
    // MARK: - Initialize
    
    override func initialize() {
        backgroundColor = Colors.mainBackground
        clipsToBounds = false
        addSubview(paginatorView)
        addSubview(mainContainer)
        bringSubviewToFront(paginatorView)
        spinnerContainer.addSubview(spinnerView)
        mainContainer.addArrangedSubview(tableView)
        mainContainer.addArrangedSubview(spinnerContainer)
    }
    
    override func installConstraints() {
        NSLayoutConstraint.activate([
            mainContainer.widthAnchor.constraint(equalTo: widthAnchor),
            mainContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableView.leftAnchor.constraint(equalTo: mainContainer.leftAnchor, constant: 16),
            tableView.rightAnchor.constraint(equalTo: mainContainer.rightAnchor, constant: -16),
            tableView.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            tableView.heightAnchor.constraint(equalTo: mainContainer.heightAnchor),
            
            spinnerContainer.widthAnchor.constraint(equalTo: mainContainer.widthAnchor),
            spinnerContainer.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
            spinnerContainer.heightAnchor.constraint(equalToConstant: 100),
            
            spinnerView.widthAnchor.constraint(equalTo: spinnerContainer.widthAnchor),
            spinnerView.heightAnchor.constraint(equalTo: spinnerContainer.heightAnchor)
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
