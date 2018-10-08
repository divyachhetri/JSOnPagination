//
//  NetworkCall.swift
//  JSOnPagination
//
//  Created by Divya Pandit Chhetri on 8/21/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import Foundation

class NetworkCall {
    var pageNumber : Int
    static let shared = NetworkCall(pageNumber: 1)
    private init(pageNumber : Int){
        self.pageNumber = pageNumber
    }
    
    func getData(responseHandler: @escaping (Any?) -> Void) {
    let urlString = "https://newsapi.org/v2/everything?domains=bbc.co.uk,nytimes.com&apiKey=d7f0471d43f74327b096bc720d70689b&page=\(pageNumber)&pageSize=10"
        guard let url = URL(string: urlString) else {
            print("Bad Url")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Error getting data")
                return
            }
            responseHandler(data)
        }.resume()
    }
}
