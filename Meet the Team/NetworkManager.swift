//
//  NetworkManager.swift
//  Meet the Team
//
//  Created by Serguei Vinnitskii on 3/7/17.
//  Copyright © 2017 Serguei Vinnitskii. All rights reserved.
//

import Foundation
import AlamofireImage

enum NetworkManagerError: Error {
    case networkError(String) // associated value enum
    case serverSideError
}

struct NetworkManager {
    
    static func fetchTeamMembers(completionHandler: (_ arrayOfTeamMembers: [TeamMember], NetworkManagerError?) -> Void) {
        
        var arrayOfTeamMembersToReturn = [TeamMember]() // create empty array
        
        // Networking code here
        
        // Using stored .json instead
        
        let jsonObject = JSONManager.loadJSONfile(withName: "team")
        
        completionHandler(arrayOfTeamMembersToReturn, nil)
    }
    
    
    
    
}

struct JSONManager {
    
    static func loadJSONfile(withName name: String) -> [String: Any] {
        
        var jsonToReturn = [String: Any]()
        
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: [[String : Any]] = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String : Any]]
                    
                    print(jsonResult)
                    
                    //jsonToReturn = jsonResult as! [String : Any]
                    
                } catch {}
            } catch {}
        }
        
        return jsonToReturn
    }

}

