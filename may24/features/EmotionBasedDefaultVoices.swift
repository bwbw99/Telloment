//
//  EmotionBasedDefaultVoices.swift
//  may24
//
//  Created by 박진영 on 6/7/24.
//

import Foundation

enum EmotionBasedDefaultVoices: String {
    case CLOVA_SIMPLE = "CLOVA_simple"
    case CLOVA_HAPPY_0 = "CLOVA_happy_0"
    case CLOVA_HAPPY_1 = "CLOVA_happy_1"
    case CLOVA_HAPPY_2 = "CLOVA_happy_2"
    case CLOVA_SAD_0 = "CLOVA_sad_0"
    case CLOVA_SAD_1 = "CLOVA_sad_1"
    case CLOVA_SAD_2 = "CLOVA_sad_2"
    case CLOVA_RAGE_0 = "CLOVA_rage_0"
    case CLOVA_RAGE_1 = "CLOVA_rage_1"
    case CLOVA_RAGE_2 = "CLOVA_rage_2"
    
    static func extractFrom(emotion: String, strength: Int) -> EmotionBasedDefaultVoices {
         switch (emotion, strength) {
         case ("행복", 0):
             return .CLOVA_HAPPY_0
         case ("행복", 1):
             return .CLOVA_HAPPY_1
         case ("행복", 2):
             return .CLOVA_HAPPY_2
         case ("화남", 0):
             return .CLOVA_RAGE_0
         case ("화남", 1):
             return .CLOVA_RAGE_1
         case ("화남", 2):
             return .CLOVA_RAGE_2
         case ("슬픔", 0):
             return .CLOVA_SAD_0
         case ("슬픔", 1):
             return .CLOVA_SAD_1
         case ("슬픔", 2):
             return .CLOVA_SAD_2
         case ("중립", _):
             return .CLOVA_SIMPLE
         default:
             return .CLOVA_SIMPLE
         }
     }}
