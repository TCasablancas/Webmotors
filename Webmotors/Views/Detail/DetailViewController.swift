import UIKit

final class DetailViewController: BaseViewController<DetailView> {
    
    var vehicleData: Vehicle
    
    init(vehicleData: Vehicle) {
        self.vehicleData = vehicleData
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes"
        setupNavigationBar()
        setupView()
    }
}

private extension DetailViewController {
    func setupNavigationBar() {
        let item = UIBarButtonItem(customView: baseView.navigationBackButton)
        navigationItem.leftBarButtonItem = item
    }
    
    func setupView() {
        self.view.backgroundColor = Colors.mainCardBackground
        baseView.setupDetailsData(model: vehicleData)
        
        baseView.didTapBackButton = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
            print("Dismiss Detail was tapped!")
        }
        
        baseView.navigationBackButton.didTapBack = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
            print("Navigation top back was tapped!")
        }
    }
    
    @objc
    func backButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
