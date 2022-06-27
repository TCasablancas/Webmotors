import UIKit

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
//        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 10
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dataStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [mainTitleLabel, subtitleLabel])
        stack.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        stack.layer.cornerRadius = 10
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "Honda CR-V"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.text = "Lorem ipsum dolor sit amet..."
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
            
            dataStackView.widthAnchor.constraint(equalTo: mainContainer.widthAnchor),
            dataStackView.topAnchor.constraint(equalTo: mainImage.bottomAnchor),
            dataStackView.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor)
        ])
    }
}
