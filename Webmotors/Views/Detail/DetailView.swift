import UIKit

final class DetailView: BaseView {
    var didTapBackButton: (() -> Void)?
    
    // MARK: - UI
    
    private lazy var mainContainer: UIStackView = {
        let view = UIStackView(arrangedSubviews: [topContainer, bottomContainer])
        view.axis = .vertical
        view.backgroundColor = Colors.mainCardBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bottomContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let paddingContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [backButton])
        stack.spacing = 10
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("VOLTAR", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 20
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initialize
    
    override func initialize() {
        backgroundColor = Colors.mainCardBackground
        clipsToBounds = false
        addSubview(mainContainer)
        topContainer.addSubview(mainTitleLabel)
        topContainer.addSubview(mainImageView)
        topContainer.bringSubviewToFront(mainTitleLabel)
        bottomContainer.addSubview(paddingContainer)
        paddingContainer.addSubview(bottomStack)
    }
    
    override func installConstraints() {
        NSLayoutConstraint.activate([
            mainContainer.widthAnchor.constraint(equalTo: widthAnchor),
            mainContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            topContainer.widthAnchor.constraint(equalTo: mainContainer.widthAnchor),
            topContainer.heightAnchor.constraint(equalToConstant: 320),
            
            mainTitleLabel.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: 30),
            mainTitleLabel.leftAnchor.constraint(equalTo: mainContainer.leftAnchor, constant: 30),
            
            mainImageView.widthAnchor.constraint(equalTo: topContainer.widthAnchor),
            mainImageView.heightAnchor.constraint(equalTo: topContainer.heightAnchor),
            
            bottomContainer.widthAnchor.constraint(equalTo: mainContainer.widthAnchor),
            bottomContainer.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: 40),
            
            paddingContainer.leftAnchor.constraint(equalTo: bottomContainer.leftAnchor, constant: 20),
            paddingContainer.rightAnchor.constraint(equalTo: bottomContainer.rightAnchor, constant: -20),
            paddingContainer.topAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: 20),
            paddingContainer.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor, constant: -20),
            
            backButton.widthAnchor.constraint(equalTo: paddingContainer.widthAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc
    func backButtonTapped() {
        self.didTapBackButton?()
    }
    
    func setupDetailsData(model: Vehicle) {
        mainTitleLabel.text = "\(model.make) \(model.model)"
        
        guard let url = URL(string: model.image) else { return }
        
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                mainImageView.image = image
            }
        } else {
            mainImageView.image = UIImage(named: "not-found.png")
        }
    }
}
