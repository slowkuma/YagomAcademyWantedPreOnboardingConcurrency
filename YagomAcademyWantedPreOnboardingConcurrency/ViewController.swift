//
//  ViewController.swift
//  YagomAcademyWantedPreOnboardingConcurrency
//
//  Created by Kyu Yeol Jeong on 2023/03/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var row1view: ImageRowView!
    @IBOutlet private weak var row2view: ImageRowView!
    @IBOutlet private weak var row3view: ImageRowView!
    @IBOutlet private weak var row4view: ImageRowView!
    @IBOutlet private weak var row5view: ImageRowView!
    
    private var imageTargets = [
        "https://images.unsplash.com/photo-1579353977828-2a4eab540b9a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80",
        "https://images.unsplash.com/photo-1561336313-0bd5e0b27ec8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "https://images.unsplash.com/photo-1616020453784-a24fa9845b05?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1742&q=80",
        "https://images.unsplash.com/photo-1558389157-2e7920dc085c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
        "https://images.unsplash.com/photo-1558386620-41b4aef9fd5a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        _ = [row1view,row2view,row3view,row4view,row5view].enumerated().map { (i, view) in
            view?.imageURL = URL(string: imageTargets[i])
        }
    }

    @IBAction func loadAllImage(_ sender: Any) {
        _ = [row1view,row2view,row3view,row4view,row5view].map { view in
            view?.loadImage(sender)
        }
    }
}

