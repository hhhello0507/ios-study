import UIKit
import SnapKit

class ScrollTestVC: UIViewController {
    
    private var scrollView: UIScrollView = {
        let s = UIScrollView()
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    private var stack: UIStackView = {
        let s = UIStackView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.axis = .vertical
        s.distribution = .fill
        s.spacing = 0
        return s
    }()
    
    private var labels: [UIView] = {
        (0..<100).map { _ in
            let l = UIView()
            l.backgroundColor = .yellow
            l.translatesAutoresizingMaskIntoConstraints = false
            let a = UILabel()
            a.text = "HEllo"
            a.textColor = .white
            l.addSubview(a)
            return l
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stack)
        
        labels.forEach { l in
            stack.addArrangedSubview(l)
            l.snp.makeConstraints { make in
                make.height.equalTo(100)
            }
        }
        
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.bottom.equalTo(view.layoutMarginsGuide)
        }
        
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
