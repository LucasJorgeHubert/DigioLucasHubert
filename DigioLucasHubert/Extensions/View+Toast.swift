//
//  View+Toast.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 29/09/24.
//

import SwiftUI

extension View {

  func toastView(toast: Binding<Toast?>) -> some View {
    self.modifier(ToastModifier(toast: toast))
  }
}
