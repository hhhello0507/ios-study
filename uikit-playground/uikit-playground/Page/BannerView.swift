import SwiftUI

struct BannerView: View {
    let index: Int = 0
    
    var body: some View {
        Text("Page \(index)")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}
