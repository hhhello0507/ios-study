import Combine
import Foundation

open class BaseViewModel: ObservableObject {
    var subscriptions = Set<AnyCancellable>()
    
    public init() {}
}
