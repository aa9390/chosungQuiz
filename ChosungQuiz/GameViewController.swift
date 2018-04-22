//
//  GameViewController.swift
//  ChosungQuiz
//
//  Created by SWUCOMPUTER on 2018. 4. 21..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var categoryTitle: UILabel!
    @IBOutlet var levelTitle: UILabel!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var chosungLabel: UILabel!
    @IBOutlet var hintView: UIView!
    @IBOutlet var hintButton: UIButton!
    @IBOutlet var hintLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var indicatorView: UIActivityIndicatorView!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var passButton: UIButton!
    
    var userName: String!
    var categoryName: String!
    var levelName: String!
    var score: Int! = 0
    var scoreString: String!
    var i: Int! = 0 // 배열의 인덱스에 관련된 변수
    
    // 초성, 정답, 힌트 배열 초기화
    var chosungArray: [String] = []
    var answerArray: [String] = []
    var hintArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 상단 view 초기화
        scoreString = String(score)
        indicatorView.startAnimating()
        categoryTitle.text = "카테고리 : " + categoryName
        levelTitle.text = "난이도 : " + levelName
        infoLabel.text = userName + "님의 점수 : " + scoreString + "점"
        hintView.isHidden = true
        
        // 카테고리에 따라서 퀴즈의 배열이 바뀜.
        switch categoryName {
        case "영화":
            if(levelName=="Easy") {
                chosungArray = ["ㄷㄷㄷ", "ㅅㅇㅇㅊㅇ", "ㅂㅌㄹ", "ㄱㅇㅇㄱ", "ㅋㄹㅅ"]
                answerArray = ["도둑들", "살인의추억", "베테랑", "겨울왕국", "클래식"]
                hintArray = ["마카오 박을 찾아라!", "향숙이?", "어이가 없네?", "렛잇고", "손예진의 멜로영화"]
            }
            else if (levelName=="Hard") {
                chosungArray = ["ㅅㄹㄴㅇㅇㅈㅈㄷ", "ㅂㅁㅈㅈㅇㅊㅅㄹ", "ㅎㅇㅇㅇㅈㅇㄴㅅ", "ㅌㄹ", "ㅇㅌㅅㅌㄹ"]
                answerArray = ["시라노연애조작단", "백만장자의첫사랑", "하울의움직이는성", "토르", "인터스텔라"]
                hintArray = ["은밀한 연애작전", "이연희, 현빈이 주인공", "미야자키 하야오", "천둥의 신", "Stay..."]
            }
        case "음식":
            if(levelName=="Easy") {
                chosungArray = ["ㅂㄷㅉㄱ", "ㅇㅁㄹㅋㄴ", "ㅉㅃ", "ㄸㅂㅇ", "ㅎㄷㄱ"]
                answerArray = ["부대찌개", "아메리카노", "짬뽕", "떡볶이", "핫도그"]
                hintArray = ["라면사리는 최소 2개", "쌉사름한 맛!", "짜장면", "맵지만 중독돼!", "포장마차"]
            }
            else if (levelName=="Hard") {
                chosungArray = ["ㅇㅈㅇ", "ㅎㄹㅇㄷㅊㅋ", "ㅋㅈㅂ", "ㅇㅁㄹㅇㅅ", "ㅇㅅㅅ"]
                answerArray = ["오징어", "후라이드치킨", "콩자반", "오므라이스", "옥수수"]
                hintArray = ["휴게소에서 먹어야 제맛", "언제나 옳다", "어린아이들은 싫어해요", "밥위에 계란을", "수염차"]
            }
        case "사자성어":
            if (levelName=="Easy") {
            chosungArray = ["ㄱㄱㅎㅎ", "ㅈㅅㅅㅇ", "ㅇㅅㅇㅈ", "ㅇㅁㅂㅁ", "ㄷㅂㅈㄱ"]
            answerArray = ["가가호호", "작심삼일", "일석이조", "오매불망", "독불장군"]
            hintArray = ["축복이 가득하기를", "이번해도 역시", "1+1", "님이 오시기를", "고집이 센 사람"]
            }
            else if (levelName=="Hard") {
                chosungArray = ["ㅁㅈㅈㅊ", "ㄴㅂㄷㅂ", "ㅁㅇㅈㅇ", "ㅂㅂㅂㅈ", "ㅁㅅㅇㅇ"]
                answerArray = ["만전지책", "노발대발", "무용지용", "백발백중", "독불장군"]
                hintArray = ["완벽한 계획", "화내지 마", "하이고~쓸데없다", "~ 명중이야!", "물체와 나는 하나"]
            }
        default: break
        }
        
        // 화면 진입 시 초성 배열의 첫 항이 보이도록
        chosungLabel.text = chosungArray[i]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
        return true
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        if (i<answerArray.count) {
        // 패스 버튼을 눌렀을 때
            if (sender==passButton) {
                hintView.isHidden = true
                score = score - 15
                scoreString! = String(score!)
                infoLabel.text = userName + "님의 점수 : " + scoreString + "점"
                progressBar.progress += 0.2

                // 다음 초성으로 이동
                i = i + 1
                if(i<answerArray.count) {
                    chosungLabel.text = chosungArray[i]
                }
                else {
                    chosungLabel.text = "끝났습니다. \n점수를 확인하세요."
                    indicatorView.stopAnimating()
                }
            }
            
        // 정답 버튼을 눌렀을 때
            if (sender==okButton) {
                hintView.isHidden = true
                
                // 정답을 입력하지 않았을 때
                if (inputTextField.text == "") {}
                    
                // 정답이 맞았을 때
                else if(inputTextField.text == answerArray[i]) {
                    score = score + 10
                    scoreString! = String(score!)
                    inputTextField.text = ""
                    progressBar.progress += 0.2
                    infoLabel.text = userName + "님의 점수 : " + scoreString + "점"
                    hintView.isHidden = true

                    // 다음 초성으로 이동
                    i = i + 1
                    if(i<answerArray.count) {
                        chosungLabel.text = chosungArray[i]
                    }
                    else {
                        chosungLabel.text = "끝났습니다. \n점수를 확인하세요."
                        indicatorView.stopAnimating()
                    }
                }
                // 정답이 틀렸을 때
                else if (inputTextField.text != answerArray[i]){
                    score = score - 10
                    scoreString! = String(score!)
                    infoLabel.text = userName + "님의 점수 : " + scoreString + "점"
                }
            }
            // 힌트 버튼을 눌렀을 때
            if (sender==hintButton) {
                if(hintView.isHidden) {
                    hintView.isHidden = false
                    score = score - 5
                    scoreString! = String(score!)
                    hintLabel.text = hintArray[i]
                    infoLabel.text = userName + "님의 점수 : " + scoreString + "점"
            }
        }
    }
    }
}

