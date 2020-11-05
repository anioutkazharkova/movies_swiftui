//
//  IProcessor.swift
//  moviesapp
//
//  Created by Anna Zharkova on 06.11.2020.
//

import Foundation

protocol IProcessor : class {
    func perform(type: IntentType)
}
