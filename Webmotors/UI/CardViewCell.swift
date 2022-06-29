import UIKit
import Kingfisher

final class CardViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private lazy var mainContainer: UIStackView = {
        let view = UIStackView(arrangedSubviews: [mainImage, dataStackView])
        view.axis = .vertical
        view.backgroundColor = Colors.mainCardBackground
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mainImage: UIImageView = {
        let view = UIImageView()
        view.sizeToFit()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dataStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [mainTitleLabel, subtitleLabel, priceLabel])
        stack.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        stack.layer.cornerRadius = 10
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        installConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(from model: Vehicle) {
        if let url = URL(string: model.image) {
            mainImage.kf.indicatorType = .activity
            mainImage.kf.setImage(with: url)
        } else {
            mainImage.image = UIImage(named: "not-found.png")
        }

        mainTitleLabel.text = "\(model.make) \(model.model)"
        subtitleLabel.text = model.version
        priceLabel.text = "R$ \(model.price)"
    }
}

private extension CardViewCell {
    func setupView() {
        backgroundColor = .white
        clipsToBounds = false
        addSubview(mainContainer)
    }
    
    func installConstraints() {
        NSLayoutConstraint.activate([
            mainContainer.leftAnchor.constraint(equalTo: leftAnchor),
            mainContainer.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            mainContainer.heightAnchor.constraint(equalToConstant: 290),
            
            mainImage.widthAnchor.constraint(equalTo: mainContainer.widthAnchor),
            mainImage.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 180),
            
            dataStackView.leftAnchor.constraint(equalTo: mainContainer.leftAnchor, constant: 15),
            dataStackView.rightAnchor.constraint(equalTo: mainContainer.rightAnchor, constant: -15),
            dataStackView.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 15),
            dataStackView.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: -30)
        ])
    }
}
