import UIKit

final class MainListView: BaseView {
    
    // MARK: - UI
    
    private let mainContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let cardView: CardView = {
        let card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    // MARK: - Initialize
    
    override func initialize() {
        backgroundColor = .white
        clipsToBounds = false
        addSubview(mainContainer)
        mainContainer.addArrangedSubview(cardView)
    }
    
    override func installConstraints() {
        NSLayoutConstraint.activate([
            mainContainer.widthAnchor.constraint(equalTo: widthAnchor),
            mainContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
