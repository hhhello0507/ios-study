//
//  NewsModel.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/06.
//

struct NewsModel: Codable, Hashable {
    let resultCode: Int
    let resultMsg: String
    let numOfRows: Int
    let pageNo: Int
    let totalCount: Int
    let items: [NewsModeldeldel]
}

struct NewsModeldeldel: Codable, Hashable {
    let title: String
    let content: String
    let news_url: String
    let thum_url: String
    let broadcast_date: String
}
