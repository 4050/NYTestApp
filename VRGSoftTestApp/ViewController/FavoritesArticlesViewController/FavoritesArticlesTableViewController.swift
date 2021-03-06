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
        guard let pageContent = requestArticle[indexPath.row]!.content else { return }
        segueToWebViewController(pageContent: pageContent)
    }
    
    func requestData() {
        requestArticle = articleStorageModel.getActicles()
    }
    
    func segueToWebViewController(pageContent: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let webViewController = storyboard.instantiateViewController(identifier: "WebViewController") as? WebViewController else { return }
        
        webViewController.stringURL = pageContent
        show(webViewController, sender: nil)
    }
}

