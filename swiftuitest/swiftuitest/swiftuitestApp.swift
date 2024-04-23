import SwiftUI
import Alamofire
import Flow

enum ViewType {
    case A
}

@main
struct SwiftuitestApp: App {
    @State var views = NavigationPath()
    let colors: [Color] = [
        .blue,
        .orange,
        .green,
        .yellow,
        .brown,
        .mint,
        .indigo,
        .cyan,
        .gray,
        .pink
    ]

    var body: some Scene {
        WindowGroup {
            VStack {
                HFlow(itemSpacing: 20, rowSpacing: 30) {
                    ForEach(colors + colors, id: \.description) { color in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(color.gradient)
                            .frame(width: Double.random(in: 40...60), height: 50)
                    }
                }
            }
        }
    }
}

struct TextWrapper: UIViewRepresentable {
    var text: String
    var fontSize: CGFloat
    var textStyle: UIFont.TextStyle
    var lineSpacing: CGFloat
    
    init(_ text: String, fontSize: CGFloat, textStyle: UIFont.TextStyle, lineSpacing: CGFloat) {
        self.text = text
        self.fontSize = fontSize
        self.textStyle = textStyle
        self.lineSpacing = lineSpacing
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isSelectable = true
        textView.dataDetectorTypes = .link
        textView.backgroundColor = .clear
        
        var font = UIFont.preferredFont(forTextStyle: .body)
        
        let metrics = UIFontMetrics(forTextStyle: textStyle)
        font = metrics.scaledFont(for: font)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .paragraphStyle: paragraphStyle
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        textView.attributedText = attributedString
        
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        textView.textContainerInset = .zero
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        textView.text = text
        textView.sizeToFit()
        textView.layoutIfNeeded()
    }
}


enum ViewType2 {
    case B, C
}

struct A: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text("A")
            HStack {
                Button {
                    path.append(ViewType2.B)
                } label: {
                    Text("B")
                }
                Button {
                    path.append(ViewType2.C)
                } label: {
                    Text("C")
                }
            }
        }
        .navigationDestination(for: ViewType2.self) {
            switch $0 {
            case .B: B()
            case .C: C()
            }
        }
    }
}

struct B: View {
    var body: some View {
        Text("B")
    }
}

struct C: View {
    var body: some View {
        Text("C")
    }
}
