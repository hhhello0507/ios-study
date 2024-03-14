import UIKit
import SnapKit

class StackUIView: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let c = UIScrollView()
        let s = UIStackView()
        view.backgroundColor = .gray
        
        s.backgroundColor = .yellow
        s.axis = .vertical
        s.distribution = .fill
        s.spacing = 0
        let ls = (0..<100).map { _ in UILabel() }
        view.backgroundColor = .black
        ls.forEach { l in
            l.text = "Hello"
            l.textColor = .white
            s.addArrangedSubview(l)
        }
        view.addSubview(c)
        c.addSubview(s)
        c.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalTo(view)
        }
        s.snp.makeConstraints { make in
            make.edges.equalTo(c.contentLayoutGuide)
        }
    }
}
