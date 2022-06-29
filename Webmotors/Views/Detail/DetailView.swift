import UIKit

final class DetailView: BaseView {
    // MARK: - UI
    
    private lazy var mainContainer: UIStackView = {
        let view = UIStackView(arrangedSubviews: [topContainer])
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topContainer: UIView = UIView()
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = Colors.mainCardBackground
        return imageView
    }()
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialize
    
    override func initialize() {
        backgroundColor = .white
        clipsToBounds = false
        addSubview(mainContainer)
        topContainer.addSubview(mainTitleLabel)
        topContainer.addSubview(mainImageView)
    }
    
    override func installConstraints() {
        NSLayoutConstraint.activate([
            mainContainer.widthAnchor.constraint(equalTo: widthAnchor),
            mainContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            topContainer.widthAnchor.constraint(equalTo: mainContainer.widthAnchor),
            topContainer.widthAnchor.constraint(equalToConstant: 320),
            
            mainTitleLabel.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: 30),
            mainTitleLabel.leftAnchor.constraint(equalTo: mainContainer.leftAnchor, constant: 30),
            
            mainImageView.widthAnchor.constraint(equalTo: mainContainer.widthAnchor),
            mainImageView.heightAnchor.constraint(equalTo: mainContainer.heightAnchor)
        ])
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
