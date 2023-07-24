//
//  MockData.swift
//  Oruc
//
//  Created by Cenk Donmez on 5.07.2023.
//

import Foundation

struct MockData {
    static let shared = MockData()
    
    private let suggestions: ListSection = {
        .suggestions([.init(title: "Dikkat edilmeli", image: "story-1", desc: "Aralıklı oruç diyetinden faydalanmak için yalnızca aç kalmak yetmez. Beslenme saatleri içinde de yenilen içilen şeylere dikkat edilmesi ve kalori dengesinin sağlanması gerekebilir. Oruç tutulan zamanlarda karbonhidrat ve şekerli gıdaları tüketmemeye çalışmak, rutin beslenme alışkanlıklarından uzaklaşmak ve yapılacak egzersizler aralıklı orucun seyri için önem teşkil edebilir."),
                      .init(title: "Aralıklı Oruçta Egzersiz", image: "story-2", desc: "Aralıklı oruç diyetinde uzun süren açlık zamanlarında egzersiz yapmak zor olabilir. Ancak, özellikle 2 öğün arasında yapılacak hafif egzersizler ve yorucu olmayan spor çalışmaları sürece katkıda bulunup, yağ yakımını hızlandırabilir ve kişinin zinde kalmasını sağlayabilir. Bu egzersizler; hafif tempoda yürüyüş, kardiyo egzersizleri, ağırlık çalışmaları, bisiklet, yoga, ve pilates olabilir."),
                      .init(title: "Aralıklı Oruç Diyeti Listesi", image: "story-3", desc: "Beslenme programında düşük karbonhidrat ve protein içeren gıdalar olmalı. Bunlar; kepekli pirinç, kepekli makarna, bulgur ve posa içerikli tahıllar ( mısır gevreği, yulaf ezmesi vb.), tam buğday ve çavdar unundan yapılmış gıdalar. Kan şekeri dengesini korumak için; ev yapımı yoğurt, süt, ayran, kefir gibi besinler olmalı. Vitamin ve mineral ihtiyacını karşılamak için, mevsimine uygun, taze meyve ve sebzeler de eklenmeli. Protein bakımından zengin ve kişiye tokluk hissi veren; kırmızı et, tavuk, balık, yumurta, baklagiller ve kuruyemişlerle zenginleştirebilirsiniz. Vücudun sıvı ihtiyacını karşılamak için bol su tüketimi önemlidir. Ayrıca hem metabolizmayı çalıştıran hem de kişiye tokluk hissi veren kahve içmek, bunların yanında; çay, bitki çayı, maden suyu gibi içeceklerin tüketilmesi aralıklı oruca fayda sağlayabilir."),
                      .init(title: "Kimler için sakıncalı?", image: "story-4", desc: "Vücut kitle indeksi (VKİ) 20'nin altında olan kişiler, karaciğeri, böbreği, hipoglisemiyi etkileyen hastalıklar gibi kronik sorunlar veya metabolik rahatsızlıklardan muzdarip olanlar, 18 yaş altı çocuklar, yeme bozukluğu olanlar ayrıca hamile ve emziren kadınların aralıklı oruç diyeti yapmaları önerilmemektedir.Tip 2 diyabet, düşük tansiyon hastaları veya ürik asiti yüksek olanlar aralıklı orucu doktor kontrolünde yapmalıdır. Bu diyeti kilo kaybetmek için yapmak isteyenlerin diyete başlamadan önce beslenme ve metabolik durum değerlendirmesi için bir uzmana başvurmasında fayda vardır.")])
    }()
    
    private let about: ListSection = {
        .about([.init(title: "Sabırlı olun", image: "about-1", desc: ""),
                  .init(title: "Oruç öncesi hazırlık yapın", image: "about-2", desc: ""),
                .init(title: "Oruç sonrası sağlıklı beslenin", image: "about-3", desc: ""),
            .init(title: "Aralıklı oruç sizi zinde tutar", image: "about-5", desc: ""),
            .init(title: "Doktorunuza danışın", image: "about-6", desc: "")])
    }()
    
    var pageData: [ListSection] {
        [suggestions, about]
    }
}
