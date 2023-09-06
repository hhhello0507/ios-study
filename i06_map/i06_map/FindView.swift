//
//  HomeView.swift
//  i06_map
//
//  Created by dgsw8th71 on 2023/09/01.
//

import SwiftUI

struct FindView: View {
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        MapView()
            .ignoresSafeArea()
            .safeAreaInset(edge: .top) {
                ZStack {
                    TopBarView()
                        .padding()
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            NowButtonView(isFocus: false)
                        }
                        .padding()
                    }
                }
            }
    }
}

extension FindView {
    class ViewModel: ObservableObject {
        
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
    }
}
