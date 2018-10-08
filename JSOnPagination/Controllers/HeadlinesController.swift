//
//  ViewController.swift
//  JSOnPagination
//
//  Created by Divya Pandit Chhetri on 8/21/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit
import AlamofireImage

class HeadlinesController: UITableViewController {
    var newsArray = [Articles]()
    var loadingMoreData = false
    var pageNumber = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Headlines"
        tableView.register(HeadlineCell.self, forCellReuseIdentifier: "CellId")
        parseJSON()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = newsArray.isEmpty ? 1 : newsArray.count
        return count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! HeadlineCell
        if !newsArray.isEmpty{
            let headline = newsArray[indexPath.row]
             cell.textLabel?.text = headline.title
            if headline.urlToImage != nil {
                if let url = URL(string: headline.urlToImage!){
                    cell.iconImageView.af_setImage(withURL: url)
                }
            }
            else {
                cell.iconImageView.backgroundColor = .blue
            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = WebViewController()
        let item = newsArray[indexPath.row]
        webVC.webUrl = item.url
        navigationController?.pushViewController(webVC, animated: true)
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let count = newsArray.count - 1
        if indexPath.row == count {
            loadMoreData()
            
        }
    }
}

extension HeadlinesController {
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        let contentHeight = scrollView.contentSize.height
//        if offsetY > contentHeight - scrollView.frame.height{
//            if !loadingMoreData{
//                loadingMoreData = true
//                loadMoreData()
//                
//            }
//        }
//    }

    func loadMoreData() {
        pageNumber += 1
        NetworkCall.shared.pageNumber = pageNumber
        parseJSON()
        //loadingMoreData = false
    }
    func parseJSON() {
        NetworkCall.shared.getData { (data) in
            if let data = data as? Data {
                do {
                    let data = try JSONDecoder().decode(News.self, from: data)
                    for article in data.articles {
                        self.newsArray.append(article)
                    }
                    print(self.newsArray.count)
                } catch let error {
                    print("Error decoding", error)
                }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        
    }
}

