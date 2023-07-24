//
//  StageViewModel.swift
//  Oruc
//
//  Created by Cenk Donmez on 8.07.2023.
//

import Foundation
final class StageViewModel{
    
    
    
    var stages = [
        Stage(stageTitle: "Kan Şekeri Yükselir", stageInformation: "Orucun ilk saatlerinde kendinizi oldukça normal hissedeceksiniz çünkü vücudunuz düzenli olarak glikojeni parçalama sürecinden geçiyor. Kan şekeriniz yükselir. Pankreasınız enerji için glikozu parçalamak üzere insülin salgılar ve ekstra glikozu sonrası için depolar.", stageTime: "0sa - 2sa"),
        Stage(stageTitle: "Kan Şekeri Düşer", stageInformation: "İnsülinin etkilerinin bir sonucu olarak, kan şekeriniz yükseldikten sonra normale yakın bir seviyeye düşer ve tipik olarak yükselmeye devam etmez çünkü insülin yemekten hemen sonra dolaşım sisteminize iletilir.", stageTime: "2sa - 5sa"),
        Stage(stageTitle: "Kan Şekeri Normale Döner", stageInformation: "Bu aşamada, kan şekeriniz normale döner. Aç hissediyorsanız mideniz size son yemeğinizin üzerinden epey zaman geçtiğini hatırlatıyor ancak aslında o kadar da aç değilsiniz. Açlıktan ölmek mi? Büzüşmek ve kas kütlenizi kaybetmek mi? Bunların hiçbiri olmayacak. Aslında, glikojen rezervleriniz düşmeye başlayacak ve hatta biraz vücut yağınızı kaybedebilirsiniz. Vücudunuz son aldığınız gıdayı sindirmeye devam edecektir. Enerji için depolanmış glikozu kullanmaya başlar ve yakında tekrar yiyecekmişsiniz gibi çalışmaya devam eder.", stageTime: "5sa - 8sa"),
        Stage(stageTitle: "Oruç Moduna Geçiş", stageInformation: "Son yemeğinizden 8 saat sonra, karaciğeriniz son glikoz rezervlerini kullanacaktır. Şimdi vücudunuz, vücudunuzun açlık moduna geçtiğini gösteren glukoneogenez adı verilen bir duruma girer. Çalışmalar, metabolik bir yol olan glukoneogenezin, karbonhidratlar yerine vücut yağından glikoz üretimi ile sonuçlandığını göstermektedir. Kalori yakmanızı arttırır.", stageTime: "8sa - 10sa"),
        Stage(stageTitle: "Yağ Yakıyorsunuz", stageInformation: "Glikojen rezervleriniz tükeniyor! Sonuç olarak, sinirli veya asık olabilirsiniz. Rahatlayın, bu vücudunuzun yağ yaktığının bir işaretidir! Az miktarda glikojen kaldığında, yağ hücreleri (adiposit) yağı kan dolaşımınıza salacaktır. Ayrıca doğrudan karaciğerinize giderler ve vücudunuz için enerjiye dönüştürülürler. Aslında, hayatta kalmak için yağ yakmak için vücudunuzu kandırıyorsunuz.", stageTime: "10sa - 12sa"),
        Stage(stageTitle: "Ketoz Durumundasınız", stageInformation: "Ketoz adı verilen metabolik durumdasınız. Glikojen neredeyse tükenir ve karaciğeriniz yağı, vücudunuz için alternatif bir enerji kaynağı olan keton cisimlerine dönüştürür. Yağ rezervleri kolayca salınır ve tüketilir. Bu nedenle ketoza bazen vücudun yağ yakma modu da denir. Ketoz, daha az enflamatuar yan ürün üretir, bu nedenle kalbinize, metabolizmanıza ve beyninize büyük faydalar sağlar.", stageTime: "12sa - 18sa"),
        Stage(stageTitle: "Yağ Yakma ✚", stageInformation: "Ne kadar uzun süre oruç tutarsanız, ketozisin o kadar derinine gidersiniz. 18 saat itibariyle vücudunuz yağ yakma moduna geçmiştir. Araştırmalar, 12 ila 24 saat aç kaldıktan sonra yağdan sağlanan enerjinin %60 oranında artacağını ve 18 saatten sonra önemli bir artış gösterdiğini gösteriyor. Şimdi:Keton cisimlerinin seviyesi yükselir. Ketonlar, vücudunuza stresli bir ortamda metabolizmasını nasıl daha iyi düzenleyeceğini söyleyen sinyal molekülleri görevi görür.Vücudunuzun iltihap önleyici ve yenilenme süreçleri çalışmaya hazırdır.", stageTime: "18sa - 24sa")]
}
