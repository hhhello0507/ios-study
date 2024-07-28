import SwiftUI

struct AlertPresenter<C:View>: View {
    
    @ObservedObject private var alertProvider = AlertProvider()
    
    private let content: () -> C
    
    init(@ViewBuilder content: @escaping () -> C) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            content()
                .environmentObject(alertProvider)
            AlertView(
                isPresent: $alertProvider.showAlert,
                title: alertProvider.title,
                message: alertProvider.message
            ) {
                alertProvider.showAlert = false
            }
        }
    }
}

struct AlertView: View {
    
    @Binding var isPresent: Bool
    @State private var scaleEffect: CGFloat = 1.2
    @State private var opacity = 0.0
    
    let title: String
    let message: String?
    let dismiss: () -> Void
    
    var body: some View {
        Group {
            if isPresent || opacity > 0 {
                Color.black.opacity(0.2).ignoresSafeArea()
                    .onTapGesture {
                        dismiss()
                    }
                VStack {
                    Spacer()
                    VStack {
                        Text(title)
                        if let message = message {
                            Text(message)
                        }
                        Button("OK") {
                            dismiss()
                        }
                    }
                    .frame(width: 264, height: 100)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: Color.black.opacity(0.06), radius: 12, y: 4)
                    .onChange(of: isPresent) { isPresent in
                        withAnimation(.easeOut(duration: 0.2)) {
                            opacity = isPresent ? 1 : 0
                        }
                        if isPresent {
//                            withAnimation(.spring(response: 0.3, dampingFraction: 0.9, blendDuration: 0)) {
                            withAnimation(.easeOut(duration: 0.3)) {
                                scaleEffect = 1
                            }
                        } else {
                            withAnimation(.easeOut(duration: 0.2)) {
                                scaleEffect = 1.2
                            }
                        }
                    }
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.3)) {
                            opacity = 1
                        }
//                        withAnimation(.spring(response: 0.3, dampingFraction: 0.9, blendDuration: 0)) {
                        withAnimation(.easeOut(duration: 0.2)) {
                            scaleEffect = 1.0
                        }
                    }
                    .scaleEffect(scaleEffect)
                    Spacer()
                }
            }
        }
        .opacity(opacity)
    }
}
