import UIKit

extension UIBarButtonItem {
    func setupBackButton(title: String = "", image: String) {
        self.title = title
        self.image = UIImage(named: image)
    }
}
