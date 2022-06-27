import UIKit

final class CardView: BaseView {
    // MARK: - UI
    
    private let mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    // MARK: - Initialize
    
    override func initialize() {
        backgroundColor = .lightGray
        clipsToBounds = false
        addSubview(mainContainer)
    }
    
    override func installConstraints() {
        NSLayoutConstraint.activate([
            mainContainer.widthAnchor.constraint(equalTo: widthAnchor, multiplier: -32),
            mainContainer.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
