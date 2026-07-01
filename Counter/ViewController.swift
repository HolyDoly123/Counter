//
//  ViewController.swift
//  Counter
//
//  Created by Vladimir Rudakov on 01.07.2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Непонятно почему, но при проставлении цвета в storyboard он менялся только после клика на кнопку
        //Поэтому устанавливаю его здесь
        incrementButton.tintColor = .red
    }

    @IBAction func incrementCounter() {
        let newCounter = currentCounter() + 1
        counterLabel.text = "\(newCounter)"
        appendHistory(text: "значение изменено на +1")
    }
    
    @IBAction func decrementCounter() {
        let newCounter = currentCounter() - 1
        if newCounter < 0 {
            appendHistory(text: "попытка уменьшить значение счётчика ниже 0")
        } else {
            counterLabel.text = "\(newCounter)"
            appendHistory(text: "значение изменено на -1")
        }
    }
    
    @IBAction func resetCounter() {
        counterLabel.text = "0"
        appendHistory(text: "значение было сброшено")
    }
    
    private func appendHistory(text: String) {
        let date = getDate()
        historyTextView.text += "\n\(date): \(text)"
        historyTextView.scrollRangeToVisible(NSRange(location: historyTextView.text.count, length: 1))
    }
    
    private func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    private func currentCounter() -> Int {
        Int(counterLabel.text ?? "0") ?? 0
    }
}
