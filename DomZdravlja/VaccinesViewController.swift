//
//  VaccinesViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/10/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class VaccinesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let names = ["vaccines-title1".localized,
                 "vaccines-title2".localized,
                 "vaccines-title3".localized,
                 "vaccines-title4".localized,
                 "vaccines-title5".localized,
                 "vaccines-title6".localized,
                 "vaccines-title7".localized,
                 "vaccines-title8".localized,
                 "vaccines-title9".localized,
                 "vaccines-title10".localized,
                 "vaccines-title11".localized,
                 "vaccines-title12".localized,
                 "vaccines-title13".localized,
                 "vaccines-title14".localized]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        self.tableView.separatorColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cellVaccine") ?? UITableViewCell()
        
        cell.textLabel?.text = names[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = Constants.Font.ButtonTitle
        cell.backgroundColor = Constants.Color.CustomRed
        cell.selectionStyle = .none
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if ((self.parent as? MasterViewController) != nil ) {
            let master: MasterViewController? = self.parent as? MasterViewController
            master?.addVaccineDetails(category: indexPath.row)
        }
    }

}
