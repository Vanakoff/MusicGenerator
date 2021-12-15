//
//  QuestionsViewController.swift
//  MusicGenerator
//
//  Created by Andrey Vanakoff on 13/12/2021.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionProgressView: UIProgressView!
    
    //Возможно придется переделать аутлеты с СтекВью на целиком каждую Вью, тк я так их создал.
    //Удалить аутлеты на СтекВью
    
    @IBOutlet var singleQuestionsView: UIView!
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleQuestionsView: UIView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedQuestionsView: UIView!
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.maximumValue = answerCount
            rangedSlider.value = answerCount / 2
        }
    }
    
    
    //MARK: Model Instance
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    private var answersChosen: [Answer] = []

    //MARK: Settings
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    //MARK: Actions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.answers = answersChosen
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[buttonIndex]
        answersChosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    
    @IBAction func multipleAnswerButtonPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    
    @IBAction func rangedAnswerButtonPressed() {
        let index = lrintf(rangedSlider.value)
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    

}
//MARK: Extensiones

extension QuestionsViewController {
    
    private func updateUI() {
        // Hide Stacks
        for questionsView in [singleQuestionsView, multipleQuestionsView, rangedQuestionsView] {
            questionsView?.isHidden = true
        }
        // Get Current Question
        let currentQuestion = questions[questionIndex]
        // Set Current question for Question Label
        questionLabel.text = currentQuestion.title
        // Calculate Progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        // Set progress for Progress View
        questionProgressView.setProgress(totalProgress, animated: true)
        // Set navigation title (question number in title)
        title = "Question № \(questionIndex + 1) from \(questions.count)"
        
        showCurrentAnswers(for: currentQuestion.type)
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single:
            showSingleQuestinesView(with: currentAnswers)
        case .multiple:
            showMultipleQuestionsView(with: currentAnswers)
        case .ranged:
            showRangedQuestionsView(with: currentAnswers)
        }
    }
    
    private func showSingleQuestinesView(with answers: [Answer]) {
        singleQuestionsView.isHidden.toggle()
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    private func showMultipleQuestionsView(with answers: [Answer]) {
        multipleQuestionsView.isHidden.toggle()
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    private func showRangedQuestionsView(with answers: [Answer]) {
        rangedQuestionsView.isHidden.toggle()
        
        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        } else {
            performSegue(withIdentifier: "showResult", sender: nil)
        }
    }
}
