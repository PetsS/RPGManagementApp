//
//  SkillViewModel.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/10/2022.
//

import Foundation
import SwiftUI

class SkillViewModel: ObservableObject, Identifiable {
    
    @Published var data = SkillData(
        
        skillName: "fegyver név",
        skillDescription: "",
        skillCategory: "",
        af: 0,
        mf: 0,
        
        //Harci kepzettsegek
        skillCat1: [
            ("Ökölharc", "Harci képzettség", 3, 15, "A karakter gyakorlott kétkezi verekedő. Nem jön zavarba, ha fegyverét valamely okból nem használhatja (esetleg nincs is nála). \nAz Ökölharc - bár fegyver nélkül űzik - nem hasonlít a harcművészetekre, nem is nyugszik azonos alapokon. Inkább egyfajta Erőn és Ügyességen alapuló, művészetnek semmikép sem nevezhető harcmodor. Az a karakter, aki ismeri az Ökölharc fortélyait, nem szenvedi el a Képzetlen Fegyverforgatásból - ezesetben a puszta kéz képzetlen használatából - eredő hátrányokat, és a küzdelemben mindkét kezét használhatja (kétszer támad). Az Alapfokot és a Mesterfokot kizárólag a puszta ököl sebzésének mértéke különbözteti meg egymástól, az alábbiak szerint: \n\nAf: 1-2 Sp \nMf: 1-6 Sp"),
            ("Birkózás", "Tudományos képzettség", 8, 15, "A képzettség rokon az Ökölharccal, ám a birkózó kezét nem üldözésre, hanem ellenfelének lefogására, leszorítására használja. Ahhoz, hogy ezt megtehesse, természetesen sikeres Támadó Dobást kell tennie. Sebzés nincs, ellenben az áldozat körökre mozgásképtelenné tehető, mialatt támadni sem képes. Ha a képzettség alkalmazója egyszer már megragadta ellenfelét, és erősebb is nála, annak kevés az esélye a szorításból szabadulni. A birkózó minden körben köteles erőpróbát tenni, s az áldozatnak csak akkor nyílik egyáltalán lehetősége a szabadulásra, ha elvéti. Még ilyenkor sincs veszve semmi, mert a lefofott csak akkor menekülhet, ha az ő erőpróbája ellenben sikeres. Ha az áldozat ereje nagyobb a lefogónál, ő tehet minden körben erőpróbát, s ha sikerrel jár, nyomban ki is bontakozik a marasztaló karok közül. Ha a támadás, amivel a birkózó megragadta áldozatát tál- ütés, a lefogott személy a szorításban nagy az eséllyel elveszíti eszméletét. Ez akkor következhet be, ha a birkózó, közvetlen a tűlütést követő körben, sikeres erőpróbát tesz. A képzettség Alapfokát és Mesterfokát látszólag kevés választja el egymástól, de a szakértők tudják, a szakadék óriási. \n\nAf: Az alapfokon képzett karakter, ha fegyveres ellenféllel birkózik, minden támadását -15-tel dobja. \nMf: A Mesterfokon képzett birkózó fegyveres ellenfél ellenében sem kerül hátrányba. A birkózó - hacsak ellenfele nem folyamodik szintén bírózáshoz - Önműködően elveszíti jogát a kezdeményezésre; továbbá a Birkózás képzettség nem alakalmazható harcművész kasztúak ellen. \nA Birkózás legavatotabb gyakorlói általában gladiátorok.")
        ]
    )
}
