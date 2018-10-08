//
//  News.swift
//  JSOnPagination
//
//  Created by Divya Pandit Chhetri on 8/22/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import Foundation
struct News : Decodable {
    let status : String
    let totalResults : Int
    let articles : [Articles]
}
struct Articles : Decodable {
    let title : String
    let url : String
    let urlToImage : String?
}
