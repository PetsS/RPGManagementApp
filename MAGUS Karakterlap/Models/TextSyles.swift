//
//  TextSyles.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 16/09/2022.
//

import Foundation
import SwiftUI

// styling for titles

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .light, design: .rounded).smallCaps())
            .foregroundColor(.primary)
            .padding(.vertical, 5)
            .padding(.leading, 15)
            .padding(.trailing, 5)
    }
}
extension View {
    func titleStyle() -> some View {
        modifier(TitleStyle())
    }
}

// styling for info titles

struct TitleInfoStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .light, design: .rounded))
            .foregroundColor(.primary)
            .padding(.vertical, 10)
            .padding(.horizontal)
    }
}
extension View {
    func titleInfoStyle() -> some View {
        modifier(TitleInfoStyle())
    }
}

// styling for Buttons

struct ButtonStyleOn: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .frame(width: 30, height: 25)
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(.gray.opacity(1))
            .cornerRadius(15)
            .shadow(radius: 2, y: 2)
    }
}
extension View {
    func buttonStyleOn() -> some View {
        modifier(ButtonStyleOn())
    }
}

// styling for desabled Buttons

struct ButtonStyleDisabled: ViewModifier {
    
    let isValid: Bool
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(isValid ? .white : .gray)
            .font(.headline)
            .frame(width: 30, height: 25)
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(.gray.opacity(isValid ? 1 : 0.4))
            .cornerRadius(15)
            .shadow(radius: isValid ? 2 : 0, y: isValid ? 2 : 0)
    }
}
extension View {
    func buttonStyleDisabled(isValid: Bool) -> some View {
        modifier(ButtonStyleDisabled(isValid: isValid))
    }
}
    


//styling for Properties

struct ItemStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 28).smallCaps().weight(.heavy))
            .frame(minWidth: 35)
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .background(.orange.opacity(0.7))
            .cornerRadius(15)
            .shadow(radius: 1, y:1)
    }
}
extension View {
    func itemStyle() -> some View {
        modifier(ItemStyle())
    }
}

//styling for character infos

struct CharInfoStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 16).smallCaps().weight(.medium))
            .frame(height: 25)
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(.orange.opacity(0.7))
            .cornerRadius(15)
            .shadow(radius: 1, y:1)
    }
}
extension View {
    func charInfoStyle() -> some View {
        modifier(CharInfoStyle())
    }
}

//styling for character infos with edit mode

struct CharInfoStyleEdit: ViewModifier {
    
    var isEditButtonActive: Bool
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 16).smallCaps().weight(.medium))
            .frame(height: 25)
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(isEditButtonActive ? .red : .orange.opacity(0.7))
            .animation(.spring(response: 0.6), value: isEditButtonActive)
            .cornerRadius(15)
            .shadow(radius: 1, y:1)
    }
}
extension View {
    func charInfoStyleEdit(button: Bool) -> some View {
        modifier(CharInfoStyleEdit(isEditButtonActive: button))
    }
}

//styling for character infos backgrounds

struct CharInfoStyleBg: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(.ultraThinMaterial)
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.vertical, 2)
    }
}
extension View {
    func charInfoStyleBg() -> some View {
        modifier(CharInfoStyleBg())
    }
}

//styling for Fight View

struct CharInfoStyleFight: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 28).smallCaps().weight(.heavy))
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .frame(width: 90)
            .background(.orange.opacity(0.7))
            .cornerRadius(15)
            .shadow(radius: 1, y:1)
    }
}
extension View {
    func charInfoStyleFight() -> some View {
        modifier(CharInfoStyleFight())
    }
}

//styling for headers (just like section headers)

struct HeaderStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .font(.system(size: 16).smallCaps().weight(.light))
            .padding(.horizontal, 40)
            .padding(.bottom, -5)
    }
}
extension View {
    func headerStyle() -> some View {
        modifier(HeaderStyle())
    }
}


