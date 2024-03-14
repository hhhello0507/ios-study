import UIKit
import SnapKit

class StackUIView: UIViewController, UIScrollViewDelegate {
    
    
    private var scroll: UIScrollView = {
        let c = UIScrollView()
        return c
    }()
    
    private var stack: UIStackView = {
        let s = UIStackView()
        
        s.backgroundColor = .yellow
        s.axis = .vertical
        s.distribution = .fill
        s.spacing = 0
        return s
    }()
    
    private var ls: [UILabel] = (0..<100).map { i in
        let l = UILabel()
        l.backgroundColor = .gray
        l.text = "Hello \(i)"
        l.textColor = .white
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(scroll)
        scroll.addSubview(stack)
        setup()
        setupScroll()
        setupLayout()
    }
    
    func setup() {
        scroll.delegate = self
    }
    
    func setupScroll() {
        scroll.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
    }
    
    func setupLayout() {
        
        ls.forEach { l in
            stack.addArrangedSubview(l)
        }
        
        scroll.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalTo(view)
        }
        
        stack.snp.makeConstraints { make in
            make.edges.equalTo(scroll.contentLayoutGuide)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentOffset" {
            if scroll.contentOffset.y > 30 {
                print("Hello")
                ls.forEach {
                    $0.textColor = .yellow
                }
            } else {
                print("not yet")
                ls.forEach {
                    $0.textColor = .red
                }
            }
        }
    }
    
    
    deinit {
        scroll.removeObserver(self, forKeyPath: "contentOffset")
    }
}
