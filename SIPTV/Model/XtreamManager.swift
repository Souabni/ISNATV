//
//  XtreamManager.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import Foundation

class XtreamManager: ObservableObject{
    public static let sharedInstance = XtreamManager()
    static let shared  = XtreamManager()
    
    var profils : [Profil] = [
        Profil(title: "orca",
                                     link: "",
                                     userName: "",
                                     password: ""),
                              Profil(title: "OTT",
                                     link: "",
                                     userName: "",
                                     password: "")
                                                            ,
                                                            Profil(title: "orca2",
                                                                                                             link: "",
                                                                                                             userName: "",
                                                                                                             password: ""),
                                                                                      Profil(title: "OTT2",
                                                                                                                                       link: "",
                                                                                                                                       userName: "",
                                                                                                                                       password: ""),
                                                            Profil(title: "",
                                                                                                             link: "",
                                                                                                             userName: "",
                                                                                                             password: ""),
                                                                                      Profil(title: "OTT3",
                                                                                                                                       link: "",
                                                                                                                                       userName: "",
                                                                                                                                       password: ""),
                                                            Profil(title: "",
                                                                                                             link: "",
                                                                                                             userName: "",
                                                                                                             password: ""),
                                                                                      Profil(title: "OTT4",
                                                                                                                                       link: "",
                                                                                                                                       userName: "",
                                                                                                                                       password: "")
    ]
    
    
    
    @Published var currentSession = XtreamSession(profil:
                                                    //Profil()
                                                    Profil(title: "orca",
                                                                     link: "",
                                                                     userName: "",
                                                                     password: "")
    )
    
    private init() {
        do {
            if let storedObjItem = UserDefaults.standard.object(forKey: "profils"){
                let storedItems = try JSONDecoder().decode([Profil].self, from: storedObjItem as! Data)
                profils = storedItems
            }
        } catch let err {
            print(err)
        }
    }
    
    
    func add(profil: Profil){
        profils.append(profil)
        currentSession.set(profil: profil)
        
        //Storing Items
        if let encoded = try? JSONEncoder().encode(profils) {
            UserDefaults.standard.set(encoded, forKey: "profils")
        }
    }
    
    func delete(profil: Profil){
        profils.removeAll { $0.title == profil.title }
        //Storing Items
        if let encoded = try? JSONEncoder().encode(profils) {
            UserDefaults.standard.set(encoded, forKey: "profils")
        }
    }
}  
