import UIKit

extension UIView {
    func embed(subview: UIView, padding: UIEdgeInsets = .zero, ignore: [UIRectEdge] = []) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(subview)
        
        if ignore.contains(.all) {
            return
        }
        
        if ignore.contains(.top) == false {
            let constraint = subview.topAnchor.constraint(equalTo: topAnchor,
                                                          constant: padding.top)
            constraint.identifier = "topAnchor.constraint"
            constraint.isActive = true
        }
        
        if ignore.contains(.right) == false {
            let constraint = subview.rightAnchor.constraint(equalTo: rightAnchor,
                                                            constant: padding.right * -1.0)
            constraint.identifier = "rightAnchor.constraint"
            constraint.isActive = true
        }
        
        if ignore.contains(.bottom) == false {
            let constraint = subview.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                             constant: padding.top)
            constraint.identifier = "bottomAnchor.constraint"
            constraint.isActive = true
        }
        
        if ignore.contains(.left) == false {
            let constraint = subview.leftAnchor.constraint(equalTo: leftAnchor,
                                                           constant: padding.left)
            constraint.identifier = "leftAnchor.constraint"
            constraint.isActive = true
        }
    }
}
