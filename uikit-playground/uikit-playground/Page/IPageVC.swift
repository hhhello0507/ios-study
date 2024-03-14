import UIKit
import SwiftUI

class IPageVC: UIViewController {
    
    private var banner: UIHostingController = {
        let h = UIHostingController(rootView: BannerView())
        h.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        return h
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(banner)
        view.addSubview(banner.view)
        banner.didMove(toParent: self)
        banner.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            banner.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            banner.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            banner.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
}
