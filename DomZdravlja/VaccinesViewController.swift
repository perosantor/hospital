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
    
    let names = ["одмах по рођењу, односно у првом месецу живота",
                 "у другом месецу живота",
                 "у трећем месецу живота (одмах после навршеног другог месеца) ",
                 "са три и по месеца",
                 "до шестог месеца живота",
                 "од 12. до навршеног 15. месеца живота",
                 "од 17. до навршеног 24. месеца живота",
                 "у седмог години, пре уписа у први разред основне школе",
                 "у 12. години",
                 "у 14. години, у завршном разреду основне школе",
                 "након навршених 30 година",
                 "након навршених 40 година",
                 "након навршених 50 година",
                 "након навршених 60 година"]
    
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
