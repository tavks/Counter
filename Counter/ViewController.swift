//
//  ViewController.swift
//  Counter
//
//  Created by Vladimir Khramov on 27.12.2024.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var counter: Int = 0 {
        didSet {
            counterLabel.text = "\(counter)"
        }
    }
    
    private var currentTimestamp: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    //This function scrolls the text view content to bottom, so the text view shows the most recent history after user interacts with the buttons
    private func scrollTextViewToBottom() {
        historyTextView.scrollRangeToVisible(NSRange(location: historyTextView.text.count - 1, length: 1))
    }
    
    @IBAction private func minusButtonDidTap(_ sender: Any) {
        if counter == 0 {
            historyTextView.text += "\n\(currentTimestamp): попытка уменьшить значение счётчика ниже 0"
            scrollTextViewToBottom()
            return
        }
        counter -= 1
        historyTextView.text += "\n\(currentTimestamp): значение изменено на -1"
        scrollTextViewToBottom()
    }
    
    @IBAction private func plusButtonDidTap(_ sender: Any) {
        counter += 1
        historyTextView.text += "\n\(currentTimestamp): значение изменено на +1"
        scrollTextViewToBottom()
    }
    
    @IBAction private func resetButtonDidTap(_ sender: Any) {
        counter = 0
        historyTextView.text += "\n\(currentTimestamp): значение сброшено"
        scrollTextViewToBottom()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.isEditable = false
    }
}

