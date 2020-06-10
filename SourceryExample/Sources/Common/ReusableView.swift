import UIKit

protocol ReusableView: AnyObject {}

extension ReusableView where Self: UIView {
	static var reuseIdentifier: String { String(describing: self) }
}

extension UITableViewCell: ReusableView {}
extension UITableViewHeaderFooterView: ReusableView {}

extension UICollectionView: ReusableView {}
extension UICollectionReusableView: ReusableView {}

extension UITableView {
	func register<T: UITableViewCell>(_: T.Type) {
		register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
	}

    func dequeue<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
