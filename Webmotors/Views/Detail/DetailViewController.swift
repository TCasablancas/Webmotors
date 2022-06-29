import UIKit

final class DetailViewController: BaseViewController<DetailView> {
    
    var vehicleData: Vehicle
    
    init(vehicleData: Vehicle) {
        self.vehicleData = vehicleData
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }
}

private extension DetailViewController {
    func setupNavigationBar() {
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.setupBackButton(image: "left-arrow")
    }
    
    func setupView() {
        self.view.backgroundColor = Colors.mainCardBackground
        baseView.setupDetailsData(model: vehicleData)
    }
}
