//
//  StoryView.swift
//  i05_navigating_app
//
//  Created by dgsw8th71 on 2023/08/31.
//

import Foundation
import SwiftUI

struct StoryView: View {
    var body: some View {
        NavigationStack {
            StoryPageView(story: story, pageIndex: 0)
        }
    }
}


struct StoryView_Previews: PreviewProvider {

    static var previews: some View {

        StoryView()

    }

}
