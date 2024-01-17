//
//  AddPropertiesView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 25/10/2022.
//

import SwiftUI
import Combine

struct AddPropertiesView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @FocusState private var keyboardIsFocused: Bool
    @State private var showDeleteAlert: Bool = false
    @State private var showConfirmButton : String?
    
    @State private var strengthTyped = ""
    @State private var speedTyped = ""
    @State private var agilityTyped = ""
    @State private var enduranceTyped = ""
    @State private var healthTyped = ""
    @State private var beautyTyped = ""
    @State private var intelligenceTyped = ""
    @State private var willpowerTyped = ""
    @State private var astralTyped = ""
    @State private var perceptionTyped = ""
    
    
    var isTrashDisabled: Bool {
        if
            listViewModel.data.strength > 0 ||
            listViewModel.data.speed > 0 ||
            listViewModel.data.agility > 0 ||
            listViewModel.data.endurance > 0 ||
            listViewModel.data.health > 0 ||
            listViewModel.data.beauty > 0 ||
            listViewModel.data.intelligence > 0 ||
            listViewModel.data.willpower > 0 ||
            listViewModel.data.astral > 0 ||
            listViewModel.data.perception > 0 {
            return false
        }
        return true
    }
    
    var hasValidEntry: Bool {
        if listViewModel.data.name.isEmpty {
            return false
        }
        return true
    }
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Értékek")
                Spacer()
                Button {
                    listViewModel.calcProps()
                    strengthTyped = String(listViewModel.data.strength)
                    speedTyped = String(listViewModel.data.speed)
                    agilityTyped = String(listViewModel.data.agility)
                    enduranceTyped = String(listViewModel.data.endurance)
                    healthTyped = String(listViewModel.data.health)
                    beautyTyped = String(listViewModel.data.beauty)
                    intelligenceTyped = String(listViewModel.data.intelligence)
                    willpowerTyped = String(listViewModel.data.willpower)
                    astralTyped = String(listViewModel.data.astral)
                    perceptionTyped = String(listViewModel.data.perception)
                }label:{
                    Image(systemName: "square.stack.3d.up")
                        .foregroundColor(!isTrashDisabled || (listViewModel.data.secondaryCaste == "Válassz") ? .gray : .primary)
                }
                .disabled(!isTrashDisabled || (listViewModel.data.secondaryCaste == "Válassz"))
                .padding(.horizontal)
                Button {
                    showDeleteAlert = true
                }label:{
                    Image(systemName: "trash")
                        .foregroundColor(isTrashDisabled ? .gray : .primary)
                }
                .disabled(isTrashDisabled)
            }
            .headerStyle()
            
            LazyVGrid(
                columns: [
                    GridItem(.flexible())
                ])
            {
                HStack (alignment: .center, spacing: 0){
                    Text("Erő")
                        .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        .frame(width: 110, alignment: .leading)
                        .padding(.leading)
                    TextField("0", text: $strengthTyped)
                        .onChange(of: strengthTyped) { newValue in
                            strengthTyped = String(newValue.prefix(2))
                        }
                        .onReceive(Just(strengthTyped)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.strengthTyped = filtered
                            }
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = "Erő"
                            }
                        }
                        .onSubmit {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.strength = Int(strengthTyped) ?? 0
                            keyboardIsFocused = false
                        }
                        .padding(5)
                        .background(strengthTyped.isEmpty ? Color.red.opacity(0.6) : Color.primary)
                        .cornerRadius(6)
                        .frame(maxWidth: 40)
                        .focused($keyboardIsFocused)
                        .keyboardType(.numberPad)
                    Spacer()
                    VStack {
                        Button {
                            listViewModel.data.strength += kfCalculator.kfCalc()
                            strengthTyped = String(listViewModel.data.strength)
                            listViewModel.data.isKfTapped.strength = true
                        } label: {
                            Image(systemName: listViewModel.data.strength > 0 && listViewModel.data.isKfTapped.strength ? "checkmark.circle" : "circle")
                                .foregroundColor(.primary).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).strength ? 1 : 0)
                                .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        }
                        .disabled(listViewModel.data.strength < 18 || (listViewModel.data.isKfTapped.strength && listViewModel.data.strength >= 18))
                        Text("KF")
                            .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).strength ? 1 : 0)
                            .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                    }
                    .padding(.horizontal, 6)
                    Text(diceCalculator.diceCalc(listViewModel.data.secondaryCaste).strength)
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 55, alignment: .leading)
                    Text(raceModifCalculator.raceModifShow(listViewModel.data.race).strength == "0" ? "" : "\(raceModifCalculator.raceModifShow(listViewModel.data.race).strength)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 15, alignment: .leading)
                        .padding(.trailing, 10)
                    if showConfirmButton == "Erő" {
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.strength = Int(strengthTyped) ?? 0
                            keyboardIsFocused = false
                        } label: {
                            Image(systemName: "checkmark")
                                .buttonStyleOn()
                        }
                    } else {
                        Button {
                            listViewModel.data.strength = propCalculator.propCalc(listViewModel.data.secondaryCaste).strength + raceModifCalculator.raceModifCalc(listViewModel.data.race).strength
                            strengthTyped = String(listViewModel.data.strength)
                        } label: {
                            Image(systemName: listViewModel.data.strength > 0 ? "dice.fill" : "dice")
                                .buttonStyleDisabled(isValid: listViewModel.data.strength == 0)
                        }
                        .disabled(listViewModel.data.strength > 0)
                    }
                }
                
                HStack (alignment: .center, spacing: 0){
                    Text("Gyorsaság")
                        .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        .frame(width: 110, alignment: .leading)
                        .padding(.leading)
                    TextField("0", text: $speedTyped)
                        .onChange(of: speedTyped) { newValue in
                            speedTyped = String(newValue.prefix(2))
                        }
                        .onReceive(Just(speedTyped)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.speedTyped = filtered
                            }
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = "Gyo"
                            }
                        }
                        .onSubmit {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.speed = Int(speedTyped) ?? 0
                            keyboardIsFocused = false
                        }
                        .padding(5)
                        .background(speedTyped.isEmpty ? Color.red.opacity(0.6) : Color.primary)
                        .cornerRadius(6)
                        .frame(maxWidth: 40)
                        .focused($keyboardIsFocused)
                        .keyboardType(.numberPad)
                    Spacer()
                    VStack {
                        Button {
                            listViewModel.data.speed += kfCalculator.kfCalc()
                            speedTyped = String(listViewModel.data.speed)
                            listViewModel.data.isKfTapped.speed = true
                        } label: {
                            Image(systemName: listViewModel.data.speed > 0 && listViewModel.data.isKfTapped.speed ? "checkmark.circle" : "circle")
                                .foregroundColor(.primary).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).speed ? 1 : 0)
                                .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        }
                        .disabled(listViewModel.data.speed < 18 || (listViewModel.data.isKfTapped.speed && listViewModel.data.speed >= 18))
                        Text("KF")
                            .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).speed ? 1 : 0)
                            .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                    }
                    .padding(.horizontal, 6)
                    Text(diceCalculator.diceCalc(listViewModel.data.secondaryCaste).speed)
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 55, alignment: .leading)
                    Text(raceModifCalculator.raceModifShow(listViewModel.data.race).speed == "0" ? "" : "\(raceModifCalculator.raceModifShow(listViewModel.data.race).speed)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 15, alignment: .leading)
                        .padding(.trailing, 10)
                    if showConfirmButton == "Gyo" {
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.speed = Int(speedTyped) ?? 0
                            keyboardIsFocused = false
                        } label: {
                            Image(systemName: "checkmark")
                                .buttonStyleOn()
                        }
                    } else {
                        Button {
                            listViewModel.data.speed = propCalculator.propCalc(listViewModel.data.secondaryCaste).speed + raceModifCalculator.raceModifCalc(listViewModel.data.race).speed
                            speedTyped = String(listViewModel.data.speed)
                        } label: {
                            Image(systemName: listViewModel.data.speed > 0 ? "dice.fill" : "dice")
                                .buttonStyleDisabled(isValid: listViewModel.data.speed == 0)
                        }
                        .disabled(listViewModel.data.speed > 0)
                    }
                }
                
                HStack (alignment: .center, spacing: 0){
                    Text("Ügyesség")
                        .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        .frame(width: 110, alignment: .leading)
                        .padding(.leading)
                    TextField("0", text: $agilityTyped)
                        .onChange(of: agilityTyped) { newValue in
                            agilityTyped = String(newValue.prefix(2))
                        }
                        .onReceive(Just(agilityTyped)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.agilityTyped = filtered
                            }
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = "Ügy"
                            }
                        }
                        .onSubmit {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.agility = Int(agilityTyped) ?? 0
                            keyboardIsFocused = false
                        }
                        .padding(5)
                        .background(agilityTyped.isEmpty ? Color.red.opacity(0.6) : Color.primary)
                        .cornerRadius(6)
                        .frame(maxWidth: 40)
                        .focused($keyboardIsFocused)
                        .keyboardType(.numberPad)
                    Spacer()
                    VStack {
                        Button {
                            listViewModel.data.agility += kfCalculator.kfCalc()
                            agilityTyped = String(listViewModel.data.agility)
                            listViewModel.data.isKfTapped.agility = true
                        } label: {
                            Image(systemName: listViewModel.data.agility > 0 && listViewModel.data.isKfTapped.agility ? "checkmark.circle" : "circle")
                                .foregroundColor(.primary).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).agility ? 1 : 0)
                                .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        }
                        .disabled(listViewModel.data.agility < 18 || (listViewModel.data.isKfTapped.agility && listViewModel.data.agility >= 18))
                        Text("KF")
                            .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).agility ? 1 : 0)
                            .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                    }
                    .padding(.horizontal, 6)
                    Text(diceCalculator.diceCalc(listViewModel.data.secondaryCaste).agility)
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 55, alignment: .leading)
                    Text(raceModifCalculator.raceModifShow(listViewModel.data.race).agility == "0" ? "" : "\(raceModifCalculator.raceModifShow(listViewModel.data.race).agility)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 15, alignment: .leading)
                        .padding(.trailing, 10)
                    if showConfirmButton == "Ügy" {
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.agility = Int(agilityTyped) ?? 0
                            keyboardIsFocused = false
                        } label: {
                            Image(systemName: "checkmark")
                                .buttonStyleOn()
                        }
                    } else {
                        Button {
                            listViewModel.data.agility = propCalculator.propCalc(listViewModel.data.secondaryCaste).agility + raceModifCalculator.raceModifCalc(listViewModel.data.race).agility
                            agilityTyped = String(listViewModel.data.agility)
                        } label: {
                            Image(systemName: listViewModel.data.agility > 0 ? "dice.fill" : "dice")
                                .buttonStyleDisabled(isValid: listViewModel.data.agility == 0)
                        }
                        .disabled(listViewModel.data.agility > 0)
                    }
                }
                
                HStack (alignment: .center, spacing: 0){
                    Text("Állóképesség")
                        .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        .frame(width: 110, alignment: .leading)
                        .padding(.leading)
                    TextField("0", text: $enduranceTyped)
                        .onChange(of: enduranceTyped) { newValue in
                            enduranceTyped = String(newValue.prefix(2))
                        }
                        .onReceive(Just(enduranceTyped)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.enduranceTyped = filtered
                            }
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = "Áll"
                            }
                        }
                        .onSubmit {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.endurance = Int(enduranceTyped) ?? 0
                            keyboardIsFocused = false
                        }
                        .padding(5)
                        .background(enduranceTyped.isEmpty ? Color.red.opacity(0.6) : Color.primary)
                        .cornerRadius(6)
                        .frame(maxWidth: 40)
                        .focused($keyboardIsFocused)
                        .keyboardType(.numberPad)
                    Spacer()
                    VStack {
                        Button {
                            listViewModel.data.endurance += kfCalculator.kfCalc()
                            enduranceTyped = String(listViewModel.data.endurance)
                            listViewModel.data.isKfTapped.endurance = true
                        } label: {
                            Image(systemName: listViewModel.data.endurance > 0 && listViewModel.data.isKfTapped.endurance ? "checkmark.circle" : "circle")
                                .foregroundColor(.primary).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).endurance ? 1 : 0)
                                .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        }
                        .disabled(listViewModel.data.endurance < 18 || (listViewModel.data.isKfTapped.endurance && listViewModel.data.endurance >= 18))
                        Text("KF")
                            .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).endurance ? 1 : 0)
                            .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                    }
                    .padding(.horizontal, 6)
                    Text(diceCalculator.diceCalc(listViewModel.data.secondaryCaste).endurance)
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 55, alignment: .leading)
                    Text(raceModifCalculator.raceModifShow(listViewModel.data.race).endurance == "0" ? "" : "\(raceModifCalculator.raceModifShow(listViewModel.data.race).endurance)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 15, alignment: .leading)
                        .padding(.trailing, 10)
                    if showConfirmButton == "Áll" {
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.endurance = Int(enduranceTyped) ?? 0
                            keyboardIsFocused = false
                        } label: {
                            Image(systemName: "checkmark")
                                .buttonStyleOn()
                        }
                    } else {
                        Button {
                            listViewModel.data.endurance = propCalculator.propCalc(listViewModel.data.secondaryCaste).endurance + raceModifCalculator.raceModifCalc(listViewModel.data.race).endurance
                            enduranceTyped = String(listViewModel.data.endurance)
                        } label : {
                            Image(systemName: listViewModel.data.endurance > 0 ? "dice.fill" : "dice")
                                .buttonStyleDisabled(isValid: listViewModel.data.endurance == 0)
                        }
                        .disabled(listViewModel.data.endurance > 0)
                    }
                }
                
                HStack (alignment: .center, spacing: 0){
                    Text("Egészség")
                        .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        .frame(width: 110, alignment: .leading)
                        .padding(.leading)
                    TextField("0", text: $healthTyped)
                        .onChange(of: healthTyped) { newValue in
                            healthTyped = String(newValue.prefix(2))
                        }
                        .onReceive(Just(healthTyped)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.healthTyped = filtered
                            }
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = "Egs"
                            }
                        }
                        .onSubmit {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.health = Int(healthTyped) ?? 0
                            keyboardIsFocused = false
                        }
                        .padding(5)
                        .background(healthTyped.isEmpty ? Color.red.opacity(0.6) : Color.primary)
                        .cornerRadius(6)
                        .frame(maxWidth: 40)
                        .focused($keyboardIsFocused)
                        .keyboardType(.numberPad)
                    Spacer()
                    VStack {
                        Button {
                            listViewModel.data.health += kfCalculator.kfCalc()
                            healthTyped = String(listViewModel.data.health)
                            listViewModel.data.isKfTapped.health = true
                        } label : {
                            Image(systemName: listViewModel.data.health > 0 && listViewModel.data.isKfTapped.health ? "checkmark.circle" : "circle")
                                .foregroundColor(.primary).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).health ? 1 : 0)
                                .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        }
                        .disabled(listViewModel.data.health < 18 || (listViewModel.data.isKfTapped.health && listViewModel.data.health >= 18))
                        Text("KF")
                            .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).health ? 1 : 0)
                            .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                    }
                    .padding(.horizontal, 6)
                    Text(diceCalculator.diceCalc(listViewModel.data.secondaryCaste).health)
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 55, alignment: .leading)
                    Text(raceModifCalculator.raceModifShow(listViewModel.data.race).health == "0" ? "" : "\(raceModifCalculator.raceModifShow(listViewModel.data.race).health)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 15, alignment: .leading)
                        .padding(.trailing, 10)
                    if showConfirmButton == "Egs" {
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.health = Int(healthTyped) ?? 0
                            keyboardIsFocused = false
                        } label: {
                            Image(systemName: "checkmark")
                                .buttonStyleOn()
                        }
                    } else {
                        Button {
                            listViewModel.data.health = propCalculator.propCalc(listViewModel.data.secondaryCaste).health + raceModifCalculator.raceModifCalc(listViewModel.data.race).health
                            healthTyped = String(listViewModel.data.health)
                        } label : {
                            Image(systemName: listViewModel.data.health > 0 ? "dice.fill" : "dice")
                                .buttonStyleDisabled(isValid: listViewModel.data.health == 0)
                        }
                        .disabled(listViewModel.data.health > 0)
                    }
                }
                
                HStack (alignment: .center, spacing: 0){
                    Text("Szépség")
                        .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        .frame(width: 110, alignment: .leading)
                        .padding(.leading)
                    TextField("0", text: $beautyTyped)
                        .onChange(of: beautyTyped) { newValue in
                            beautyTyped = String(newValue.prefix(2))
                        }
                        .onReceive(Just(beautyTyped)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.beautyTyped = filtered
                            }
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = "Szé"
                            }
                        }
                        .onSubmit {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.beauty = Int(beautyTyped) ?? 0
                            keyboardIsFocused = false
                        }
                        .padding(5)
                        .background(beautyTyped.isEmpty ? Color.red.opacity(0.6) : Color.primary)
                        .cornerRadius(6)
                        .frame(maxWidth: 40)
                        .focused($keyboardIsFocused)
                        .keyboardType(.numberPad)
                    Spacer()
                    VStack {
                        Button {
                            listViewModel.data.beauty += kfCalculator.kfCalc()
                            beautyTyped = String(listViewModel.data.beauty)
                            listViewModel.data.isKfTapped.beauty = true
                        } label : {
                            Image(systemName: listViewModel.data.beauty > 0 && listViewModel.data.isKfTapped.beauty ? "checkmark.circle" : "circle")
                                .foregroundColor(.primary).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).beauty ? 1 : 0)
                                .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        }
                        .disabled(listViewModel.data.beauty < 18 || (listViewModel.data.isKfTapped.beauty && listViewModel.data.beauty >= 18))
                        Text("KF")
                            .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).beauty ? 1 : 0)
                            .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                    }
                    .padding(.horizontal, 6)
                    Text(diceCalculator.diceCalc(listViewModel.data.secondaryCaste).beauty)
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 55, alignment: .leading)
                    Text(raceModifCalculator.raceModifShow(listViewModel.data.race).beauty == "0" ? "" : "\(raceModifCalculator.raceModifShow(listViewModel.data.race).beauty)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 15, alignment: .leading)
                        .padding(.trailing, 10)
                    if showConfirmButton == "Szé" {
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.beauty = Int(beautyTyped) ?? 0
                            keyboardIsFocused = false
                        } label: {
                            Image(systemName: "checkmark")
                                .buttonStyleOn()
                        }
                    } else {
                        Button {
                            listViewModel.data.beauty = propCalculator.propCalc(listViewModel.data.secondaryCaste).beauty + raceModifCalculator.raceModifCalc(listViewModel.data.race).beauty
                            beautyTyped = String(listViewModel.data.beauty)
                        } label : {
                            Image(systemName: listViewModel.data.beauty > 0 ? "dice.fill" : "dice")
                                .buttonStyleDisabled(isValid: listViewModel.data.beauty == 0)
                        }
                        .disabled(listViewModel.data.beauty > 0)
                    }
                }
                
                HStack (alignment: .center, spacing: 0){
                    Text("Intelligencia")
                        .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        .frame(width: 110, alignment: .leading)
                        .padding(.leading)
                    TextField("0", text: $intelligenceTyped)
                        .onChange(of: intelligenceTyped) { newValue in
                            intelligenceTyped = String(newValue.prefix(2))
                        }
                        .onReceive(Just(intelligenceTyped)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.intelligenceTyped = filtered
                            }
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = "Int"
                            }
                        }
                        .onSubmit {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.intelligence = Int(intelligenceTyped) ?? 0
                            keyboardIsFocused = false
                        }
                        .padding(5)
                        .background(intelligenceTyped.isEmpty ? Color.red.opacity(0.6) : Color.primary)
                        .cornerRadius(6)
                        .frame(maxWidth: 40)
                        .focused($keyboardIsFocused)
                        .keyboardType(.numberPad)
                    Spacer()
                    VStack {
                        Button {
                            listViewModel.data.intelligence += kfCalculator.kfCalc()
                            intelligenceTyped = String(listViewModel.data.intelligence)
                            listViewModel.data.isKfTapped.intelligence = true
                        } label : {
                            Image(systemName: listViewModel.data.intelligence > 0 && listViewModel.data.isKfTapped.intelligence ? "checkmark.circle" : "circle")
                                .foregroundColor(.primary).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).intelligence ? 1 : 0)
                                .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        }
                        .disabled(listViewModel.data.intelligence < 18 || (listViewModel.data.isKfTapped.intelligence && listViewModel.data.intelligence >= 18))
                        Text("KF")
                            .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).intelligence ? 1 : 0)
                            .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                    }
                    .padding(.horizontal, 6)
                    Text(diceCalculator.diceCalc(listViewModel.data.secondaryCaste).intelligence)
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 55, alignment: .leading)
                    Text(raceModifCalculator.raceModifShow(listViewModel.data.race).intelligence == "0" ? "" : "\(raceModifCalculator.raceModifShow(listViewModel.data.race).intelligence)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 15, alignment: .leading)
                        .padding(.trailing, 10)
                    if showConfirmButton == "Int" {
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.intelligence = Int(intelligenceTyped) ?? 0
                            keyboardIsFocused = false
                        } label: {
                            Image(systemName: "checkmark")
                                .buttonStyleOn()
                        }
                    } else {
                        Button {
                            listViewModel.data.intelligence = propCalculator.propCalc(listViewModel.data.secondaryCaste).intelligence + raceModifCalculator.raceModifCalc(listViewModel.data.race).intelligence
                            intelligenceTyped = String(listViewModel.data.intelligence)
                        } label : {
                            Image(systemName: listViewModel.data.intelligence > 0 ? "dice.fill" : "dice")
                                .buttonStyleDisabled(isValid: listViewModel.data.intelligence == 0)
                        }
                        .disabled(listViewModel.data.intelligence > 0)
                    }
                }
                
                HStack (alignment: .center, spacing: 0){
                    Text("Akaraterő")
                        .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        .frame(width: 110, alignment: .leading)
                        .padding(.leading)
                    TextField("0", text: $willpowerTyped)
                        .onChange(of: willpowerTyped) { newValue in
                            willpowerTyped = String(newValue.prefix(2))
                        }
                        .onReceive(Just(willpowerTyped)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.willpowerTyped = filtered
                            }
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = "Aka"
                            }
                        }
                        .onSubmit {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.willpower = Int(willpowerTyped) ?? 0
                            keyboardIsFocused = false
                        }
                        .padding(5)
                        .background(willpowerTyped.isEmpty ? Color.red.opacity(0.6) : Color.primary)
                        .cornerRadius(6)
                        .frame(maxWidth: 40)
                        .focused($keyboardIsFocused)
                        .keyboardType(.numberPad)
                    Spacer()
                    VStack {
                        Button {
                            listViewModel.data.willpower += kfCalculator.kfCalc()
                            willpowerTyped = String(listViewModel.data.willpower)
                            listViewModel.data.isKfTapped.willpower = true
                        } label : {
                            Image(systemName: listViewModel.data.willpower > 0 && listViewModel.data.isKfTapped.willpower ? "checkmark.circle" : "circle")
                                .foregroundColor(.primary).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).willpower ? 1 : 0)
                                .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        }
                        .disabled(listViewModel.data.willpower < 18 || (listViewModel.data.isKfTapped.willpower && listViewModel.data.willpower >= 18))
                        Text("KF")
                            .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).willpower ? 1 : 0)
                            .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                    }
                    .padding(.horizontal, 6)
                    Text(diceCalculator.diceCalc(listViewModel.data.secondaryCaste).willpower)
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 55, alignment: .leading)
                    Text(raceModifCalculator.raceModifShow(listViewModel.data.race).willpower == "0" ? "" : "\(raceModifCalculator.raceModifShow(listViewModel.data.race).willpower)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 15, alignment: .leading)
                        .padding(.trailing, 10)
                    if showConfirmButton == "Aka" {
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.willpower = Int(willpowerTyped) ?? 0
                            keyboardIsFocused = false
                        } label: {
                            Image(systemName: "checkmark")
                                .buttonStyleOn()
                        }
                    } else {
                        Button {
                            listViewModel.data.willpower = propCalculator.propCalc(listViewModel.data.secondaryCaste).willpower + raceModifCalculator.raceModifCalc(listViewModel.data.race).willpower
                            willpowerTyped = String(listViewModel.data.willpower)
                        } label : {
                            Image(systemName: listViewModel.data.willpower > 0 ? "dice.fill" : "dice")
                                .buttonStyleDisabled(isValid: listViewModel.data.willpower == 0)
                        }
                        .disabled(listViewModel.data.willpower > 0)
                    }
                }
                
                HStack (alignment: .center, spacing: 0){
                    Text("Asztrál")
                        .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        .frame(width: 110, alignment: .leading)
                        .padding(.leading)
                    TextField("0", text: $astralTyped)
                        .onChange(of: astralTyped) { newValue in
                            astralTyped = String(newValue.prefix(2))
                        }
                        .onReceive(Just(astralTyped)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.astralTyped = filtered
                            }
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = "Asz"
                            }
                        }
                        .onSubmit {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.astral = Int(astralTyped) ?? 0
                            keyboardIsFocused = false
                        }
                        .padding(5)
                        .background(astralTyped.isEmpty ? Color.red.opacity(0.6) : Color.primary)
                        .cornerRadius(6)
                        .frame(maxWidth: 40)
                        .focused($keyboardIsFocused)
                        .keyboardType(.numberPad)
                    Spacer()
                    VStack {
                        Button {
                            listViewModel.data.astral += kfCalculator.kfCalc()
                            astralTyped = String(listViewModel.data.astral)
                            listViewModel.data.isKfTapped.astral = true
                        } label: {
                            Image(systemName: listViewModel.data.astral > 0 && listViewModel.data.isKfTapped.astral ? "checkmark.circle" : "circle")
                                .foregroundColor(.primary).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).astral ? 1 : 0)
                                .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        }
                        .disabled(listViewModel.data.astral < 18 || (listViewModel.data.isKfTapped.astral && listViewModel.data.astral >= 18))
                        Text("KF")
                            .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).astral ? 1 : 0)
                            .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                    }
                    .padding(.horizontal, 6)
                    Text(diceCalculator.diceCalc(listViewModel.data.secondaryCaste).astral)
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 55, alignment: .leading)
                    Text(raceModifCalculator.raceModifShow(listViewModel.data.race).astral == "0" ? "" : "\(raceModifCalculator.raceModifShow(listViewModel.data.race).astral)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 15, alignment: .leading)
                        .padding(.trailing, 10)
                    if showConfirmButton == "Asz" {
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.astral = Int(astralTyped) ?? 0
                            keyboardIsFocused = false
                        } label: {
                            Image(systemName: "checkmark")
                                .buttonStyleOn()
                        }
                    } else {
                        Button {
                            listViewModel.data.astral = propCalculator.propCalc(listViewModel.data.secondaryCaste).astral + raceModifCalculator.raceModifCalc(listViewModel.data.race).astral
                            astralTyped = String(listViewModel.data.astral)
                        } label: {
                            Image(systemName: listViewModel.data.astral > 0 ? "dice.fill" : "dice")
                                .buttonStyleDisabled(isValid: listViewModel.data.astral == 0)
                        }
                        .disabled(listViewModel.data.astral > 0)
                    }
                }
                
                HStack (alignment: .center, spacing: 0){
                    Text("Érzékelés")
                        .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        .frame(width: 110, alignment: .leading)
                        .padding(.leading)
                    TextField("0", text: $perceptionTyped)
                        .onChange(of: perceptionTyped) { newValue in
                            perceptionTyped = String(newValue.prefix(2))
                        }
                        .onReceive(Just(perceptionTyped)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.perceptionTyped = filtered
                            }
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = "Érz"
                            }
                        }
                        .onSubmit {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.perception = Int(perceptionTyped) ?? 0
                            keyboardIsFocused = false
                        }
                        .padding(5)
                        .background(perceptionTyped.isEmpty ? Color.red.opacity(0.6) : Color.primary)
                        .cornerRadius(6)
                        .frame(maxWidth: 40)
                        .focused($keyboardIsFocused)
                        .keyboardType(.numberPad)
                    Spacer()
                    VStack {
                        Button {
                            listViewModel.data.perception += kfCalculator.kfCalc()
                            perceptionTyped = String(listViewModel.data.perception)
                            listViewModel.data.isKfTapped.perception = true
                        } label : {
                            Image(systemName: listViewModel.data.perception > 0 && listViewModel.data.isKfTapped.perception ? "checkmark.circle" : "circle")
                                .foregroundColor(.primary).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).perception ? 1 : 0)
                                .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                        }
                        .disabled(listViewModel.data.perception < 18 || (listViewModel.data.isKfTapped.perception && listViewModel.data.perception >= 18))
                        Text("KF")
                            .foregroundColor(.gray).opacity(kfIsOnCalculator.kfIsOn(listViewModel.data.secondaryCaste).perception ? 1 : 0)
                            .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                    }
                    .padding(.horizontal, 6)
                    Text(diceCalculator.diceCalc(listViewModel.data.secondaryCaste).perception)
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 55, alignment: .leading)
                    Text(raceModifCalculator.raceModifShow(listViewModel.data.race).perception == "0" ? "" : "\(raceModifCalculator.raceModifShow(listViewModel.data.race).perception)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                        .frame(minWidth: 15, alignment: .leading)
                        .padding(.trailing, 10)
                    if showConfirmButton == "Érz" {
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            listViewModel.data.perception = Int(perceptionTyped) ?? 0
                            keyboardIsFocused = false
                        } label: {
                            Image(systemName: "checkmark")
                                .buttonStyleOn()
                        }
                    } else {
                        Button {
                            listViewModel.data.perception = propCalculator.propCalc(listViewModel.data.secondaryCaste).perception + raceModifCalculator.raceModifCalc(listViewModel.data.race).perception
                            perceptionTyped = String(listViewModel.data.perception)
                        } label: {
                            Image(systemName: listViewModel.data.perception > 0 ? "dice.fill" : "dice")
                                .buttonStyleDisabled(isValid: listViewModel.data.perception == 0)
                        }
                        .disabled(listViewModel.data.perception > 0)
                    }
                }
                
            }
            .charInfoStyleBg()
            .disabled(listViewModel.data.secondaryCaste == "Válassz")
            .foregroundColor(listViewModel.data.secondaryCaste == "Válassz" ? .primary.opacity(0.3) : .primary)
        }
        .alert("Értékek törlése?", isPresented: $showDeleteAlert) {
            Button ("Törlés", role: .destructive) {
                listViewModel.eraseProps()
                strengthTyped = ""
                speedTyped = ""
                agilityTyped = ""
                enduranceTyped = ""
                healthTyped = ""
                beautyTyped = ""
                intelligenceTyped = ""
                willpowerTyped = ""
                astralTyped = ""
                perceptionTyped = ""
            }
            Button ("Mégse", role: .cancel) { }
        } message : {
            Text("Jól gondold meg...")
        }
    }
}

struct AddPropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        AddPropertiesView()
    }
}
