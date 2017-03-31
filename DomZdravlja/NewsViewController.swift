//
//  NewsViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/24/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let xibName = "NewsTableViewCell"
    let cellId = "cellNews"
    
    var dataSourceArray:[News] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: xibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)

        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.separatorStyle = .none
        
        CommunicationService.sharedInstace.fetchNews { (newsArray, errorMessage) in
            if let newsArray = newsArray {
                if newsArray.count > 0 {
                    self.dataSourceArray = newsArray
                    self.tableView.reloadData()
                }
            }
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NewsTableViewCell! = self.tableView.dequeueReusableCell(withIdentifier: cellId) as! NewsTableViewCell
        
        cell.labelText.text = self.dataSourceArray[indexPath.row].content
        cell.labelTitle.text = self.dataSourceArray[indexPath.row].title
        
//        cell.textLabel?.text = names[indexPath.row]
//        cell.textLabel?.textColor = UIColor.white
//        cell.textLabel?.font = Constants.Font.ButtonTitle
//        cell.backgroundColor = UIColor.clear
//        cell.selectionStyle = .none
        
        return cell
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
