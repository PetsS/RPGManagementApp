//
//  EquipmentViewModel.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/10/2022.
//

import Foundation
import SwiftUI

class EquipmentViewModel: ObservableObject, Identifiable {
    
    @Published var data = WeaponData(
        
        weaponId: UUID(),
        
        weaponName: "fegyver név",
        weaponDamage: 0,
        weaponDamageShow: "",
        weaponKe: 0,
        weaponTe: 0,
        weaponVe: 0,
        weaponCe: 0,
        weaponAttack: 0,
        weaponDistance: 0,
        weaponDescription: "",
        weaponMGT: 0,
        
        weaponSelected: false,
        
        //szuro vagofegyverek
        weaponCat1: [
            ("Rövid kard", "k6+1", 9, 12, 14, 0, 1, 0, "A rövid kard 40-60 cm hosszú, egyenes pengéje mindkét oldalon ki van élezve. Gyakran íjászok második fegyvere."),
            ("Hosszú kard", "k10", 6, 14, 16, 0, 1, 0, "A hosszú kard pengéje 60-80 cm-es, egyenes és kétélű. Általában gyalogos katonák fő fegyvere.")
        ],
        weaponCat2: [
        ],
        weaponCat3: [
        ],
        weaponCat4: [
        ],
        weaponCat5: [
        ],
        //Pajzsok
        weaponCat6: [
            ("Kicsi pajzs", "k6", 1, 0, 20, 1, "Kis pajzsnak nevezzük a hozzávetőleg fél méter átmérőjű, általában kerek pajzsokat."),
            ("Közepes pajzs", "k6",  0, 1, 35, 1, "A közepes pajzsok hosszúkásak és a felsőtestet védik, azaz kb. egy méteresek."),
            ("Nagy pajzs", "k6", 0, 5, 50, 1, "A nagy pajzsok embermagasak és a nehézvértezetű lovagok felszereléséhez tartoznak. Gyakran használnak ilyet a számszeríjászok is fedezékként."),
        ],
        
        //sajat fegyverek
        customCat: []

    )
    
    @Published var equipmentData = EquipmentData (
        
        equipmentId: UUID(),
        equipmentName: "Felszerelés név",
        equipmentQty: 0,
        equipmentComm: "",
        equipmentDesc: "",
        
        //ruhazkodas
        equipmentCat1: [
            ("bakancs", 10, "r", "Otromba lábbeli."),
            ("cipő", 1, "e", "Elegáns lábbeli."),
            ("csizma (lovagló)", 2, "e", "Elsősorban lovaglásra alkalmas csizma, magasított sarokkal, keményre vasalt talp, közepesen kényelmes viselet."),
        ],
        
        customEquipmentCat: []
    )
    
    @Published var modifierData = ModifierData (
        
        modifierId: UUID(),
        modifierName: "",
        modifierDamage: 0,
        modifierDamageShow: "",
        modifierKe: 0,
        modifierTe: 0,
        modifierVe: 0,
        modifierCe: 0,
        modifierAttack: 0,
        modifierDistance: 0,
        modifierDescription: "",
        
        //harci helyzet
        modifierCat1 : [
            ("Támadás hátulról", 5, 10, 0, 0, "N/A"),
            ("Támadás félhátulról", 2, 5, 0, 0, "N/A"),
            ("Meglepetésszerű támadás", 0, 30, 0, 10, "N/A"),
            ("Harc magasabbról", 2, 5, 0, 5, "N/A"),
            ("Harc alacsonyabbról", -2, -10, 0, -5, "N/A")
            //...
        ],
        customModifierCat : []
    )
    
    @Published var disadvantageData = DisadvantageData (
        
        disadvantage: 0,
        disadvantageName: "",
       
        //túlerö
        disadvantageCat1: [
            ("3 ellenfél", -5),
            ("4 ellenfél", -10),
            ("5 ellenfél", -15),
            ("6 ellenfél", -20),
            ("7 ellenfél", -25),
            ("8 ellenfél", -30),
        ]
    )
    
    @Published var targetData = TargetData (
        
        targetName: "",
        targetDesc: "",
        targetValue: 0,
        
        //a célpont mozgása
        targetCat1: [
            ("Mozdulatlan", 0, "A célpont mozgása: Mozdulatlan célpontnak minősítjük a helyhez kötött tárgyakat, az őrt álló embereket, a legelésző állatokat, az egyenesen szembejövő vagy távozó alakokat, stb."),
            ("Kiszámítható", -20, "A célpont mozgása: Kiszámítható mozgást végez a lengő inga, a feldobott alma, a gyalogló ember, a változatlan tempóban haladó lovas..."),
            ("Kiszámíthatatlan", -35, "A célpont mozgása: Kiszámíthatatlan a mozgása a harcoló embereknek, a menekülő állatoknak."),
            ("Kitérésre összpontosító", -50, "A célpont mozgása: A találat elkerülésére összpontosít az, aki legfőbb tevékenységeként a rá célzó fegyvert emelő ellenfélre figyel és azon igyekszik, hogy a kiröppenő vesszőt elkerülje.Ez egy harcművész kasztba tartozó esetében mozdulatlan koncentrációt jelent, más kasztok képviselőinél általában kétségbeesett ugrálást."),
        ],
        
        //időjárási viszonyok
        targetCat2: [
            ("Napsütés, szélcsend", 0, desc: "Időjárási viszonyok: Napsütés, szélcsend"),
            ("Szemerkélő eső, szellő", -10, desc: "Időjárási viszonyok: Szemerkélő eső, szellő"),
            ("Gyenge eső, gyenge szél", -30, desc: "Időjárási viszonyok: Gyenge eső, gyenge szél"),
            ("Gyenge köd, eső, erős szél", -50, desc: "Időjárási viszonyok: Gyenge köd, eső, erős szél"),
            ("Sűrű köd, vihar", -70, desc: "Időjárási viszonyok: Sűrű köd, zivatar, viharos szél"),
            ("Egészen sűrű köd, orkán", -100, desc: "Időjárási viszonyok: Egészen sűrű köd, felhőszakadás, orkán")
            
        ],
        
        //célpont mérete
        targetCat3: [
            ("Óriás méret", 30, desc: "A célpont mérete: Óriás"),
            ("Ló méret", 15, desc: "A célpont mérete: Ló"),
            ("Ember méret", 0, desc: "A célpont mérete: Ember"),
            ("Kutya méret", -20, desc: "A célpont mérete: Kutya"),
            ("Dinnye méret", -35, desc: "A célpont mérete: Dinnye"),
            ("Alma méret", -50, desc: "A célpont mérete: Alma"),
            ("Fémpénz méret", -65, desc: "A célpont mérete: Fémpénz")
        ]
        
    )
    
    @Published var armorData = ArmorData (
        
        armorName: "Vértezet név",
        armorMGT: 0,
        armorSFE: 0,
        armorDescription: "",
        armorType: "",
        
        armorCat1: [
            ("Teljes vért (Bronz)", "Bronz", 8, 6, "A teljes vértezet egész testet beborító fémlemezekből áll. A sisak pontosan illeszkedik a nyakvérthez, az arcot rostély védi. Csak posztóvérttel együtt használják, ami a megfelelő kipárnázást biztosítja. \nTeljes vértezetben harcolni, vagy megerőltető tevékenységet végezni legfeljebb 15-20 percig lehet."),
            ("Teljes vért (Abbitacél)", "Abbitacél", 6, 7, "A teljes vértezet egész testet beborító fémlemezekből áll. A sisak pontosan illeszkedik a nyakvérthez, az arcot rostély védi. Csak posztóvérttel együtt használják, ami a megfelelő kipárnázást biztosítja. \nTeljes vértezetben harcolni, vagy megerőltető tevékenységet végezni legfeljebb 15-20 percig lehet."),
            ("Teljes vért (Mithrill)", "Mithrill", 4, 8, "A teljes vértezet egész testet beborító fémlemezekből áll. A sisak pontosan illeszkedik a nyakvérthez, az arcot rostély védi. Csak posztóvérttel együtt használják, ami a megfelelő kipárnázást biztosítja. \nTeljes vértezetben harcolni, vagy megerőltető tevékenységet végezni legfeljebb 15-20 percig lehet.")
        ]
    )
}

func k10() -> Int {
return Int.random(in: 1...10)
}

func k6() -> Int {
return Int.random(in: 1...6)
}

//func weaponCalc(equippedWeapon: String) -> (dam: Int, ke: Int, te: Int, ve: Int, ce: Int, atk: Int, dist: Int) {
//    
//    let k6a = Int.random(in: 1...6)
//    let k6b = Int.random(in: 1...6)
//    let k6c = Int.random(in: 1...6)
//    let k10 = Int.random(in: 1...10)
//    let k3 = Int.random(in: 1...3)
//    
//    var weapon: (dam: Int, ke: Int, te: Int, ve: Int, ce: Int, atk: Int, dist: Int) = (0,0,0,0,0,0,0)
//    
//    if equippedWeapon == "Rövid kard" {
//        
//        weapon = (
//            dam: k6a + 1,
//            ke: 9,
//            te: 12,
//            ve: 14,
//            ce: 0,
//            atk: 1,
//            dist: 0
//        )
//    } else if equippedWeapon == "Hosszú kard" {
//        weapon = (
//            dam: k10,
//            ke: 6,
//            te: 14,
//            ve: 16,
//            ce: 0,
//            atk: 1,
//            dist: 0
//        )
//    }
//    
//    
//    return weapon
//}

