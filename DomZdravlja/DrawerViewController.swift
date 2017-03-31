//
//  DrawerViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/23/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit
import KYDrawerController

class DrawerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableViewDrawerOptions: UITableView!
    
    let names = [Constants.View.Main,
                 Constants.View.InfoCenter,
                 Constants.View.News,
                 Constants.View.Scheduling,
                 Constants.View.CheckInsurance,
                 Constants.View.BodyMass,
                 Constants.View.SocialNetworks,
                 Constants.View.Vaccines,
                 Constants.View.MissionAndVision,
                 Constants.View.Departments,
                 Constants.View.ScreeningRectal,
                 Constants.View.ScreeningUterus,
                 Constants.View.ScreeningTeat,
                 Constants.View.Feedback,
                 Constants.View.PatientRights,
                 Constants.View.PatientDuties,
                 Constants.View.Contact,
                 Constants.View.Settings]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewDrawerOptions.delegate = self;
        self.tableViewDrawerOptions.dataSource = self;
        
        self.view.backgroundColor = UIColor.clear
        self.tableViewDrawerOptions.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        self.tableViewDrawerOptions.separatorStyle = .none

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewDrawerOptions.dequeueReusableCell(withIdentifier: "cellDrawer") ?? UITableViewCell()
        
        cell.textLabel?.text = names[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = Constants.Font.ButtonTitle
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var master: MasterViewController?
        if ((self.parent as? KYDrawerController) != nil) {
            let drawer = self.parent as! KYDrawerController
            if ((drawer.childViewControllers[0] as? MasterViewController) != nil ) {
                master = drawer.childViewControllers[0] as? MasterViewController
                master?.load(viewWithType: names[indexPath.row])
            }
            drawer.setDrawerState(.closed, animated: true)
        }
        print("\(indexPath.row)")
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
