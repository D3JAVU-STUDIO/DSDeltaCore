//
//  DSDeltaCore.swift
//  DSDeltaCore
//
//  Created by Riley Testut on 8/2/19.
//  Copyright © 2019 Riley Testut. All rights reserved.
//

import Foundation
import AVFoundation

import DeltaCore

public extension GameType
{
    static let ds = GameType("com.rileytestut.delta.game.ds")
}

@objc public enum DSGameInput: Int, Input
{
    case up = 1
    case down = 2
    case left = 4
    case right = 8
    case a = 16
    case b = 32
    case x = 64
    case y = 128
    case l = 256
    case r = 512
    case start = 1024
    case select = 2048
    
    case touchScreenX = 4096
    case touchScreenY = 8192
    
    public var type: InputType {
        return .game(.ds)
    }
    
    public var isContinuous: Bool {
        switch self
        {
        case .touchScreenX, .touchScreenY: return true
        default: return false
        }
    }
}

public struct DS: DeltaCoreProtocol
{
    public static let core = DS()
    
    public let gameType = GameType.ds
    
    public let gameInputType: Input.Type = DSGameInput.self
    
    public let gameSaveFileExtension = "dsv"
    
    public var audioFormat: AVAudioFormat {
        return AVAudioFormat(commonFormat: .pcmFormatInt16, sampleRate: 44100, channels: 2, interleaved: true)!
    }
    
    public var videoFormat: VideoFormat {
        return VideoFormat(format: .bitmap(.rgba8), dimensions: CGSize(width: 256, height: 384))
    }
    
    public var supportedCheatFormats: Set<CheatFormat> {
        return []
    }
    
    public let emulatorBridge: EmulatorBridging = DSEmulatorBridge.shared
    
    private init()
    {
    }
}
