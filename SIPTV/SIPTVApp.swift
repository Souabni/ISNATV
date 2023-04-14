//
//  SIPTVApp.swift
//  SIPTV
//
//  Created by Dev on 24/08/2022.
//

import SwiftUI

@main
struct SIPTVApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    
    var body: some Scene {
        WindowGroup {
            if UIDevice.current.userInterfaceIdiom == .pad {
                IPADMainView()
            }else{
                IPhoneMainView()
            }
        }
        
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    static var orientationLock = UIInterfaceOrientationMask.all //By default you want all your views to rotate freely
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}

class AppState : ObservableObject{
    @Published var navigationSection : NavigationSection = .loginView
    
    enum NavigationSection{
        case loginView
        case xtreamLoginView
        case profilsView
        case mainView
    }
    
    init(){
        if XtreamManager.shared.profils.count == 0 {
            navigationSection = .loginView
        }else{
            navigationSection = .mainView
        }
    }
}

