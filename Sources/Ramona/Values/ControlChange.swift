import Foundation


public enum ControlChange {
  case bankSelectMSB(msb: ControlChangeValue)
  case modulation(msb: ControlChangeValue)
  case breathController(msb: ControlChangeValue)
  case cc3(msb: ControlChangeValue)
  case footController(msb: ControlChangeValue)
  case portamentoTime(msb: ControlChangeValue)
  case coarseDataEntry(msb: ControlChangeValue)
  case channelVolume(msb: ControlChangeValue)
  case balance(msb: ControlChangeValue)
  case cc9(msb: ControlChangeValue)
  case pan(msb: ControlChangeValue)
  case expressionController(msb: ControlChangeValue)
  case effectControl1(msb: ControlChangeValue)
  case effectControl2(msb: ControlChangeValue)
  case cc14(msb: ControlChangeValue)
  case cc15(msb: ControlChangeValue)
  case generalPurposeController1(msb: ControlChangeValue)
  case generalPurposeController2(msb: ControlChangeValue)
  case generalPurposeController3(msb: ControlChangeValue)
  case generalPurposeController4(msb: ControlChangeValue)
  case cc20(msb: ControlChangeValue)
  case cc21(msb: ControlChangeValue)
  case cc22(msb: ControlChangeValue)
  case cc23(msb: ControlChangeValue)
  case cc24(msb: ControlChangeValue)
  case cc25(msb: ControlChangeValue)
  case cc26(msb: ControlChangeValue)
  case cc27(msb: ControlChangeValue)
  case cc28(msb: ControlChangeValue)
  case cc29(msb: ControlChangeValue)
  case cc30(msb: ControlChangeValue)
  case cc31(msb: ControlChangeValue)
  
  case fineBankSelect(lsb: ControlChangeValue)
  case fineModulation(lsb: ControlChangeValue)
  case fineBreathController(lsb: ControlChangeValue)
  case fineCC3(lsb: ControlChangeValue)
  case finefootController(lsb: ControlChangeValue)
  case finePortamentoTime(lsb: ControlChangeValue)
  case fineDataEntry(lsb: ControlChangeValue)
  case fineChannelVolume(lsb: ControlChangeValue)
  case fineBalance(lsb: ControlChangeValue)
  case fineCC9(lsb: ControlChangeValue)
  case finePan(lsb: ControlChangeValue)
  case fineExpressionController(lsb: ControlChangeValue)
  case fineEffectControl1(lsb: ControlChangeValue)
  case fineEffectControl2(lsb: ControlChangeValue)
  case fineCC14(lsb: ControlChangeValue)
  case fineCC15(lsb: ControlChangeValue)
  case fineGeneralPurposeController1(lsb: ControlChangeValue)
  case fineGeneralPurposeController2(lsb: ControlChangeValue)
  case fineGeneralPurposeController3(lsb: ControlChangeValue)
  case fineGeneralPurposeController4(lsb: ControlChangeValue)
  case fineCC20(lsb: ControlChangeValue)
  case fineCC21(lsb: ControlChangeValue)
  case fineCC22(lsb: ControlChangeValue)
  case fineCC23(lsb: ControlChangeValue)
  case fineCC24(lsb: ControlChangeValue)
  case fineCC25(lsb: ControlChangeValue)
  case fineCC26(lsb: ControlChangeValue)
  case fineCC27(lsb: ControlChangeValue)
  case fineCC28(lsb: ControlChangeValue)
  case fineCC29(lsb: ControlChangeValue)
  case fineCC30(lsb: ControlChangeValue)
  case fineCC31(lsb: ControlChangeValue)
  
  case sustain(onOff: ControlChangeValue)
  case portamento(onOff: ControlChangeValue)
  case sostenuto(onOff: ControlChangeValue)
  case soft(onOff: ControlChangeValue)
  case legato(onOff: ControlChangeValue)
  case hold2(onOff: ControlChangeValue)
  
  case soundController1(value: ControlChangeValue)
  case soundController2(value: ControlChangeValue)
  case soundController3(value: ControlChangeValue)
  case soundController4(value: ControlChangeValue)
  case soundController5(value: ControlChangeValue)
  case soundController6(value: ControlChangeValue)
  case soundController7(value: ControlChangeValue)
  case soundController8(value: ControlChangeValue)
  case soundController9(value: ControlChangeValue)
  case soundController10(value: ControlChangeValue)
  case generalPurposeController5(value: ControlChangeValue)
  case generalPurposeController6(value: ControlChangeValue)
  case generalPurposeController7(value: ControlChangeValue)
  case generalPurposeController8(value: ControlChangeValue)
  case portamentoControl(value: ControlChangeValue)
  case cc85(value: ControlChangeValue)
  case cc86(value: ControlChangeValue)
  case cc87(value: ControlChangeValue)
  case highResolutionVelocityPrefix(lsb: ControlChangeValue)
  case cc89(value: ControlChangeValue)
  case cc90(value: ControlChangeValue)
  
  case effects1Depth(value: ControlChangeValue)
  case effects2Depth(value: ControlChangeValue)
  case effects3Depth(value: ControlChangeValue)
  case effects4Depth(value: ControlChangeValue)
  case effects5Depth(value: ControlChangeValue)
  case dataIncrement(unused: ControlChangeValue)
  case dataDecrement(unused: ControlChangeValue)
  case nonRegisteredParameterNumberLSB(lsb: ControlChangeValue)
  case nonRegisteredParameterNumberMSB(msb: ControlChangeValue)
  case registeredParameterNumberLSB(lsb: ControlChangeValue)
  case registeredParameterNumberMSB(msb: ControlChangeValue)
  case cc102(value: ControlChangeValue)
  case cc103(value: ControlChangeValue)
  case cc104(value: ControlChangeValue)
  case cc105(value: ControlChangeValue)
  case cc106(value: ControlChangeValue)
  case cc107(value: ControlChangeValue)
  case cc108(value: ControlChangeValue)
  case cc109(value: ControlChangeValue)
  case cc110(value: ControlChangeValue)
  case cc111(value: ControlChangeValue)
  case cc112(value: ControlChangeValue)
  case cc113(value: ControlChangeValue)
  case cc114(value: ControlChangeValue)
  case cc115(value: ControlChangeValue)
  case cc116(value: ControlChangeValue)
  case cc117(value: ControlChangeValue)
  case cc118(value: ControlChangeValue)
  case cc119(value: ControlChangeValue)
  
  case allSoundOff(unused: ControlChangeValue)
  case resetAllControllers(unused: ControlChangeValue)
  case localControl(onOff: ControlChangeValue)
  case allNotesOff(unused: ControlChangeValue)
  case omniModeOff(unused: ControlChangeValue)
  case omniModeOn(unused: ControlChangeValue)
  case monoModeOn(value: ControlChangeValue)
  case polyModeOn(unused: ControlChangeValue)
  
  init(controlType: DataByte, data: DataByte) throws {
    let ccValue = ControlChangeValue(data)
    switch controlType.value {
    case 0: self = .bankSelectMSB(msb: ccValue)
    case 1: self = .modulation(msb: ccValue)
    case 2: self = .breathController(msb: ccValue)
    case 3: self = .cc3(msb: ccValue)
    case 4: self = .footController(msb: ccValue)
    case 5: self = .portamentoTime(msb: ccValue)
    case 6: self = .coarseDataEntry(msb: ccValue)
    case 7: self = .channelVolume(msb: ccValue)
    case 8: self = .balance(msb: ccValue)
    case 9: self = .cc9(msb: ccValue)
    case 10: self = .pan(msb: ccValue)
    case 11: self = .expressionController(msb: ccValue)
    case 12: self = .effectControl1(msb: ccValue)
    case 13: self = .effectControl2(msb: ccValue)
    case 14: self = .cc14(msb: ccValue)
    case 15: self = .cc15(msb: ccValue)
    case 16: self = .generalPurposeController1(msb: ccValue)
    case 17: self = .generalPurposeController2(msb: ccValue)
    case 18: self = .generalPurposeController3(msb: ccValue)
    case 19: self = .generalPurposeController4(msb: ccValue)
    case 20: self = .cc20(msb: ccValue)
    case 21: self = .cc21(msb: ccValue)
    case 22: self = .cc22(msb: ccValue)
    case 23: self = .cc23(msb: ccValue)
    case 24: self = .cc24(msb: ccValue)
    case 25: self = .cc25(msb: ccValue)
    case 26: self = .cc26(msb: ccValue)
    case 27: self = .cc27(msb: ccValue)
    case 28: self = .cc28(msb: ccValue)
    case 29: self = .cc29(msb: ccValue)
    case 30: self = .cc30(msb: ccValue)
    case 31: self = .cc31(msb: ccValue)
    case 32: self = .fineBankSelect(lsb: ccValue)
    case 33: self = .fineModulation(lsb: ccValue)
    case 34: self = .fineBreathController(lsb: ccValue)
    case 35: self = .fineCC3(lsb: ccValue)
    case 36: self = .finefootController(lsb: ccValue)
    case 37: self = .finePortamentoTime(lsb: ccValue)
    case 38: self = .fineDataEntry(lsb: ccValue)
    case 39: self = .fineChannelVolume(lsb: ccValue)
    case 40: self = .fineBalance(lsb: ccValue)
    case 41: self = .fineCC9(lsb: ccValue)
    case 42: self = .finePan(lsb: ccValue)
    case 43: self = .fineExpressionController(lsb: ccValue)
    case 44: self = .fineEffectControl1(lsb: ccValue)
    case 45: self = .fineEffectControl2(lsb: ccValue)
    case 46: self = .fineCC14(lsb: ccValue)
    case 47: self = .fineCC15(lsb: ccValue)
    case 48: self = .fineGeneralPurposeController1(lsb: ccValue)
    case 49: self = .fineGeneralPurposeController2(lsb: ccValue)
    case 50: self = .fineGeneralPurposeController3(lsb: ccValue)
    case 51: self = .fineGeneralPurposeController4(lsb: ccValue)
    case 52: self = .fineCC20(lsb: ccValue)
    case 53: self = .fineCC21(lsb: ccValue)
    case 54: self = .fineCC22(lsb: ccValue)
    case 55: self = .fineCC23(lsb: ccValue)
    case 56: self = .fineCC24(lsb: ccValue)
    case 57: self = .fineCC25(lsb: ccValue)
    case 58: self = .fineCC26(lsb: ccValue)
    case 59: self = .fineCC27(lsb: ccValue)
    case 60: self = .fineCC28(lsb: ccValue)
    case 61: self = .fineCC29(lsb: ccValue)
    case 62: self = .fineCC30(lsb: ccValue)
    case 63: self = .fineCC31(lsb: ccValue)
    case 64: self = .sustain(onOff: ccValue)
    case 65: self = .portamento(onOff: ccValue)
    case 66: self = .sostenuto(onOff: ccValue)
    case 67: self = .soft(onOff: ccValue)
    case 68: self = .legato(onOff: ccValue)
    case 69: self = .hold2(onOff: ccValue)
    case 70: self = .soundController1(value: ccValue)
    case 71: self = .soundController2(value: ccValue)
    case 72: self = .soundController3(value: ccValue)
    case 73: self = .soundController4(value: ccValue)
    case 74: self = .soundController5(value: ccValue)
    case 75: self = .soundController6(value: ccValue)
    case 76: self = .soundController7(value: ccValue)
    case 77: self = .soundController8(value: ccValue)
    case 78: self = .soundController9(value: ccValue)
    case 79: self = .soundController10(value: ccValue)
    case 80: self = .generalPurposeController5(value: ccValue)
    case 81: self = .generalPurposeController6(value: ccValue)
    case 82: self = .generalPurposeController7(value: ccValue)
    case 83: self = .generalPurposeController8(value: ccValue)
    case 84: self = .portamentoControl(value: ccValue)
    case 85: self = .cc85(value: ccValue)
    case 86: self = .cc86(value: ccValue)
    case 87: self = .cc87(value: ccValue)
    case 88: self = .highResolutionVelocityPrefix(lsb: ccValue)
    case 89: self = .cc89(value: ccValue)
    case 90: self = .cc90(value: ccValue)
    case 91: self = .effects1Depth(value: ccValue)
    case 92: self = .effects2Depth(value: ccValue)
    case 93: self = .effects3Depth(value: ccValue)
    case 94: self = .effects4Depth(value: ccValue)
    case 95: self = .effects5Depth(value: ccValue)
    case 96: self = .dataIncrement(unused: ccValue)
    case 97: self = .dataDecrement(unused: ccValue)
    case 98: self = .nonRegisteredParameterNumberLSB(lsb: ccValue)
    case 99: self = .nonRegisteredParameterNumberMSB(msb: ccValue)
    case 100: self = .registeredParameterNumberLSB(lsb: ccValue)
    case 101: self = .registeredParameterNumberMSB(msb: ccValue)
    case 102: self = .cc102(value: ccValue)
    case 103: self = .cc103(value: ccValue)
    case 104: self = .cc104(value: ccValue)
    case 105: self = .cc105(value: ccValue)
    case 106: self = .cc106(value: ccValue)
    case 107: self = .cc107(value: ccValue)
    case 108: self = .cc108(value: ccValue)
    case 109: self = .cc109(value: ccValue)
    case 110: self = .cc110(value: ccValue)
    case 111: self = .cc111(value: ccValue)
    case 112: self = .cc112(value: ccValue)
    case 113: self = .cc113(value: ccValue)
    case 114: self = .cc114(value: ccValue)
    case 115: self = .cc115(value: ccValue)
    case 116: self = .cc116(value: ccValue)
    case 117: self = .cc117(value: ccValue)
    case 118: self = .cc118(value: ccValue)
    case 119: self = .cc119(value: ccValue)
    case 120: self = .allSoundOff(unused: ccValue)
    case 121: self = .resetAllControllers(unused: ccValue)
    case 122: self = .localControl(onOff: ccValue)
    case 123: self = .allNotesOff(unused: ccValue)
    case 124: self = .omniModeOff(unused: ccValue)
    case 125: self = .omniModeOn(unused: ccValue)
    case 126: self = .monoModeOn(value: ccValue)
    case 127: self = .polyModeOn(unused: ccValue)
    default: fatalError("Control change outside of 7-bit range")
    }
  }
}



public extension ControlChange {
  var data: Data {
    switch self {
    case .bankSelectMSB(msb: let v):
      return Data(byte1:0, byte2: v.byte)
    case .modulation(msb: let v):
      return Data(byte1:1, byte2: v.byte)

    case .breathController(msb: let v):
      return Data(byte1:2, byte2: v.byte)

    case .cc3(msb: let v):
      return Data(byte1:3, byte2: v.byte)

    case .footController(msb: let v):
      return Data(byte1:4, byte2: v.byte)
      
    case .portamentoTime(msb: let v):
      return Data(byte1:5, byte2: v.byte)
      
    case .coarseDataEntry(msb: let v):
      return Data(byte1:6, byte2: v.byte)
      
    case .channelVolume(msb: let v):
      return Data(byte1:7, byte2: v.byte)
      
    case .balance(msb: let v):
      return Data(byte1:8, byte2: v.byte)
      
    case .cc9(msb: let v):
      return Data(byte1:9, byte2: v.byte)
      
    case .pan(msb: let v):
      return Data(byte1:10, byte2: v.byte)
      
    case .expressionController(msb: let v):
      return Data(byte1:11, byte2: v.byte)
      
    case .effectControl1(msb: let v):
      return Data(byte1:12, byte2: v.byte)
      
    case .effectControl2(msb: let v):
      return Data(byte1:13, byte2: v.byte)
      
    case .cc14(msb: let v):
      return Data(byte1:14, byte2: v.byte)
      
    case .cc15(msb: let v):
      return Data(byte1:15, byte2: v.byte)
      
    case .generalPurposeController1(msb: let v):
      return Data(byte1:16, byte2: v.byte)
      
    case .generalPurposeController2(msb: let v):
      return Data(byte1:17, byte2: v.byte)
      
    case .generalPurposeController3(msb: let v):
      return Data(byte1:18, byte2: v.byte)
      
    case .generalPurposeController4(msb: let v):
      return Data(byte1:19, byte2: v.byte)
      
    case .cc20(msb: let v):
      return Data(byte1:20, byte2: v.byte)
      
    case .cc21(msb: let v):
      return Data(byte1:21, byte2: v.byte)
      
    case .cc22(msb: let v):
      return Data(byte1:22, byte2: v.byte)
      
    case .cc23(msb: let v):
      return Data(byte1:23, byte2: v.byte)
      
    case .cc24(msb: let v):
      return Data(byte1:24, byte2: v.byte)
      
    case .cc25(msb: let v):
      return Data(byte1:25, byte2: v.byte)
      
    case .cc26(msb: let v):
      return Data(byte1:26, byte2: v.byte)
      
    case .cc27(msb: let v):
      return Data(byte1:27, byte2: v.byte)
      
    case .cc28(msb: let v):
      return Data(byte1:28, byte2: v.byte)
      
    case .cc29(msb: let v):
      return Data(byte1:29, byte2: v.byte)
      
    case .cc30(msb: let v):
      return Data(byte1:30, byte2: v.byte)
      
    case .cc31(msb: let v):
      return Data(byte1:31, byte2: v.byte)
      
      
    case .fineBankSelect(lsb: let v):
      return Data(byte1:32, byte2: v.byte)
      
    case .fineModulation(lsb: let v):
      return Data(byte1:33, byte2: v.byte)
      
    case .fineBreathController(lsb: let v):
      return Data(byte1:34, byte2: v.byte)
      
    case .fineCC3(lsb: let v):
      return Data(byte1:35, byte2: v.byte)
      
    case .finefootController(lsb: let v):
      return Data(byte1:36, byte2: v.byte)
      
    case .finePortamentoTime(lsb: let v):
      return Data(byte1:37, byte2: v.byte)
      
    case .fineDataEntry(lsb: let v):
      return Data(byte1:38, byte2: v.byte)
      
    case .fineChannelVolume(lsb: let v):
      return Data(byte1:39, byte2: v.byte)
      
    case .fineBalance(lsb: let v):
      return Data(byte1:40, byte2: v.byte)
      
    case .fineCC9(lsb: let v):
      return Data(byte1:41, byte2: v.byte)
      
    case .finePan(lsb: let v):
      return Data(byte1:42, byte2: v.byte)
      
    case .fineExpressionController(lsb: let v):
      return Data(byte1:43, byte2: v.byte)
      
    case .fineEffectControl1(lsb: let v):
      return Data(byte1:44, byte2: v.byte)
      
    case .fineEffectControl2(lsb: let v):
      return Data(byte1:45, byte2: v.byte)
      
    case .fineCC14(lsb: let v):
      return Data(byte1:46, byte2: v.byte)
      
    case .fineCC15(lsb: let v):
      return Data(byte1:47, byte2: v.byte)
      
    case .fineGeneralPurposeController1(lsb: let v):
      return Data(byte1:48, byte2: v.byte)
      
    case .fineGeneralPurposeController2(lsb: let v):
      return Data(byte1:49, byte2: v.byte)
      
    case .fineGeneralPurposeController3(lsb: let v):
      return Data(byte1:50, byte2: v.byte)
      
    case .fineGeneralPurposeController4(lsb: let v):
      return Data(byte1:51, byte2: v.byte)
      
    case .fineCC20(lsb: let v):
      return Data(byte1:52, byte2: v.byte)
      
    case .fineCC21(lsb: let v):
      return Data(byte1:53, byte2: v.byte)
      
    case .fineCC22(lsb: let v):
      return Data(byte1:54, byte2: v.byte)
      
    case .fineCC23(lsb: let v):
      return Data(byte1:55, byte2: v.byte)
      
    case .fineCC24(lsb: let v):
      return Data(byte1:56, byte2: v.byte)
      
    case .fineCC25(lsb: let v):
      return Data(byte1:57, byte2: v.byte)
      
    case .fineCC26(lsb: let v):
      return Data(byte1:58, byte2: v.byte)
      
    case .fineCC27(lsb: let v):
      return Data(byte1:59, byte2: v.byte)
      
    case .fineCC28(lsb: let v):
      return Data(byte1:60, byte2: v.byte)
      
    case .fineCC29(lsb: let v):
      return Data(byte1:61, byte2: v.byte)
      
    case .fineCC30(lsb: let v):
      return Data(byte1:62, byte2: v.byte)
      
    case .fineCC31(lsb: let v):
      return Data(byte1:63, byte2: v.byte)
      
      
    case .sustain(onOff: let v):
      return Data(byte1:64, byte2: v.byte)
      
    case .portamento(onOff: let v):
      return Data(byte1:65, byte2: v.byte)
      
    case .sostenuto(onOff: let v):
      return Data(byte1:66, byte2: v.byte)
      
    case .soft(onOff: let v):
      return Data(byte1:67, byte2: v.byte)
      
    case .legato(onOff: let v):
      return Data(byte1:68, byte2: v.byte)
      
    case .hold2(onOff: let v):
      return Data(byte1:69, byte2: v.byte)
      
      
    case .soundController1(value: let v):
      return Data(byte1:70, byte2: v.byte)
      
    case .soundController2(value: let v):
      return Data(byte1:71, byte2: v.byte)
      
    case .soundController3(value: let v):
      return Data(byte1:72, byte2: v.byte)
      
    case .soundController4(value: let v):
      return Data(byte1:73, byte2: v.byte)
      
    case .soundController5(value: let v):
      return Data(byte1:74, byte2: v.byte)
      
    case .soundController6(value: let v):
      return Data(byte1:75, byte2: v.byte)
      
    case .soundController7(value: let v):
      return Data(byte1:76, byte2: v.byte)
      
    case .soundController8(value: let v):
      return Data(byte1:77, byte2: v.byte)
      
    case .soundController9(value: let v):
      return Data(byte1:78, byte2: v.byte)
      
    case .soundController10(value: let v):
      return Data(byte1:79, byte2: v.byte)
      
    case .generalPurposeController5(value: let v):
      return Data(byte1:80, byte2: v.byte)
      
    case .generalPurposeController6(value: let v):
      return Data(byte1:81, byte2: v.byte)
      
    case .generalPurposeController7(value: let v):
      return Data(byte1:82, byte2: v.byte)
      
    case .generalPurposeController8(value: let v):
      return Data(byte1:83, byte2: v.byte)
      
    case .portamentoControl(value: let v):
      return Data(byte1:84, byte2: v.byte)
      
    case .cc85(value: let v):
      return Data(byte1:85, byte2: v.byte)
      
    case .cc86(value: let v):
      return Data(byte1:86, byte2: v.byte)
      
    case .cc87(value: let v):
      return Data(byte1:87, byte2: v.byte)
      
    case .highResolutionVelocityPrefix(lsb: let v):
      return Data(byte1:88, byte2: v.byte)
      
    case .cc89(value: let v):
      return Data(byte1:89, byte2: v.byte)
      
    case .cc90(value: let v):
      return Data(byte1:90, byte2: v.byte)
      
      
    case .effects1Depth(value: let v):
      return Data(byte1:91, byte2: v.byte)
      
    case .effects2Depth(value: let v):
      return Data(byte1:92, byte2: v.byte)
      
    case .effects3Depth(value: let v):
      return Data(byte1:93, byte2: v.byte)
      
    case .effects4Depth(value: let v):
      return Data(byte1:94, byte2: v.byte)
      
    case .effects5Depth(value: let v):
      return Data(byte1:95, byte2: v.byte)
      
    case .dataIncrement(unused: let v):
      return Data(byte1:96, byte2: v.byte)
      
    case .dataDecrement(unused: let v):
      return Data(byte1:97, byte2: v.byte)
      
    case .nonRegisteredParameterNumberLSB(lsb: let v):
      return Data(byte1:98, byte2: v.byte)
      
    case .nonRegisteredParameterNumberMSB(msb: let v):
      return Data(byte1:99, byte2: v.byte)
      
    case .registeredParameterNumberLSB(lsb: let v):
      return Data(byte1:100, byte2: v.byte)
      
    case .registeredParameterNumberMSB(msb: let v):
      return Data(byte1:101, byte2: v.byte)
      
    case .cc102(value: let v):
      return Data(byte1:102, byte2: v.byte)
      
    case .cc103(value: let v):
      return Data(byte1:103, byte2: v.byte)
      
    case .cc104(value: let v):
      return Data(byte1:104, byte2: v.byte)
      
    case .cc105(value: let v):
      return Data(byte1:105, byte2: v.byte)
      
    case .cc106(value: let v):
      return Data(byte1:106, byte2: v.byte)
      
    case .cc107(value: let v):
      return Data(byte1:107, byte2: v.byte)
      
    case .cc108(value: let v):
      return Data(byte1:108, byte2: v.byte)
      
    case .cc109(value: let v):
      return Data(byte1:109, byte2: v.byte)
      
    case .cc110(value: let v):
      return Data(byte1:110, byte2: v.byte)
      
    case .cc111(value: let v):
      return Data(byte1:111, byte2: v.byte)
      
    case .cc112(value: let v):
      return Data(byte1:112, byte2: v.byte)
      
    case .cc113(value: let v):
      return Data(byte1:113, byte2: v.byte)
      
    case .cc114(value: let v):
      return Data(byte1:114, byte2: v.byte)
      
    case .cc115(value: let v):
      return Data(byte1:115, byte2: v.byte)
      
    case .cc116(value: let v):
      return Data(byte1:116, byte2: v.byte)
      
    case .cc117(value: let v):
      return Data(byte1:117, byte2: v.byte)
      
    case .cc118(value: let v):
      return Data(byte1:118, byte2: v.byte)
      
    case .cc119(value: let v):
      return Data(byte1:119, byte2: v.byte)
      
      
    case .allSoundOff(unused: let v):
      return Data(byte1:120, byte2: v.byte)
      
    case .resetAllControllers(unused: let v):
      return Data(byte1:121, byte2: v.byte)
      
    case .localControl(onOff: let v):
      return Data(byte1:122, byte2: v.byte)
      
    case .allNotesOff(unused: let v):
      return Data(byte1:123, byte2: v.byte)
      
    case .omniModeOff(unused: let v):
      return Data(byte1:124, byte2: v.byte)
      
    case .omniModeOn(unused: let v):
      return Data(byte1:125, byte2: v.byte)
      
    case .monoModeOn(value: let v):
      return Data(byte1:126, byte2: v.byte)
      
    case .polyModeOn(unused: let v):
      return Data(byte1:127, byte2: v.byte)
    }
  }
}
