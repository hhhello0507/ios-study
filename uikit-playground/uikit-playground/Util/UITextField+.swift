import UIKit

extension UITextField {
    
    enum InnerPadding {
        case left
        case right
        case horizontal
        case vertical
    }
    
    func innerPadding(for innerPadding: InnerPadding, width: CGFloat) {
        if innerPadding == .left || innerPadding == .horizontal {
            let paddingView = UIView(frame: .init(x: 0, y: 0, width: width, height: self.frame.height))
            self.leftView = paddingView
            self.leftViewMode = ViewMode.always
        }
        if innerPadding == .right || innerPadding == .vertical {
            let paddingView = UIView(frame: .init(x: 0, y: 0, width: width, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = ViewMode.always
        }
    }
}
