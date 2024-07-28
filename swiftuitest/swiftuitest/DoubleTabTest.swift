//
//  DoubleTabTest.swift
//  swiftuitest
//
//  Created by hhhello0507 on 7/25/24.
//

import SwiftUI

struct DoubleTabTest: View {
    @State var size = CGSize.zero
    var body: some View {
        VStack {
            Text("WOW")
//            GeometryReader { geo in
//                MenuButtonRepresentable()
//                    .fixedSize(horizontal: false, vertical: false)
//                    .frame(width: geo.size.width, height: geo.size.height)
//                    .background(.red)
//                    .onAppear {
//                        if geo.size != .zero {
//                            size = geo.size
//                        }
//                    }
//            }
//            .frame(width: size.width, height: size.height)
            Button {
                print("outter")
            } label: {
                Button {
                    print("inner")
                } label: {
                    Text("BTN")
                }
                .padding()
                .onTapGesture {
                    
                }
            }
            .padding()
            Button {
                print("outer")
            } label: {
                Menu {
                    Button("inner") {}
                } label: {
                    Text("Menu")
                }
            }
            Button {
                print("outer")
            } label: {
                Button {
                    print("middle")
                } label: {
                    Menu {
                        Button("inner") {}
                    } label: {
                        Text("Menu")
                    }
                }
            }
            
            
//                MenuButtonRepresentable()
//    //                .frame(width: 10, height: 10)
//    //                .fixedSize()
//                    .fixedSize()
//                    .previewLayout(.sizeThatFits)
//                    .background(.red)
            Text("WOW")
        }
//        Button {
//            print("outer")
//        } label: {
//            Button {
//                print("inner")
//            } label: {
//                Text("BTN")
//            }
//            .padding()
//            .background(.red)
//        }
//        .padding(16)
//        .background(.blue)
//        Button {
//            print("outer")
//        } label: {
//            Menu {
//                Button("inner") {}
//            } label: {
//                Text("BTN")
//            }
//            .padding()
//            .background(.red)
//            .onTapGesture {
//                print("tab gesture")
//            }
//        }
//        .padding(16)
//        .background(.blue)
    }
}
import UIKit

class MenuButtonViewController: UIViewController {
    let menuButton: UIButton = {
        let button = UIButton()
        button.setTitle("Menu", for: .normal)
        button.menu = UIMenu(options: .displayInline, children: [
            UIAction(title: "Fuck") { _ in }
        ])
        button.setTitleColor(.blue, for: .normal)
        button.showsMenuAsPrimaryAction = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        menuButton.addAction(UIAction { _ in
//            self.menuButton.menu?.replacingChildren([
//                UIAction(title: "Fuck") { _ in }
//            ])
//        }, for: .menuActionTriggered)
        view.addSubview(menuButton)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
//        view.sizeToFit()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
//        print(menuButton.intrinsicContentSize)
        view.bounds.size = menuButton.intrinsicContentSize
    }
}

struct MenuButtonRepresentable: UIViewControllerRepresentable {
    
    private let vc = MenuButtonViewController()
    
    func makeUIViewController(context: Context) -> MenuButtonViewController {
        return vc
    }

    func updateUIViewController(_ uiViewController: MenuButtonViewController, context: Context) {}
    
    func sizeThatFits(_ proposal: ProposedViewSize, uiViewController: MenuButtonViewController, context: Context) -> CGSize? {
        return vc.view.bounds.size
    }
}

#Preview {
    DoubleTabTest()
}
