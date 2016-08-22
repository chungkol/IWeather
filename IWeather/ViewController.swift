//
//  ViewController.swift
//  IWeather
//
//  Created by Chung on 8/22/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isTypeC = true
    
    @IBOutlet weak var imType: UIImageView!
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var lbTemp: UILabel!
    
    @IBOutlet weak var lbType: UILabel!
    
    @IBOutlet weak var lbCity: UILabel!
    
    @IBOutlet weak var lbQuote: UILabel!
    
    
    var quotes = ["Fire is a good servant but a bad master","The grass is always greener on the other side of the fence","When in the Rome, do as the Romans do","Old friends and old wine are best"]
    var backgroundImage = ["Blood", "Moon" , "Sun"]
    
    var citys = ["Courtneyfurt" ,"South Wilford" , "East Rosendo"]
    
    var imageTypes = ["ion-group", "moon-group", "sun-group"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: "changeTypeTemp:")
        lbType.addGestureRecognizer(tapGesture)
        view.addGestureRecognizer(tapGesture)
        randomInfo()
}
    func changeTypeTemp(sender:UITapGestureRecognizer){
        if isTypeC {
            convertCToF(Double(lbTemp.text!)!)
        }else{
             convertFToC(Double(lbTemp.text!)!)
        }
        isTypeC = !isTypeC
        print(isTypeC)
        
    }
   

    @IBAction func btnRefresh(sender: UIButton) {
        randomInfo()
    }
    
    func tempRandom() -> Double {
        return Double(arc4random_uniform(10) + 22) + Double(arc4random()) / Double(INT32_MAX)
    }
    func getTemp(){
        let randomNumber = String(format: "%2.1f", tempRandom())
        lbTemp.text = randomNumber
    }
    func randomInfo(){
        
        let cityIndex = Int(arc4random_uniform(UInt32(citys.count)))
        lbCity.text = citys[cityIndex]
        
        let quoteIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        lbQuote.text = quotes[quoteIndex]
        
        let bgIndex = Int(arc4random_uniform(UInt32(backgroundImage.count)))
        background.image = UIImage.init(named: backgroundImage[bgIndex])
        
        imType.image = UIImage.init(named: imageTypes[bgIndex])
        getTemp()
    }
    func convertCToF(tempInC:Double) {
        let fahrenheit = (tempInC * 9.0/5.0) + 32.0
        lbType.text = "F"
        let result = String(format: "%2.1f", fahrenheit)
        lbTemp.text = String(result)
    }
    func convertFToC(tempInF:Double) {
        let celsius = (tempInF - 32.0) * (5.0/9.0)
        lbType.text = "C"
        let result = String(format: "%2.1f", celsius)
        lbTemp.text = String(result)

    }

}

