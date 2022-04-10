//
//  OrderConfirmationViewController.swift
//  guided project restaurant
//
//  Created by Владислав Левченко on 10.04.2022.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    var timer = Timer()
    var timeRemaining = 0
    let minutesToPrepare: Int
    @IBOutlet var progressBar: UIProgressView!
    
    @IBOutlet var confirmationLabel: UILabel!
    
    
    @IBAction func unwindToOrderList(segue: UIStoryboardSegue) {
        if segue.identifier == "dismissConfirmation" {
            MenuController.shared.order.menuItems.removeAll()
        }
    }
    init?(coder: NSCoder, minutesToPrepare: Int) {
        self.minutesToPrepare = minutesToPrepare
        super.init(coder: coder)
        
           }
    
    @objc func setProgressBar() {
        // increment the counter
        print("Updating", timeRemaining, minutesToPrepare*60, Float(timeRemaining)/Float(minutesToPrepare*60))
        timeRemaining += 1
        progressBar.setProgress(Float(timeRemaining)/Float(minutesToPrepare*60), animated: false)
        if (timeRemaining == minutesToPrepare) {
            timer.invalidate()
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        progressBar.progress = 0.0
        confirmationLabel.text = "Your order will be ready in \(minutesToPrepare) minutes."
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setProgressBar), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
