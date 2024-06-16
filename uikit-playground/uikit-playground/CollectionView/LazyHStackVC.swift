import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    // Customize your cell's content here
    var label: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel(frame: self.bounds)
        label.textAlignment = .center
        self.contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class LazyHStackViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView!
    let cellIdentifier = "CustomCell"
    let itemCount = 20
    
    private var scrollView = UIScrollView()
    private var stack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        // Create a layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        // Create a UICollectionView
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        view.addSubview(scrollView)
        scrollView.addSubview(stack)
        stack.addArrangedSubview(collectionView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        stack.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CustomCollectionViewCell
        cell.label.text = "\(indexPath.item)"
        cell.backgroundColor = .lightGray
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
