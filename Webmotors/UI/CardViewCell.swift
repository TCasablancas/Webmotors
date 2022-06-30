import UIKit
import Kingfisher

final class CardViewCell: UITableViewCell {
    
    // MARK: - UI
    
    private lazy var mainContainer: UIStackView = {
        let view = UIStackView(arrangedSubviews: [imageContainer, dataStackView])
        view.axis = .vertical
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let selectionBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let imageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mainImage: UIImageView = {
        let view = UIImageView()
        view.sizeToFit()
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dataStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [mainTitleLabel, subtitleLabel, priceLabel])
        stack.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        stack.layer.cornerRadius = 10
        stack.axis = .vertical
        stack.spacing = 4
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito-ExtraBold", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito-Medium", size: 14)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito-ExtraBold", size: 20)
        label.textColor = .red
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
        guard let url = URL(string: model.image) else { return }
        
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                mainImage.image = image
            }
        } else {
            mainImage.image = UIImage(named: "not-found.png")
        }

        mainTitleLabel.text = "\(model.make) \(model.model)"
        subtitleLabel.text = model.version
        
        var price = model.price
        price.insert(".", at: price.index(price.startIndex, offsetBy: 2))
        
        priceLabel.text = "R$ \(price)"
    }
}

private extension CardViewCell {
    func setupView() {
        backgroundColor = .clear
        clipsToBounds = false
        addSubview(mainContainer)
        imageContainer.addSubview(mainImage)
    }
    
    func installConstraints() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            mainContainer.leftAnchor.constraint(equalTo: leftAnchor),
            mainContainer.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            mainContainer.heightAnchor.constraint(equalToConstant: 290),
            
            imageContainer.widthAnchor.constraint(equalTo: mainContainer.widthAnchor, constant: -12),
            imageContainer.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: 6),
            imageContainer.leftAnchor.constraint(equalTo: mainContainer.leftAnchor, constant: 6),
            imageContainer.heightAnchor.constraint(equalToConstant: 180),
            
            mainImage.widthAnchor.constraint(equalTo: imageContainer.widthAnchor),
            mainImage.heightAnchor.constraint(equalTo: imageContainer.heightAnchor),
            
            dataStackView.leftAnchor.constraint(equalTo: mainContainer.leftAnchor, constant: 15),
            dataStackView.rightAnchor.constraint(equalTo: mainContainer.rightAnchor, constant: -15),
            dataStackView.topAnchor.constraint(equalTo: mainImage.bottomAnchor),
            dataStackView.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: -30),
            
            mainTitleLabel.topAnchor.constraint(equalTo: dataStackView.topAnchor, constant: 8),
            mainTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            priceLabel.bottomAnchor.constraint(equalTo: dataStackView.bottomAnchor, constant: -15)
        ])
    }
}
