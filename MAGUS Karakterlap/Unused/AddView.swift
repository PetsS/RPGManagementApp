//
//  AddView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 10/09/2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    
    @State private var name = ""
    @State private var primaryCaste = "Harcos"
    @State private var secondaryCaste = "Harcos"
    @State private var race = "Ember"
    @State private var alignment = "Rend"
    @State private var religion = ""
    @State private var level = 1
    @State private var charDescription = ""

    @State private var xp = 0
    
    @State private var strength = 0
    @State private var speed = 0
    @State private var agility = 0
    @State private var endurance = 0
    @State private var health = 0
    @State private var beauty = 0
    @State private var intelligence = 0
    @State private var willpower = 0
    @State private var astral = 0
    
    @FocusState private var keyboardIsFocused: Bool
    
    @State private var primaryCastes : [String] = ["Harcos", "Szerencsevadász", "Pap", "Harcművész", "Mágiahasználó"]
    @State private var warriorCastes : [String] = ["Harcos", "Gladiátor", "Fejvadász", "Lovag", "Amazon", "Barbár", "Bajvívó"]
    @State private var adventurerCastes : [String] = ["Tolvaj", "Bárd"]
    @State private var priestCastes : [String] = ["Pap", "Paplovag", "Szerzetes", "Sámán"]
    @State private var martialCastes : [String] = ["Harcművész", "Kardművész"]
    @State private var mageCastes : [String] = ["Boszorkány", "Boszorkánymester", "Tűzvarázsló", "Varázsló"]
    @State private var races : [String] = ["Amund", "Dzsenn", "Ember", "Elf", "Félelf", "Khál", "Törpe", "Udvari ork", "Wier"]
    @State private var alignments : [String] = ["Rend", "Káosz", "Élet", "Halál"]

    @State private var isKfTapped : (strength: Bool, speed: Bool, agility: Bool, endurance: Bool, health: Bool, beauty: Bool, intelligence: Bool, willpower: Bool, astral: Bool) = (false,false,false,false,false,false,false,false,false)
    
    @State private var showDeleteAlert: Bool = false
    
//    @State private var properties = ["Erő","Gyorsaság","Ügyesség","Állóképesség","Egészség","Szépség","Intelligencia","Akaraterő","Asztrál"]
    
    var isTrashDisabled: Bool {
        if
            strength > 0 ||
            speed > 0 ||
            agility > 0 ||
            endurance > 0 ||
            health > 0 ||
            beauty > 0 ||
            intelligence > 0 ||
            willpower > 0 ||
            astral > 0 {
            return false
        }
        return true
    }
    
    var hasValidEntry: Bool {
        if name.isEmpty {
            return false
        }
        return true
    }
    
    var body: some View {
        NavigationView {
            List {
                Group {
                    TextField("Név", text: $name)
                        .onChange(of: name) { newValue in
                            name = String(newValue.prefix(18))
                        }
                        .focused($keyboardIsFocused)
                        .onSubmit {
                            keyboardIsFocused = false
                        }
                    Picker("Főkaszt", selection: $primaryCaste) {
                        ForEach(primaryCastes, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Alkaszt", selection: $secondaryCaste) {
                        ForEach(castesSelection(), id: \.self) { race in
                            Text(race)
                        }
                    }
                    Picker("Faj", selection: $race) {
                        ForEach(races, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Jellem", selection: $alignment) {
                        ForEach(alignments, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Vallás", text: $religion)
                        .onChange(of: religion) { newValue in
                            religion = String(newValue.prefix(18))
                        }
                        .focused($keyboardIsFocused)
                        .onSubmit {
                            keyboardIsFocused = false
                        }
                    Picker("Szint", selection: $level) {
                        ForEach(1..<14, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    Section ("Karakter rövid leírása"){
                        TextEditor(text: $charDescription)
                    }
                    .focused($keyboardIsFocused)
                    .onSubmit {
                        keyboardIsFocused = false
                    }
                }
                
// start of Properties SECTION
                Group {
                    Section (
                        header:
                            HStack {
                                Text("Értékek")
                                Spacer()
                                Image(systemName: "trash")
                                    .foregroundColor(!isTrashDisabled ? .black : .gray)
                                    .onTapGesture {
                                        showDeleteAlert = true
                                    }
                                    .disabled(isTrashDisabled)
                            }) {
                        HStack {
                            Text("Erő: ")
                            TextField("Erő", value: $strength, format: .number)
                                .focused($keyboardIsFocused)
                                .keyboardType(.numberPad)
                                .toolbar {
                                    ToolbarItemGroup(placement: .keyboard) {
                                        Button {
                                            keyboardIsFocused = false      
                                        } label: {
                                            Text("ELFOGADOM")
                                                .foregroundColor(.green)
                                            Label("", systemImage: "checkmark.rectangle")
                                                .font(.title.bold())
                                                .foregroundColor(.green)
                                        }
                                    }
                                }
                            VStack {
                                Image(systemName: strength > 0 && isKfTapped.strength ? "checkmark.circle" : "circle")
                                    .foregroundColor(.black).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).strength ? 1 : 0)
                                    .font(.title3)
                                    .onTapGesture {
                                        strength += kfCalculator.kfCalc()
                                        isKfTapped.strength = true
                                    }
                                    .disabled(strength < 18 || (isKfTapped.strength && strength >= 18))
                                Text("KF")
                                    .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).strength ? 1 : 0)
                                    .font(.caption2)
                            }
                            Text(diceCalculator.diceCalc(secondaryCaste).strength)
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text(raceModifCalculator.raceModifShow(race).strength == "0" ? "" : "\(raceModifCalculator.raceModifShow(race).strength)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Image(systemName: strength > 0 ? "dice.fill" : "dice")
                                .font(.title)
                                .foregroundColor(strength > 0 ? .gray : .black)
                                .padding(3)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .onTapGesture {
                                    strength = propCalculator.propCalc(secondaryCaste).strength + raceModifCalculator.raceModifCalc(race).strength
                                }
                                .disabled(strength > 0)
                        }
                        
                        HStack {
                            Text("Gyorsaság: ")
                            TextField("Gyorsaság", value: $speed, format: .number)
                                .focused($keyboardIsFocused)
                                .keyboardType(.numberPad)
                            VStack {
                                Image(systemName: speed > 0 && isKfTapped.speed ? "checkmark.circle" : "circle")
                                    .foregroundColor(.black).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).speed ? 1 : 0)
                                    .font(.title3)
                                    .onTapGesture {
                                        speed += kfCalculator.kfCalc()
                                        isKfTapped.speed = true
                                    }
                                    .disabled(speed < 18 || (isKfTapped.speed && speed >= 18))
                                Text("KF")
                                    .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).speed ? 1 : 0)
                                    .font(.caption2)
                            }
                            Text(diceCalculator.diceCalc(secondaryCaste).speed)
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text(raceModifCalculator.raceModifShow(race).speed == "0" ? "" : "\(raceModifCalculator.raceModifShow(race).speed)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Image(systemName: speed > 0 ? "dice.fill" : "dice")
                                .font(.title)
                                .foregroundColor(speed > 0 ? .gray : .black)
                                .padding(3)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .onTapGesture {
                                    speed = propCalculator.propCalc(secondaryCaste).speed + raceModifCalculator.raceModifCalc(race).speed
                                }
                                .disabled(speed > 0)
                        }

                        HStack {
                            Text("Ügyesség: ")
                            TextField("Ügyesség", value: $agility, format: .number)
                                .focused($keyboardIsFocused)
                                .keyboardType(.numberPad)
                            VStack {
                                Image(systemName: agility > 0 && isKfTapped.agility ? "checkmark.circle" : "circle")
                                    .foregroundColor(.black).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).agility ? 1 : 0)
                                    .font(.title3)
                                    .onTapGesture {
                                        agility += kfCalculator.kfCalc()
                                        isKfTapped.agility = true
                                    }
                                    .disabled(agility < 18 || (isKfTapped.agility && agility >= 18))
                                Text("KF")
                                    .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).agility ? 1 : 0)
                                    .font(.caption2)
                            }
                            Text(diceCalculator.diceCalc(secondaryCaste).agility)
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text(raceModifCalculator.raceModifShow(race).agility == "0" ? "" : "\(raceModifCalculator.raceModifShow(race).agility)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Image(systemName: agility > 0 ? "dice.fill" : "dice")
                                .font(.title)
                                .foregroundColor(agility > 0 ? .gray : .black)
                                .padding(3)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .onTapGesture {
                                    agility = propCalculator.propCalc(secondaryCaste).agility + raceModifCalculator.raceModifCalc(race).agility
                                }
                                .disabled(agility > 0)
                        }
                        
                        HStack {
                            Text("Állóképesség: ")
                            TextField("Állóképesség", value: $endurance, format: .number)
                                .focused($keyboardIsFocused)
                                .keyboardType(.numberPad)
                            VStack {
                                Image(systemName: endurance > 0 && isKfTapped.endurance ? "checkmark.circle" : "circle")
                                    .foregroundColor(.black).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).endurance ? 1 : 0)
                                    .font(.title3)
                                    .onTapGesture {
                                        endurance += kfCalculator.kfCalc()
                                        isKfTapped.endurance = true
                                    }
                                    .disabled(endurance < 18 || (isKfTapped.endurance && endurance >= 18))
                                Text("KF")
                                    .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).endurance ? 1 : 0)
                                    .font(.caption2)
                            }
                            Text(diceCalculator.diceCalc(secondaryCaste).endurance)
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text(raceModifCalculator.raceModifShow(race).endurance == "0" ? "" : "\(raceModifCalculator.raceModifShow(race).endurance)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Image(systemName: endurance > 0 ? "dice.fill" : "dice")
                                .font(.title)
                                .foregroundColor(endurance > 0 ? .gray : .black)
                                .padding(3)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .onTapGesture {
                                    endurance = propCalculator.propCalc(secondaryCaste).endurance + raceModifCalculator.raceModifCalc(race).endurance
                                }
                                .disabled(endurance > 0)
                        }
                        
                        HStack {
                            Text("Egészség: ")
                            TextField("Egészség", value: $health, format: .number)
                                .focused($keyboardIsFocused)
                                .keyboardType(.numberPad)
                            VStack {
                                Image(systemName: health > 0 && isKfTapped.health ? "checkmark.circle" : "circle")
                                    .foregroundColor(.black).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).health ? 1 : 0)
                                    .font(.title3)
                                    .onTapGesture {
                                        health += kfCalculator.kfCalc()
                                        isKfTapped.health = true
                                    }
                                    .disabled(health < 18 || (isKfTapped.health && health >= 18))
                                Text("KF")
                                    .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).health ? 1 : 0)
                                    .font(.caption2)
                            }
                            Text(diceCalculator.diceCalc(secondaryCaste).health)
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text(raceModifCalculator.raceModifShow(race).health == "0" ? "" : "\(raceModifCalculator.raceModifShow(race).health)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Image(systemName: health > 0 ? "dice.fill" : "dice")
                                .font(.title)
                                .foregroundColor(health > 0 ? .gray : .black)
                                .padding(3)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .onTapGesture {
                                    health = propCalculator.propCalc(secondaryCaste).health + raceModifCalculator.raceModifCalc(race).health
                                }
                                .disabled(health > 0)
                        }
                        
                        HStack {
                            Text("Szépség: ")
                            TextField("Szépség", value: $beauty, format: .number)
                                .focused($keyboardIsFocused)
                                .keyboardType(.numberPad)
                            VStack {
                                Image(systemName: beauty > 0 && isKfTapped.beauty ? "checkmark.circle" : "circle")
                                    .foregroundColor(.black).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).beauty ? 1 : 0)
                                    .font(.title3)
                                    .onTapGesture {
                                        beauty += kfCalculator.kfCalc()
                                        isKfTapped.beauty = true
                                    }
                                    .disabled(beauty < 18 || (isKfTapped.beauty && beauty >= 18))
                                Text("KF")
                                    .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).beauty ? 1 : 0)
                                    .font(.caption2)
                            }
                            Text(diceCalculator.diceCalc(secondaryCaste).beauty)
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text(raceModifCalculator.raceModifShow(race).beauty == "0" ? "" : "\(raceModifCalculator.raceModifShow(race).beauty)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Image(systemName: beauty > 0 ? "dice.fill" : "dice")
                                .font(.title)
                                .foregroundColor(beauty > 0 ? .gray : .black)
                                .padding(3)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .onTapGesture {
                                    beauty = propCalculator.propCalc(secondaryCaste).beauty + raceModifCalculator.raceModifCalc(race).beauty
                                }
                                .disabled(beauty > 0)
                        }
                        
                        HStack {
                            Text("Intelligencia: ")
                            TextField("Intelligencia", value: $intelligence, format: .number)
                                .focused($keyboardIsFocused)
                                .keyboardType(.numberPad)
                            VStack {
                                Image(systemName: intelligence > 0 && isKfTapped.intelligence ? "checkmark.circle" : "circle")
                                    .foregroundColor(.black).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).intelligence ? 1 : 0)
                                    .font(.title3)
                                    .onTapGesture {
                                        intelligence += kfCalculator.kfCalc()
                                        isKfTapped.intelligence = true
                                    }
                                    .disabled(intelligence < 18 || (isKfTapped.intelligence && intelligence >= 18))
                                Text("KF")
                                    .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).intelligence ? 1 : 0)
                                    .font(.caption2)
                            }
                            Text(diceCalculator.diceCalc(secondaryCaste).intelligence)
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text(raceModifCalculator.raceModifShow(race).intelligence == "0" ? "" : "\(raceModifCalculator.raceModifShow(race).intelligence)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Image(systemName: intelligence > 0 ? "dice.fill" : "dice")
                                .font(.title)
                                .foregroundColor(intelligence > 0 ? .gray : .black)
                                .padding(3)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .onTapGesture {
                                    intelligence = propCalculator.propCalc(secondaryCaste).intelligence + raceModifCalculator.raceModifCalc(race).intelligence
                                }
                                .disabled(intelligence > 0)
                        }
                        
                        HStack {
                            Text("Akaraterő: ")
                            TextField("Akaraterő", value: $willpower, format: .number)
                                .focused($keyboardIsFocused)
                                .keyboardType(.numberPad)
                            VStack {
                                Image(systemName: willpower > 0 && isKfTapped.willpower ? "checkmark.circle" : "circle")
                                    .foregroundColor(.black).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).willpower ? 1 : 0)
                                    .font(.title3)
                                    .onTapGesture {
                                        willpower += kfCalculator.kfCalc()
                                        isKfTapped.willpower = true
                                    }
                                    .disabled(willpower < 18 || (isKfTapped.willpower && willpower >= 18))
                                Text("KF")
                                    .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).willpower ? 1 : 0)
                                    .font(.caption2)
                            }
                            Text(diceCalculator.diceCalc(secondaryCaste).willpower)
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text(raceModifCalculator.raceModifShow(race).willpower == "0" ? "" : "\(raceModifCalculator.raceModifShow(race).willpower)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Image(systemName: willpower > 0 ? "dice.fill" : "dice")
                                .font(.title)
                                .foregroundColor(willpower > 0 ? .gray : .black)
                                .padding(3)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .onTapGesture {
                                    willpower = propCalculator.propCalc(secondaryCaste).willpower + raceModifCalculator.raceModifCalc(race).willpower
                                }
                                .disabled(willpower > 0)
                        }
                        
                        HStack {
                            Text("Asztrál: ")
                            TextField("Asztrál", value: $astral, format: .number)
                                .focused($keyboardIsFocused)
                                .keyboardType(.numberPad)
                            VStack {
                                Image(systemName: astral > 0 && isKfTapped.astral ? "checkmark.circle" : "circle")
                                    .foregroundColor(.black).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).astral ? 1 : 0)
                                    .font(.title3)
                                    .onTapGesture {
                                        astral += kfCalculator.kfCalc()
                                        isKfTapped.astral = true
                                    }
                                    .disabled(astral < 18 || (isKfTapped.astral && astral >= 18))
                                Text("KF")
                                    .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(secondaryCaste).astral ? 1 : 0)
                                    .font(.caption2)
                            }
                            Text(diceCalculator.diceCalc(secondaryCaste).astral)
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text(raceModifCalculator.raceModifShow(race).astral == "0" ? "" : "\(raceModifCalculator.raceModifShow(race).astral)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Image(systemName: astral > 0 ? "dice.fill" : "dice")
                                .font(.title)
                                .foregroundColor(astral > 0 ? .gray : .black)
                                .padding(3)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .onTapGesture {
                                    astral = propCalculator.propCalc(secondaryCaste).astral + raceModifCalculator.raceModifCalc(race).astral
                                }
                                .disabled(astral > 0)
                        }
                                
                        .alert("Értékek törlése?", isPresented: $showDeleteAlert) {
                            Button ("Törlés", role: .destructive) {
                                strength = 0
                                speed = 0
                                agility = 0
                                endurance = 0
                                health = 0
                                beauty = 0
                                intelligence = 0
                                willpower = 0
                                astral = 0
                                isKfTapped.strength = false
                                isKfTapped.speed = false
                                isKfTapped.agility = false
                                isKfTapped.health = false
                                isKfTapped.endurance = false
                                isKfTapped.beauty = false
                                isKfTapped.intelligence = false
                                isKfTapped.willpower = false
                                isKfTapped.astral = false
                            }
                            Button ("Mégse", role: .cancel) { }
                        } message : {
                            Text("Jól gondold meg... az összes munkád kárba vész.")
                        }
                        
                            
                        
                    }
                }
                
// end of Properties SECTION
            }
            .navigationTitle("Karakter alkotás")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let newEntry = Character(context: moc)
                        newEntry.id = UUID()
                        newEntry.name = name
                        newEntry.primaryCaste = primaryCaste
                        newEntry.secondaryCaste = secondaryCaste
                        newEntry.race = race
                        newEntry.alignment = alignment
                        newEntry.religion = religion
                        newEntry.charDescription = charDescription
                        newEntry.level = Int16(level)
                        newEntry.xp = Int64(xp)
                        newEntry.strength = Int16(strength)
                        newEntry.speed = Int16(speed)
                        newEntry.agility = Int16(agility)
                        newEntry.endurance = Int16(endurance)
                        newEntry.health = Int16(health)
                        newEntry.beauty = Int16(beauty)
                        newEntry.intelligence = Int16(intelligence)
                        newEntry.willpower = Int16(willpower)
                        newEntry.astral = Int16(astral)
                        
                        if moc.hasChanges {
                            try? moc.save()
                        }
                        dismiss()
                    } label: {
                        Text("Mentés")
                    }
                    .disabled(hasValidEntry == false)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Vissza")
                    }
                }
            }
        }
    }
    
    func castesSelection() -> [String] {
        
        switch primaryCaste {
        case "Szerencsevadász":
            return adventurerCastes
        case "Pap":
            return priestCastes
        case "Harcművész":
            return martialCastes
        case "Mágiahasználó":
            return mageCastes
        default:
            return warriorCastes
        }
    }
    
}

//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView()
//    }
//}
