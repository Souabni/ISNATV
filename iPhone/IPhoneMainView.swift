//
//  IPhoneMainView.swift
//  ISNATV
//
//  Created by Dev on 14/04/2023.
//

import SwiftUI

struct IPhoneMainView: View {
    @StateObject var xtreamManager = XtreamManager.shared
  
    @StateObject var appState = AppState()
    
    var body: some View {
       
            switch  appState.navigationSection {
            case .mainView:
                MainView()
                    .environmentObject(xtreamManager.currentSession)
                    .environmentObject(appState)
                
            case .profilsView:
                ProfilsView(navigationSection: $appState.navigationSection, xtreamManager: xtreamManager)
                    .environmentObject(appState)
                
            case .loginView:
                LoginView()
                    .environmentObject(appState)
                
            case .xtreamLoginView:
                XtreamLoginView()
                    .environmentObject(appState)
            }
        
    }
}

struct IPhoneMainView_Previews: PreviewProvider {
    static var previews: some View {
        IPhoneMainView()
    }
}
