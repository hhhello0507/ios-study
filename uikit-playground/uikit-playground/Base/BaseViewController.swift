import UIKit
import SnapKit

extension UIColor {
    static let background = UIColor()
}


class BaseViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
        configureUI()
        setUpLayout()

    }
    
    func setUpStyle() {
        view.backgroundColor = .background
    }
    
    func configureUI() {
        
    }
    
    func setUpLayout() {
        
    }
    
}

class ViewController: BaseViewController {
    
    var label = UILabel()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUpStyle() {
        super.setUpStyle()
        label.text = "어쩌구~"
    }
    
    override func configureUI() {
        super.configureUI()
        [label, button].forEach {
            view.addSubview($0)
        }
    }
    
    override func setUpLayout() {
        super.setUpLayout()
        label.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(24)
        }
    }
}
