//
//  ViewModel.swift
//  ChaintechPasswordManager
//
//  Created by Shomil Singh on 20/06/24.
//

import Foundation

@Observable
public final class ViewModel{
    enum sheetType : String , Identifiable {
        case edit , add
        var id: String { rawValue }
    }
    var isShowingsheet = false
    var selectedSheetType : sheetType?
    var selectedCredential : Credentials?
}
