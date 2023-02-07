//
//  FileManager-DocumentationDirectory.swift
//  BucketList
//
//  Created by Denny Arfansyah on 08/02/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
