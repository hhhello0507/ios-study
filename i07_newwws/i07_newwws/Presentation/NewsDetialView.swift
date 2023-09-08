//
//  NewsDetialView.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/07.
//

import SwiftUI

struct NewsDetialView: View {
    let url: String
    var body: some View {
        WebView(urlToLoad: url)
    }
}
