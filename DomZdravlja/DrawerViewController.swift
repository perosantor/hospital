//
//  DrawerViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/23/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableViewDrawerOptions: UITableView!
    
    let names = [Constants.DrawerButtonTitle.MainPage,
                 Constants.DrawerButtonTitle.InfoCenter,
                 Constants.DrawerButtonTitle.News,
                 Constants.DrawerButtonTitle.Scheduling,
                 Constants.DrawerButtonTitle.CheckInsurance,
                 Constants.DrawerButtonTitle.BodyMass,
                 Constants.DrawerButtonTitle.SocialNetworks,
                 Constants.DrawerButtonTitle.Vaccines,
                 Constants.DrawerButtonTitle.MissionAndVision,
                 Constants.DrawerButtonTitle.Departments,
                 Constants.DrawerButtonTitle.ScreeningRectal,
                 Constants.DrawerButtonTitle.ScreeningUterus,
                 Constants.DrawerButtonTitle.ScreeningTeat,
                 Constants.DrawerButtonTitle.Feedback,
                 Constants.DrawerButtonTitle.PatientRights,
                 Constants.DrawerButtonTitle.PatientDuties,
                 Constants.DrawerButtonTitle.Contact,
                 Constants.DrawerButtonTitle.Settings]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewDrawerOptions.delegate = self;
        self.tableViewDrawerOptions.dataSource = self;
        
        self.tableViewDrawerOptions.backgroundColor = UIColor.black
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
        print("")
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
