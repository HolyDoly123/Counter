//
//  ViewController.swift
//  Counter
//
//  Created by Vladimir Rudakov on 01.07.2026.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    
    @IBOutlet private weak var historyTextView: UITextView!
    
    // MARK: - Properties
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()
    
    private var currentCounter: Int {
        Int(counterLabel.text ?? "0") ?? 0
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions

    @IBAction private func incrementButtonTapped() {
        let newCounter = currentCounter + 1
        counterLabel.text = "\(newCounter)"
        appendHistory(text: "значение изменено на +1")
    }
    
    @IBAction private func decrementButtonTapped() {
        let newCounter = currentCounter - 1
        if newCounter < 0 {
            appendHistory(text: "попытка уменьшить значение счётчика ниже 0")
        } else {
            counterLabel.text = "\(newCounter)"
            appendHistory(text: "значение изменено на -1")
        }
    }
    
    @IBAction private func resetCounterButtonTapped() {
        counterLabel.text = "0"
        appendHistory(text: "значение было сброшено")
    }
    
    // MARK: - Private Methods
    
    private func appendHistory(text: String) {
        let date = currentDateString()
        historyTextView.text += "\n\(date): \(text)"
        historyTextView.scrollRangeToVisible(NSRange(location: historyTextView.text.count, length: 1))
    }
    
    private func currentDateString() -> String {
        return dateFormatter.string(from: Date())
    }
}
