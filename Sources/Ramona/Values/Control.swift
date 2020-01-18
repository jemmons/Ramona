import Foundation



public enum Control: Int {
  enum Error: LocalizedError {
    case missingData
    
    var errorDescription: String {
      switch self {
      case .missingData:
        return "There is insufficiant data for this message."
      }
    }
  }
  
  case bankSelectMSB(msb: Int)
  case modulation(msb: Int)
  case breathController(msb: Int)
  case cc3(msb: Int)
  case footController(msb: Int)
  case portamentoTime(msb: Int)
  case coarseDataEntry(msb: Int)
  case channelVolume(msb: Int)
  case balance(msb: Int)
  case cc9(msb: Int)
  case pan(msb: Int)
  case expressionController(msb: Int)
  case effectControl1(msb: Int)
  case effectControl2(msb: Int)
  case cc14(msb: Int)
  case cc15(msb: Int)
  case generalPurposeController1(msb: Int)
  case generalPurposeController2(msb: Int)
  case generalPurposeController3(msb: Int)
  case generalPurposeController4(msb: Int)
  case cc20(msb: Int)
  case cc21(msb: Int)
  case cc22(msb: Int)
  case cc23(msb: Int)
  case cc24(msb: Int)
  case cc25(msb: Int)
  case cc26(msb: Int)
  case cc27(msb: Int)
  case cc28(msb: Int)
  case cc29(msb: Int)
  case cc30(msb: Int)
  case cc31(msb: Int)
  
  case fineBankSelect(lsb: Int)
  case fineModulation(lsb: Int)
  case fineBreathController(lsb: Int)
  case fineCC3(lsb: Int)
  case finefootController(lsb: Int)
  case finePortamentoTime(lsb: Int)
  case fineDataEntry(lsb: Int)
  case fineChannelVolume(lsb: Int)
  case fineBalance(lsb: Int)
  case fineCC9(lsb: Int)
  case finePan(lsb: Int)
  case fineExpressionController(lsb: Int)
  case fineEffectControl1(lsb: Int)
  case fineEffectControl2(lsb: Int)
  case fineCC14(lsb: Int)
  case fineCC15(lsb: Int)
  case fineGeneralPurposeController1(lsb: Int)
  case fineGeneralPurposeController2(lsb: Int)
  case fineGeneralPurposeController3(lsb: Int)
  case fineGeneralPurposeController4(lsb: Int)
  case fineCC20(lsb: Int)
  case fineCC21(lsb: Int)
  case fineCC22(lsb: Int)
  case fineCC23(lsb: Int)
  case fineCC24(lsb: Int)
  case fineCC25(lsb: Int)
  case fineCC26(lsb: Int)
  case fineCC27(lsb: Int)
  case fineCC28(lsb: Int)
  case fineCC29(lsb: Int)
  case fineCC30(lsb: Int)
  case fineCC31(lsb: Int)

  case sustain(onOff: Int)
  case portamento(onOff: Int)
  case sostenuto(onOff: Int)
  case soft(onOff: Int)
  case legato(onOff: Int)
  case hold2(onOff: Int)
  
  case soundController1(value: Int)
  case soundController2(value: Int)
  case soundController3(value: Int)
  case soundController4(value: Int)
  case soundController5(value: Int)
  case soundController6(value: Int)
  case soundController7(value: Int)
  case soundController8(value: Int)
  case soundController9(value: Int)
  case soundController10(value: Int)
  case generalPurposeController5(value: Int)
  case generalPurposeController6(value: Int)
  case generalPurposeController7(value: Int)
  case generalPurposeController8(value: Int)
  case portamentoControl(value: Int)
  case cc85(value: Int)
  case cc86(value: Int)
  case cc87(value: Int)
  case highResolutionVelocityPrefix(lsb: Int)
  case cc89(value: Int)
  case cc90(value: Int)
  
  case effects1Depth
  case effects2Depth
  case effects3Depth
  case effects4Depth
  case effects5Depth
  case dataIncrement
  case dataDecrement
  case nonRegisteredParameterNumberLSB
  case nonRegisteredParameterNumberMSB
  case registeredParameterNumberLSB
  case registeredParameterNumberMSB
  case cc102
  case cc103
  case cc104
  case cc105
  case cc106
  case cc107
  case cc108
  case cc109
  case cc110
  case cc111
  case cc112
  case cc113
  case cc114
  case cc115
  case cc116
  case cc117
  case cc118
  case cc119

  case allSoundOff
  case resetAllControllers
  case localControl
  case allNotesOff
  case omniModeOff
  case omniModeOn
  case monoModeOn
  case polyModeOn
  
  init(data: Data) throws {
    guard let data.count >= 2 else {
      throw Error.missingData
    }
    self = .foo(int: 5)
  }
}
