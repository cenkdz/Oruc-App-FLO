//
//  HomeVM.swift
//  Oruc
//
//  Created by Cenk Donmez on 5.07.2023.
//

import Foundation
import UIKit

final class HomeVM {
    // Observable objects
    var overTimeTimer: FTimer!
    
    var timer: FTimer?
    
    var timerData: FastingTimer?
    
    var progress: ObservableObj<TimeInterval?> = ObservableObj(nil)
    
    var program: ObservableObj<FProgram?> = ObservableObj(nil)
    
    var scenario: ObservableObj<FScenario?> = ObservableObj(nil)
    
    let defaults = UserDefaults.standard

    
    let stages = [
        Stage(stageTitle: "İlk saatler", stageInformation: "Orucun ilk saatlerinde kendinizi oldukça normal hissedeceksiniz çünkü vücudunuz düzenli olarak glikojeni parçalama sürecinden geçiyor. Kan şekeriniz yükselir. Pankreasınız enerji için glikozu parçalamak üzere insülin salgılar ve ekstra glikozu sonrası için depolar.", stageTime: "0sa - 2sa"),
        Stage(stageTitle: "Kan şekeri 📈", stageInformation: "İnsülinin etkilerinin bir sonucu olarak, kan şekeriniz yükseldikten sonra normale yakın bir seviyeye düşer ve tipik olarak yükselmeye devam etmez çünkü insülin yemekten hemen sonra dolaşım sisteminize iletilir.", stageTime: "2sa - 5sa"),
        Stage(stageTitle: "Kan şekeri 📉", stageInformation: "Bu aşamada, kan şekeriniz normale döner. Aç hissediyorsanız mideniz size son yemeğinizin üzerinden epey zaman geçtiğini hatırlatıyor ancak aslında o kadar da aç değilsiniz. Açlıktan ölmek mi? Büzüşmek ve kas kütlenizi kaybetmek mi? Bunların hiçbiri olmayacak. Aslında, glikojen rezervleriniz düşmeye başlayacak ve hatta biraz vücut yağınızı kaybedebilirsiniz. Vücudunuz son aldığınız gıdayı sindirmeye devam edecektir. Enerji için depolanmış glikozu kullanmaya başlar ve yakında tekrar yiyecekmişsiniz gibi çalışmaya devam eder.", stageTime: "5sa - 8sa"),
        Stage(stageTitle: "Glukoneogenez 🍽️", stageInformation: "Son yemeğinizden 8 saat sonra, karaciğeriniz son glikoz rezervlerini kullanacaktır. Şimdi vücudunuz, vücudunuzun açlık moduna geçtiğini gösteren glukoneogenez adı verilen bir duruma girer. Çalışmalar, metabolik bir yol olan glukoneogenezin, karbonhidratlar yerine vücut yağından glikoz üretimi ile sonuçlandığını göstermektedir. Kalori yakmanızı arttırır.", stageTime: "8sa - 10sa"),
        Stage(stageTitle: "Yağ Yakıyorsunuz 🔥", stageInformation: "Glikojen rezervleriniz tükeniyor! Sonuç olarak, sinirli veya asık olabilirsiniz. Rahatlayın, bu vücudunuzun yağ yaktığının bir işaretidir! Az miktarda glikojen kaldığında, yağ hücreleri (adiposit) yağı kan dolaşımınıza salacaktır. Ayrıca doğrudan karaciğerinize giderler ve vücudunuz için enerjiye dönüştürülürler. Aslında, hayatta kalmak için yağ yakmak için vücudunuzu kandırıyorsunuz.", stageTime: "10sa - 12sa"),
        Stage(stageTitle: "Ketoz Başladı 👏", stageInformation: "Ketoz adı verilen metabolik durumdasınız. Glikojen neredeyse tükenir ve karaciğeriniz yağı, vücudunuz için alternatif bir enerji kaynağı olan keton cisimlerine dönüştürür. Yağ rezervleri kolayca salınır ve tüketilir. Bu nedenle ketoza bazen vücudun yağ yakma modu da denir. Ketoz, daha az enflamatuar yan ürün üretir, bu nedenle kalbinize, metabolizmanıza ve beyninize büyük faydalar sağlar.", stageTime: "12sa - 18sa"),
        Stage(stageTitle: "Yağ yakma ✚", stageInformation: "Ne kadar uzun süre oruç tutarsanız, ketozisin o kadar derinine gidersiniz. 18 saat itibariyle vücudunuz yağ yakma moduna geçmiştir. Araştırmalar, 12 ila 24 saat aç kaldıktan sonra yağdan sağlanan enerjinin %60 oranında artacağını ve 18 saatten sonra önemli bir artış gösterdiğini gösteriyor. Şimdi:Keton cisimlerinin seviyesi yükselir. Ketonlar, vücudunuza stresli bir ortamda metabolizmasını nasıl daha iyi düzenleyeceğini söyleyen sinyal molekülleri görevi görür.Vücudunuzun iltihap önleyici ve yenilenme süreçleri çalışmaya hazırdır.", stageTime: "18sa - 24sa")]
    
    @objc func timerSelector(){
        progress.value = Date.now.timeIntervalSince((defaults.object(forKey: "startDate") as? Date) ?? Date())
        //print(progress.value)
        if Date.now.timeIntervalSince((timer?.endDate)!) >= 0{
            stopTimer()
            startOverTimeTimer()
        }
    }
    
    // Timers
    func startTimer(program: FProgram){
        if let startDate = defaults.object(forKey: "startDate"){
            timer = FTimer(timer: Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerSelector), userInfo: nil, repeats: true), startDate: startDate as? Date, endDate: (startDate as? Date)!.addingTimeInterval(program.rawValue), isInvalidated: false, didFinish: false, program: program, scenario: nil, type: nil)
        }else{
            defaults.set(Date(), forKey: "startDate")
            defaults.set(Date().addingTimeInterval(program.rawValue), forKey: "endDate")
            timer = FTimer(timer: Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerSelector), userInfo: nil, repeats: true), startDate: Date(), endDate: Date().addingTimeInterval(program.rawValue), isInvalidated: false, didFinish: false, program: program, scenario: nil, type: nil)
            
        }
        
        scenario.value = .fTimerStarted
        NotificationManager.shared.setUpStageNotifications()
    }
    
    func stopTimer(){
        if Date.now.timeIntervalSince((defaults.object(forKey: "endDate") as? Date) ?? Date()) >= 0{
            timer?.timer?.invalidate()
            scenario.value = .fTimerEndedByItself
            
        }else{
            timer?.timer?.invalidate()
            scenario.value = .fTimerEndedByUser
            
        }
        
        timer?.timer?.invalidate()
        NotificationManager.shared.cancelNotifications()
        
            
    }
    func resetTimer(){
        timer?.startDate = nil
        timer?.endDate = nil
        progress.value = nil
        defaults.set(nil, forKey: "startDate")
        defaults.synchronize()
    }
    
    func resetOvertimeTimer(){
        overTimeTimer?.startDate = nil
        overTimeTimer?.endDate = nil
        progress.value = nil
        defaults.set(nil, forKey: "overTimeStartDate")
        defaults.synchronize()
    }
    
    func startOverTimeTimer(){
        
        NotificationManager.shared.scheduleTINotification(subtitle: "Zamanlayiciyi durdurmayi unuttun mu?", timeInterval: 10.0)
        
        if let overtimeStartDate = defaults.object(forKey: "overtimeStartDate"){
            overTimeTimer = FTimer(timer: Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(overTimerSelector), userInfo: nil, repeats: true), startDate: overtimeStartDate as? Date, endDate: nil, isInvalidated: false, didFinish: false, program: nil, scenario: nil, type: .OverTimeTimer)
        }else{
            
            overTimeTimer = FTimer(timer: Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(overTimerSelector), userInfo: nil, repeats: true), startDate: Date(), endDate: nil, isInvalidated: false, didFinish: false, program: nil, scenario: nil, type: .OverTimeTimer)
            defaults.set(Date(), forKey: "overtimeStartDate")
        }
        scenario.value = .fTimeRunningOvertime
    }
    
    func stopOverTimeTimer(){
        overTimeTimer.timer?.invalidate()
        overTimeTimer?.startDate = nil
        overTimeTimer?.endDate = nil
        progress.value = nil
    }
    
    @objc func overTimerSelector(){
        progress.value = Date.now.timeIntervalSince(overTimeTimer.startDate!)
        
    }
    
    func timeString(time:TimeInterval) -> String {
        return String(format:"%02i:%02i:%02i", Int(time) / 3600, Int(time) / 60 % 60, Int(time) % 60)
    }
    
    func getProgramDifficulty() -> FProgram{
        
        if let difficulty = CoreDataManager.shared.getUserData().first?.programDifficulty{
            switch difficulty{
            case 0:
                return .sixteen
            case 1:
                return .eighteen
            case 2:
                return .twenty
            default:
                return .sixteen
            }
        }
        return .sixteen
    }
    
}
