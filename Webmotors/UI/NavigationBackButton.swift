import UIKit

final class NavigationBackButton: BaseView {
    
    var didTapBack: (() -> Void)?
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "left-arrow"),
                        for: UIControl.State())
        button.addTarget(self,
                         action: #selector(backButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initialize
    
    override func initialize() {
        backgroundColor = .clear
        clipsToBounds = false
        addSubview(backButton)
    }
    
    override func installConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
    
    @objc
    func backButtonTapped() {
        self.didTapBack?()
    }
}
