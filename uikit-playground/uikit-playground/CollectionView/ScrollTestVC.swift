import UIKit

class ScrollTestVC: UIViewController {
    
    private var scrollView: UIScrollView = {
        let s = UIScrollView()
        
        return s
    }()
    
    private var stack: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        return s
    }()
    
    private var labels: [UIView] = {
        (0..<100).map { _ in
            let l = UIView()
            l.backgroundColor = .black
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
            NSLayoutConstraint.activate([
                l.heightAnchor.constraint(equalToConstant: 100)
            ])
        }
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // safeLayoutGuide로 잡으면 safelayout 바깥 쪽은 스크롤 X
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            stack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
        ])
    }
}
