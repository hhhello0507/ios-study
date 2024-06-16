import SwiftUI

struct HorizontalDropdownTest: View {
    var menuList = ["a", "b", "c", "d", "e"]
    @State var selectedMenu = "a"
    @State var showMenu = false
    
    var body: some View {
        //        if #available(iOS 17.0, *) {
        //            Menu {
        //                ControlGroup {
        //                    Menus(selectedMenu: $selectedMenu, menuList: menuList)
        //                }
        //                .controlGroupStyle(.palette)
        //                .controlSize(.mini)
        //                .menuActionDismissBehavior(.enabled)
        //            } label: {
        //                Text("야삐")
        //            }
        //        } else {
        Button {
            withAnimation {
                showMenu = true
            }
        } label: {
            Text("야삐")
        }
        .overlay {
            if showMenu {
                ZStack {
                    HStack(spacing: 10) {
                        Menus(selectedMenu: $selectedMenu, showMenu: $showMenu, menuList: menuList)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .onTapGesture {
                        withAnimation {
                            showMenu = false
                        }
                    }
                    Button {
                        showMenu = false
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundStyle(Color.gray)
                    }
                }
                .padding(.bottom, 108)
            }
        }
    }
}

struct Menus: View {
    @Binding var selectedMenu: String
    @Binding var showMenu: Bool
    var menuList: [String]
    
    var body: some View {
        ForEach(menuList, id: \.self) { menu in
            Button {
                selectedMenu = menu
                showMenu = false
            } label: {
                Image(menu)
                    .resizable()
                    .frame(width: 28, height: 28)
            }
        }
    }
}
