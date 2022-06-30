import UIKit

final class PaginatorView: BaseView {
    // MARK: - UI
    
    private let mainContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialize
    
    override func initialize() {
        backgroundColor = Colors.mainCardBackground
        clipsToBounds = false
        addSubview(mainContainer)
        mainContainer.addSubview(mainLabel)
    }
    
    override func installConstraints() {
        NSLayoutConstraint.activate([
            mainContainer.widthAnchor.constraint(equalToConstant: 220),
            mainContainer.heightAnchor.constraint(equalToConstant: 30),
            mainContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)
        ])
    }
}
