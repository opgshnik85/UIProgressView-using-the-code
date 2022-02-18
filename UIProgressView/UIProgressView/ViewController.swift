//
//  ViewController.swift
//  UIProgressView
//
//  Created by MacBook on 08.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
   private var myProgressView = UIProgressView()
   private var myButton = UIButton()
   private var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createProgressView(myProgressView)
        createButton(myButton)
        createTimer()
    }
    
    //MARC: - Создаем Таймер
    private func createTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 1,
                                       target: self,
                                       selector: #selector(updateProgressView),
                                       userInfo: nil, repeats: true)
        
    }
    
    //MARK: - Создаем selector
    @objc func updateProgressView() {
        if myProgressView.progress != 1.0 {
            myProgressView.progress += 0.1 / 1.0
        }else if myProgressView.progress == 1.0 {
            UIView.animate(withDuration: 0.7) {
                self.myButton.alpha = 1
                self.myButton.setTitle("СТАРТ", for: .normal)
                self.myTimer.invalidate()
            }
        }
    }
    
    //MARC: - Создаем UIProgressView
    private func createProgressView(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x,
                                    y: view.center.y,
                                    width: 200, height: 50)
        progressView.setProgress(0.0, animated: false)
        progressView.progressTintColor = UIColor.green
        progressView.trackTintColor = UIColor.red
        progressView.center = view.center
        view.addSubview(progressView)
    }
    //MARC: - Создаем UIButton
    private func createButton(_ button: UIButton) {
        button.frame = CGRect(x: view.bounds.size.width / 3.1,
                              y: view.center.y + 100,
                              width: 150, height: 50)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 12
        button.alpha = 0.2
        button.setTitle("ЗАГРУЗКА...", for: .normal)
        button.setTitleColor(.white, for: .normal)
        view.addSubview(button)
        
    }
}

