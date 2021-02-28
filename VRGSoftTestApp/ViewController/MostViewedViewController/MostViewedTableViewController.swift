//
//  MostViewedTableViewController.swift
//  VRGSoftTestApp
//
//  Created by Stanislav on 27.02.2021.
//

import UIKit
import SafariServices

class MostViewedTableViewController: UITableViewController {
    
    private let mostViewedModel = MostViewedModel()
    private let articleStorageModel = ArticleStorageModel()
    private var requestArticle = [ArticleModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: L10n.tableViewCellNibName, bundle: nil), forCellReuseIdentifier: L10n.cellIdentifier)
        requestData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestArticle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: L10n.cellIdentifier, for: indexPath) as! ArticleTableViewCell
        let article = requestArticle[indexPath.row]
        cell.delegate = self
        cell.addFaforitesButton.tag = indexPath.row
        cell.titleLabel.text = article.title
        cell.dateLabel.text = article.published_date
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: requestArticle[indexPath.row].url!) else { return }
        segueToSafari(url: url)
    }
    
    func requestData() {
        mostViewedModel.requestData(completion: { (searchResults) in
            self.requestArticle = searchResults!.results
            self.tableView.reloadData()
        })
    }
    
    func segueToSafari(url: URL) {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }

}

extension MostViewedTableViewController: ArticleTableViewCellProtocol {
    
    func didTapFavoritesButton(cell: ArticleTableViewCell) {
        guard let cellTag = tableView.indexPath(for: cell)?.row else { return }
        let article = getArticle(tag: cellTag)
        articleStorageModel.saveArticle(article: article)
        
    }
    
    func getArticle(tag: Int) -> ArticleModel {
        let article = requestArticle[tag]
        return article
    }
}
 
