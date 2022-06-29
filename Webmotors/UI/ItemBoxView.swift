import UIKit

final class ItemBoxView: BaseView {
    // MARK: - UI
    
    private let mainContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = Colors.itemBoxBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconView, mainLabel, titleLabel])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito-ExtraLight", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito-ExtraBold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialize
    
    override func initialize() {
        backgroundColor = .white
        clipsToBounds = false
        addSubview(mainContainer)
        mainContainer.addSubview(mainStack)
    }
    
    override func installConstraints() {
        NSLayoutConstraint.activate([
            mainContainer.widthAnchor.constraint(equalToConstant: 100),
            mainContainer.heightAnchor.constraint(equalToConstant: 90),
            
            mainStack.widthAnchor.constraint(equalTo: mainContainer.widthAnchor, constant: -20),
            mainStack.heightAnchor.constraint(equalTo: mainContainer.heightAnchor, constant: -20),
            mainStack.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor),
            
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.heightAnchor.constraint(equalToConstant: 30),
            
            mainLabel.widthAnchor.constraint(equalTo: widthAnchor),
        ])
    }
    
    func setupBox(icon: String, label: String, title: String) {
        self.iconView.image = UIImage(named: icon)
        self.mainLabel.text = label
        self.titleLabel.text = title
    }
}
