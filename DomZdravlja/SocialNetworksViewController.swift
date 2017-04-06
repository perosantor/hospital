//
//  SocialNetworksViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/6/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class SocialNetworksViewController: UIViewController {
    
    @IBOutlet weak var labelUpper: UILabel!
    @IBOutlet weak var labelLower: UILabel!
    
    @IBOutlet weak var buttonTwitter: SocialMediaButtonView!
    @IBOutlet weak var buttonYoutube: SocialMediaButtonView!
    @IBOutlet weak var buttonFacebook: SocialMediaButtonView!
    
    let upperText = "Дом здравља је активан и на најпопуларнијим друштвеним мрежама – Твитеру (Twitter), Фејсбуку (Facebook) и Јутјубу (YouTube). Ово чинимо са циљем да се што је више могуће приближимо становништву и на овакав савремени начин, све са циљем промоције здравог живота, одговарајуће исхране и превенције."
    
    let twitterText = "Твитер је друштвена мрежа – микроблог, настао 2006. године. Од тада је постао веома популаран, како међу приватним, тако и међу пословним корисницима. На овом сајту корисници постављају кратке поруке, твитове (енгл. tweet). Данас су на овој друштвеној мрежи присутне и школе, здравствене установе, различита предузећа, авио-компаније, па чак и владе и председници различитих држава."
    
    let fbText = "Фејсбук је најпопуларнија друштвена мрежа на свету. Са радом је почео 2004. године. Корисницима омогућава да направе свој профил преко кога се могу повезати са другим пријатељима. За пословне кориснике је веома значајан као могућност директне интеракције са корисницима њихових услуга. На нашој страници на Фејсбуку можете пронаћи све информације и актуелности у вези са Домом здравља."
    
    let ytText = "Јутјуб је настао 2005. године, а у међувремену је постао део компаније Гугл и трећи најпосећенији сајт на свету. Овде видео снимке постављају најразличитији корисници – од телевизијских кућа, различитих организација и компанија, до аматера. На каналу Дома здравља можете погледати промотивни филм и друге сличне снимке, као и емисије у којима су наши запослени гостовали."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clear
        
        self.buttonYoutube.loginHandler = self.tap
        self.buttonTwitter.loginHandler = self.tap
        self.buttonFacebook.loginHandler = self.tap
        
        self.buttonTwitter.setTwitterIcon()
        self.buttonTwitter.setSelected(gestureRecognizer: UIGestureRecognizer.init())
        self.labelUpper.text = upperText
        
        self.buttonFacebook.setFacebookIcon()
        self.buttonYoutube.setYoutubeIcon()
        self.labelLower.text = twitterText
        
        Utilities.setSubtitleLabel(self.labelLower)
        Utilities.setSubtitleLabel(self.labelUpper)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tap(tag:Int) -> Void {
        print(tag)
        switch tag {
        case 1:
            self.buttonFacebook.setUnselected()
            self.buttonYoutube.setUnselected()
            self.labelLower.text = twitterText
        case 2:
            self.buttonTwitter.setUnselected()
            self.buttonYoutube.setUnselected()
            self.labelLower.text = fbText
        case 3:
            self.buttonFacebook.setUnselected()
            self.buttonTwitter.setUnselected()
            self.labelLower.text = ytText
        default:
            self.buttonFacebook.setUnselected()
            self.buttonYoutube.setUnselected()
            self.buttonTwitter.setUnselected()
            self.labelLower.text = ""
        }
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
