//
//  ViewController.swift
//  iOS_Study_B
//
//  Created by 박지윤 on 2023/09/28.
//
import UIKit

import SnapKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    // MARK: - Properties
    var player: AVAudioPlayer!
    var timer: Timer!
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00:00"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .blue
        
        return label
    }()
    let playbutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "button_play"), for: .normal)
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        return button
    }()
    let playSlider:UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .red
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureSubviews()
        makeConstraints()
        
        initializePlayer()
    }
    
    
    func configureSubviews() {
        view.addSubview(timeLabel)
        view.addSubview(playbutton)
        view.addSubview(playSlider)
    }
    
    func makeConstraints() {
        timeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        playbutton.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(timeLabel.snp.top).offset(-20)
        }
        playSlider.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.top.equalTo(timeLabel.snp.bottom).offset(20)
            make.width.equalTo(200)

        }
        
    }
    
    // MARK: - Methodes
    // MARK: Custom Methods
    @objc func playButtonTapped() {
        playbutton.isSelected.toggle()
        playbutton.setImage(UIImage(named: "button_pause"), for: .selected)
        if playbutton.isSelected {
                    self.player?.play()
                    self.makeAndFireTimer()
                } else {
                    self.player?.pause()
                    self.invalidateTimer()
                }
    }
    
    @objc func sliderValueChanged() {
        self.updateTimeLabelText(time: TimeInterval(playSlider.value))
                if playSlider.isTracking { return }
                self.player.currentTime = TimeInterval(playSlider.value)
    }
    
    func initializePlayer() {
            guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
                print("음원 파일 에셋을 가져올 수 없습니다.")
                return
            }

            do {
                try self.player = AVAudioPlayer(data: soundAsset.data)
                self.player.delegate = self
            } catch let error as NSError {
                print("플레이어 초기화 실패")
                print("코드 : \(error.code), 메세지: \(error.localizedDescription)")
            }

            self.playSlider.maximumValue = Float(self.player.duration)
            self.playSlider.minimumValue = 0
            self.playSlider.value = Float(self.player.currentTime)
        }

        func updateTimeLabelText(time: TimeInterval) {
            let minute: Int = Int(time/60)
            let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
            let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
            
            let timeText: String = String(format: "%02ld:%02ld:%02ld", minute, second, milisecond)
            
            self.timeLabel.text = timeText
        }

        func makeAndFireTimer() {
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] (timer: Timer) in
                
                if self.playSlider.isTracking { return }
                
                self.updateTimeLabelText(time: self.player.currentTime)
                self.playSlider.value = Float(self.player.currentTime)
            })
            self.timer.fire()
        }

        func invalidateTimer() {
            self.timer.invalidate()
            self.timer = nil
        }
    
}
