import UIKit

final class CardView: BaseView {
    // MARK: - UI
    
    private let mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.mainCardBackground
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initialize
    
    override func initialize() {
        backgroundColor = .white
        clipsToBounds = false
        addSubview(mainContainer)
    }
    
    override func installConstraints() {
        NSLayoutConstraint.activate([
            mainContainer.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            mainContainer.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            mainContainer.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
