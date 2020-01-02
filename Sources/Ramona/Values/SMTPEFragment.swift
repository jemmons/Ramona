import Foundation


public enum SMPTEFragment {
  case leastSignificantFrame(Int)
  case mostSignificantFrame(Int)
  case leastSignificantSecond(Int)
  case mostSignificantSecond(Int)
  case leastSignificantMinute(Int)
  case mostSignificantMinute(Int)
  case leastSignificantHour(Int)
  case mostSignificantHour(Int)
}

