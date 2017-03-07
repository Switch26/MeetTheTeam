//
//  NetworkManager.swift
//  Meet the Team
//
//  Created by Serguei Vinnitskii on 3/7/17.
//  Copyright © 2017 Serguei Vinnitskii. All rights reserved.
//

import Foundation
import AlamofireImage
import SwiftyJSON

enum NetworkManagerError: Error {
    case networkError(String) // associated value enum
    case parsingJSONError
}

struct NetworkManager {
    
    static func fetchTeamMembers(completionHandler: (_ arrayOfTeamMembers: [TeamMember], NetworkManagerError?) -> Void) {
        
        var arrayOfTeamMembersToReturn = [TeamMember]() // create empty array
        
        // Networking code here
        
        
        // Using stored .json instead
        let jsonObject = JSONManager.loadLocalJSONfile(withName: "teams")

        // Make sure JSON is valid
        guard jsonObject != nil else {
            return completionHandler(arrayOfTeamMembersToReturn, NetworkManagerError.parsingJSONError)
        }
        
        // Parsing
        for teamMemberItem in jsonObject!.array! {
            let teamMember = TeamMember(teamMemberDataDictionary: teamMemberItem.dictionaryObject!)
            arrayOfTeamMembersToReturn.append(teamMember)
        }
        
        completionHandler(arrayOfTeamMembersToReturn, nil)
    }
    
    
}



struct JSONManager {
    
    static func loadLocalJSONfile(withName name: String) -> JSON? {
        
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObject = JSON(data: data)
                
                guard jsonObject != JSON.null else {
                    print("Could not get json from file, make sure that file contains valid json.")
                    return nil
                }
                
                return jsonObject
                
            } catch let error {
                print(error.localizedDescription)
                return nil
            }
        } else {
            print("Invalid filename/path.")
            return nil
        }
    }
}

