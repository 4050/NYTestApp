//
//  FavoritesArticlesTableViewController.swift
//  VRGSoftTestApp
//
//  Created by Stanislav on 27.02.2021.
//

import UIKit
import SafariServices

class FavoritesArticlesTableViewController: UITableViewController {
    
    private let articleStorageModel = ArticleStorageModel()
    private var requestArticle = [ManagedArticle?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: L10n.tableViewCellNibName, bundle: nil), forCellReuseIdentifier: L10n.cellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        requestData()
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestArticle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: L10n.cellIdentifier, for: indexPath) as! ArticleTableViewCell
        let article = requestArticle[indexPath.row]
        cell.addFaforitesButton.isEnabled = false
        cell.addFaforitesButton.isHidden = true
        cell.titleLabel.text = article?.title
        cell.dateLabel.text = article?.published_date
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: requestArticle[indexPath.row]!.url!) else { return }
        segueToSafari(url: url)
    }
    
    func requestData() {
        requestArticle = articleStorageModel.getActicles()
    }
    
    func segueToSafari(url: URL) {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
    
    
    
}

