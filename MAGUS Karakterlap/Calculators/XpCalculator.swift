//
//  XpCalculator.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 17/09/2022.
//

import Foundation

class XpCalculator {
    
    static func xpCalculator(charXp: Int64, secCaste: String) -> Int {
        
        var level = 1
        
        if secCaste == "Harcos" {
            switch charXp {
            case 0...160:
                level = 1
            case 161...320:
                level = 2
            case 321...640:
                level = 3
            case 641...1440:
                level = 4
            case 1441...2800:
                level = 5
            case 2801...5600:
                level = 6
            case 5601...10000:
                level = 7
            case 10001...20000:
                level = 8
            case 20001...40000:
                level = 9
            case 40001...60000:
                level = 10
            case 60001...80000:
                level = 11
            case 80001...112000:
                level = 12
            case 112001...charXp:
                let plusTp = 31200
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Gladiátor" {
            switch charXp {
            case 0...188:
                level = 1
            case 189...376:
                level = 2
            case 377...825:
                level = 3
            case 826...1650:
                level = 4
            case 1651...3300:
                level = 5
            case 3301...7250:
                level = 6
            case 7251...12050:
                level = 7
            case 12051...24000:
                level = 8
            case 24001...48000:
                level = 9
            case 48001...68000:
                level = 10
            case 68001...93000:
                level = 11
            case 93001...130000:
                level = 12
            case 130001...charXp:
                let plusTp = 40000
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Fejvadász" {
            switch charXp {
            case 0...190:
                level = 1
            case 191...400:
                level = 2
            case 401...900:
                level = 3
            case 901...1800:
                level = 4
            case 1801...3500:
                level = 5
            case 3501...7500:
                level = 6
            case 7501...15000:
                level = 7
            case 15001...30000:
                level = 8
            case 30001...60000:
                level = 9
            case 60001...110000:
                level = 10
            case 110001...160000:
                level = 11
            case 160001...220000:
                level = 12
            case 220001...charXp:
                let plusTp = 60000
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Lovag" {
            switch charXp {
            case 0...180:
                level = 1
            case 191...370:
                level = 2
            case 371...800:
                level = 3
            case 801...1650:
                level = 4
            case 1651...3200:
                level = 5
            case 3201...6400:
                level = 6
            case 6401...12000:
                level = 7
            case 12001...25000:
                level = 8
            case 25001...45000:
                level = 9
            case 45001...65000:
                level = 10
            case 65001...90000:
                level = 11
            case 90001...110000:
                level = 12
            case 110001...charXp:
                let plusTp = 35000
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        }  else if secCaste == "Amazon" {
            switch charXp {
            case 0...185:
                level = 1
            case 191...372:
                level = 2
            case 373...744:
                level = 3
            case 745...1488:
                level = 4
            case 1489...2976:
                level = 5
            case 2977...5952:
                level = 6
            case 5953...11900:
                level = 7
            case 11901...23800:
                level = 8
            case 23801...47600:
                level = 9
            case 47601...71400:
                level = 10
            case 71401...101000:
                level = 11
            case 101001...151000:
                level = 12
            case 151001...charXp:
                let plusTp = 40500
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Barbár" {
            switch charXp {
            case 0...150:
                level = 1
            case 151...310:
                level = 2
            case 311...630:
                level = 3
            case 631...1300:
                level = 4
            case 1301...2700:
                level = 5
            case 2701...5400:
                level = 6
            case 5401...10800:
                level = 7
            case 10801...21600:
                level = 8
            case 21601...42000:
                level = 9
            case 42001...65000:
                level = 10
            case 65001...90000:
                level = 11
            case 90001...120000:
                level = 12
            case 120001...charXp:
                let plusTp = 32500
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Bajvívó" {
            switch charXp {
            case 0...165:
                level = 1
            case 151...330:
                level = 2
            case 331...660:
                level = 3
            case 661...1485:
                level = 4
            case 1486...2900:
                level = 5
            case 2901...5800:
                level = 6
            case 5801...11000:
                level = 7
            case 11001...22000:
                level = 8
            case 22001...45000:
                level = 9
            case 45001...67500:
                level = 10
            case 67501...90000:
                level = 11
            case 90001...136000:
                level = 12
            case 136001...charXp:
                let plusTp = 40000
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Tolvaj" {
            switch charXp {
            case 0...100:
                level = 1
            case 101...202:
                level = 2
            case 203...400:
                level = 3
            case 401...802:
                level = 4
            case 803...1700:
                level = 5
            case 1701...4500:
                level = 6
            case 4501...9000:
                level = 7
            case 9001...22000:
                level = 8
            case 22001...46500:
                level = 9
            case 46501...68500:
                level = 10
            case 68501...88000:
                level = 11
            case 88001...131500:
                level = 12
            case 131501...charXp:
                let plusTp = 33500
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Bárd" {
            switch charXp {
            case 0...170:
                level = 1
            case 171...350:
                level = 2
            case 351...1000:
                level = 3
            case 1001...2200:
                level = 4
            case 2201...4400:
                level = 5
            case 4401...7500:
                level = 6
            case 7501...15000:
                level = 7
            case 15001...30000:
                level = 8
            case 30001...55000:
                level = 9
            case 55001...75000:
                level = 10
            case 75001...95000:
                level = 11
            case 95001...145000:
                level = 12
            case 145001...charXp:
                let plusTp = 40000
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Pap" {
            switch charXp {
            case 0...160:
                level = 1
            case 161...330:
                level = 2
            case 331...660:
                level = 3
            case 661...1300:
                level = 4
            case 1301...2600:
                level = 5
            case 2601...5000:
                level = 6
            case 5001...9000:
                level = 7
            case 9001...23000:
                level = 8
            case 23001...50000:
                level = 9
            case 50001...90000:
                level = 10
            case 90001...130000:
                level = 11
            case 130001...165000:
                level = 12
            case 165001...charXp:
                let plusTp = 50000
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Paplovag" {
            switch charXp {
            case 0...175:
                level = 1
            case 176...352:
                level = 2
            case 353...720:
                level = 3
            case 721...1500:
                level = 4
            case 1501...3500:
                level = 5
            case 3501...7000:
                level = 6
            case 7001...10500:
                level = 7
            case 10501...21000:
                level = 8
            case 21001...48000:
                level = 9
            case 48001...78000:
                level = 10
            case 78001...108000:
                level = 11
            case 108001...138000:
                level = 12
            case 138001...charXp:
                let plusTp = 38000
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Szerzetes" {
            switch charXp {
            case 0...200:
                level = 1
            case 201...400:
                level = 2
            case 401...800:
                level = 3
            case 801...1600:
                level = 4
            case 1601...4000:
                level = 5
            case 4001...8000:
                level = 6
            case 8001...16000:
                level = 7
            case 16001...32000:
                level = 8
            case 32001...59000:
                level = 9
            case 59001...90500:
                level = 10
            case 90501...140000:
                level = 11
            case 140001...190000:
                level = 12
            case 190001...charXp:
                let plusTp = 55000
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Sámán" {
            switch charXp {
            case 0...165:
                level = 1
            case 166...340:
                level = 2
            case 341...690:
                level = 3
            case 691...1450:
                level = 4
            case 1451...3500:
                level = 5
            case 3501...7650:
                level = 6
            case 7651...13800:
                level = 7
            case 13801...27000:
                level = 8
            case 27001...50000:
                level = 9
            case 50001...97500:
                level = 10
            case 97501...147000:
                level = 11
            case 147001...192000:
                level = 12
            case 192001...charXp:
                let plusTp = 55000
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Harcművész" {
            switch charXp {
            case 0...220:
                level = 1
            case 221...442:
                level = 2
            case 443...950:
                level = 3
            case 951...2000:
                level = 4
            case 2001...4500:
                level = 5
            case 4501...9000:
                level = 6
            case 9001...16000:
                level = 7
            case 16001...32000:
                level = 8
            case 32001...65000:
                level = 9
            case 65001...120000:
                level = 10
            case 120001...170000:
                level = 11
            case 170001...240000:
                level = 12
            case 240001...charXp:
                let plusTp = 65000
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Kardművész" {
            switch charXp {
            case 0...200:
                level = 1
            case 201...400:
                level = 2
            case 401...925:
                level = 3
            case 926...1900:
                level = 4
            case 1901...4000:
                level = 5
            case 4001...8250:
                level = 6
            case 8251...15500:
                level = 7
            case 15501...31000:
                level = 8
            case 31001...62000:
                level = 9
            case 62001...115000:
                level = 10
            case 115001...165000:
                level = 11
            case 165001...230000:
                level = 12
            case 230001...charXp:
                let plusTp = 62000
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Boszorkány" {
            switch charXp {
            case 0...150:
                level = 1
            case 151...300:
                level = 2
            case 301...600:
                level = 3
            case 601...1000:
                level = 4
            case 1001...2000:
                level = 5
            case 2001...4000:
                level = 6
            case 4001...9000:
                level = 7
            case 9001...17000:
                level = 8
            case 17001...38500:
                level = 9
            case 38501...58500:
                level = 10
            case 58501...78500:
                level = 11
            case 78501...108500:
                level = 12
            case 108501...charXp:
                let plusTp = 31500
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Boszorkánymester" {
            switch charXp {
            case 0...200:
                level = 1
            case 201...400:
                level = 2
            case 401...800:
                level = 3
            case 801...1600:
                level = 4
            case 1601...4000:
                level = 5
            case 4001...8000:
                level = 6
            case 8001...16000:
                level = 7
            case 16001...32000:
                level = 8
            case 32001...59000:
                level = 9
            case 59001...90500:
                level = 10
            case 90501...140000:
                level = 11
            case 140001...190000:
                level = 12
            case 190001...charXp:
                let plusTp = 55000
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Tűzvarázsló" {
            switch charXp {
            case 0...170:
                level = 1
            case 171...350:
                level = 2
            case 351...700:
                level = 3
            case 701...1500:
                level = 4
            case 1501...3000:
                level = 5
            case 3001...7000:
                level = 6
            case 7001...12000:
                level = 7
            case 12001...22000:
                level = 8
            case 22001...52500:
                level = 9
            case 52501...85500:
                level = 10
            case 85501...135000:
                level = 11
            case 135001...175500:
                level = 12
            case 175501...charXp:
                let plusTp = 58500
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        } else if secCaste == "Varázsló" {
            switch charXp {
            case 0...230:
                level = 1
            case 231...500:
                level = 2
            case 501...1000:
                level = 3
            case 1001...2200:
                level = 4
            case 2201...5000:
                level = 5
            case 5001...10000:
                level = 6
            case 10001...18000:
                level = 7
            case 18001...35000:
                level = 8
            case 35001...70000:
                level = 9
            case 70001...150000:
                level = 10
            case 150001...200000:
                level = 11
            case 200001...300000:
                level = 12
            case 300001...charXp:
                let plusTp = 80000
                level = 11 + (Int(charXp) - plusTp) / plusTp
            default:
                fatalError("error")
            }
        }
        return level
    }
}

class XpStartLevCalc {
    
    static func xpStartLevCalc(secCaste: String, lvl: Int) -> Int {
        
        var xp = 0
        
        if secCaste == "Harcos" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 161
            case 3:
                xp = 321
            case 4:
                xp = 641
            case 5:
                xp = 1441
            case 6:
                xp = 2801
            case 7:
                xp = 5601
            case 8:
                xp = 10001
            case 9:
                xp = 20001
            case 10:
                xp = 40001
            case 11:
                xp = 60001
            case 12:
                xp = 80001
            case 13:
                xp = 112001
            case lvl:
                let plusTp = 31200
                xp = 112001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Gladiátor" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 189
            case 3:
                xp = 377
            case 4:
                xp = 826
            case 5:
                xp = 1651
            case 6:
                xp = 3301
            case 7:
                xp = 7251
            case 8:
                xp = 12051
            case 9:
                xp = 24001
            case 10:
                xp = 48001
            case 11:
                xp = 68001
            case 12:
                xp = 93001
            case 13:
                xp = 133001
            case lvl:
                let plusTp = 40000
                xp = 133001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Fejvadász" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 191
            case 3:
                xp = 401
            case 4:
                xp = 901
            case 5:
                xp = 1801
            case 6:
                xp = 3501
            case 7:
                xp = 7501
            case 8:
                xp = 15001
            case 9:
                xp = 30001
            case 10:
                xp = 60001
            case 11:
                xp = 110001
            case 12:
                xp = 160001
            case 13:
                xp = 220001
            case lvl:
                let plusTp = 60000
                xp = 220001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Lovag" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 191
            case 3:
                xp = 371
            case 4:
                xp = 801
            case 5:
                xp = 1651
            case 6:
                xp = 3201
            case 7:
                xp = 6401
            case 8:
                xp = 12001
            case 9:
                xp = 25001
            case 10:
                xp = 45001
            case 11:
                xp = 65001
            case 12:
                xp = 90001
            case 13:
                xp = 110001
            case lvl:
                let plusTp = 35000
                xp = 110001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        }  else if secCaste == "Amazon" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 191
            case 3:
                xp = 373
            case 4:
                xp = 745
            case 5:
                xp = 1489
            case 6:
                xp = 2977
            case 7:
                xp = 5953
            case 8:
                xp = 11901
            case 9:
                xp = 23801
            case 10:
                xp = 47601
            case 11:
                xp = 71401
            case 12:
                xp = 101001
            case 13:
                xp = 151001
            case lvl:
                let plusTp = 40500
                xp = 110001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Barbár" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 151
            case 3:
                xp = 311
            case 4:
                xp = 631
            case 5:
                xp = 1301
            case 6:
                xp = 2701
            case 7:
                xp = 5401
            case 8:
                xp = 10801
            case 9:
                xp = 21601
            case 10:
                xp = 42001
            case 11:
                xp = 65001
            case 12:
                xp = 90001
            case 13:
                xp = 120001
            case lvl:
                let plusTp = 32500
                xp = 120001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Bajvívó" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 151
            case 3:
                xp = 331
            case 4:
                xp = 661
            case 5:
                xp = 1486
            case 6:
                xp = 2901
            case 7:
                xp = 5801
            case 8:
                xp = 11001
            case 9:
                xp = 22001
            case 10:
                xp = 45001
            case 11:
                xp = 67501
            case 12:
                xp = 90001
            case 13:
                xp = 136001
            case lvl:
                let plusTp = 40000
                xp = 136001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Tolvaj" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 101
            case 3:
                xp = 203
            case 4:
                xp = 401
            case 5:
                xp = 803
            case 6:
                xp = 1701
            case 7:
                xp = 4501
            case 8:
                xp = 9001
            case 9:
                xp = 22001
            case 10:
                xp = 46501
            case 11:
                xp = 68501
            case 12:
                xp = 88001
            case 13:
                xp = 131501
            case lvl:
                let plusTp = 33500
                xp = 131501 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Bárd" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 171
            case 3:
                xp = 351
            case 4:
                xp = 1001
            case 5:
                xp = 2201
            case 6:
                xp = 4401
            case 7:
                xp = 7501
            case 8:
                xp = 15001
            case 9:
                xp = 30001
            case 10:
                xp = 55001
            case 11:
                xp = 75001
            case 12:
                xp = 95001
            case 13:
                xp = 145001
            case lvl:
                let plusTp = 40000
                xp = 145001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Pap" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 161
            case 3:
                xp = 331
            case 4:
                xp = 661
            case 5:
                xp = 1301
            case 6:
                xp = 2601
            case 7:
                xp = 5001
            case 8:
                xp = 9001
            case 9:
                xp = 23001
            case 10:
                xp = 50001
            case 11:
                xp = 90001
            case 12:
                xp = 130001
            case 13:
                xp = 165001
            case lvl:
                let plusTp = 50000
                xp = 165001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Paplovag" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 176
            case 3:
                xp = 353
            case 4:
                xp = 721
            case 5:
                xp = 1501
            case 6:
                xp = 3501
            case 7:
                xp = 7001
            case 8:
                xp = 10501
            case 9:
                xp = 21001
            case 10:
                xp = 48001
            case 11:
                xp = 78001
            case 12:
                xp = 108001
            case 13:
                xp = 138001
            case lvl:
                let plusTp = 38000
                xp = 138001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Szerzetes" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 201
            case 3:
                xp = 401
            case 4:
                xp = 801
            case 5:
                xp = 1601
            case 6:
                xp = 4001
            case 7:
                xp = 8001
            case 8:
                xp = 16001
            case 9:
                xp = 32001
            case 10:
                xp = 59001
            case 11:
                xp = 90501
            case 12:
                xp = 140001
            case 13:
                xp = 190001
            case lvl:
                let plusTp = 55000
                xp = 190001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Sámán" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 166
            case 3:
                xp = 341
            case 4:
                xp = 691
            case 5:
                xp = 1451
            case 6:
                xp = 3501
            case 7:
                xp = 7651
            case 8:
                xp = 13801
            case 9:
                xp = 27001
            case 10:
                xp = 50001
            case 11:
                xp = 97501
            case 12:
                xp = 147001
            case 13:
                xp = 192001
            case lvl:
                let plusTp = 55000
                xp = 192001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Harcművész" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 221
            case 3:
                xp = 443
            case 4:
                xp = 951
            case 5:
                xp = 2001
            case 6:
                xp = 4501
            case 7:
                xp = 9001
            case 8:
                xp = 16001
            case 9:
                xp = 32001
            case 10:
                xp = 65001
            case 11:
                xp = 120001
            case 12:
                xp = 170001
            case 13:
                xp = 240001
            case lvl:
                let plusTp = 65000
                xp = 240001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Kardművész" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 201
            case 3:
                xp = 401
            case 4:
                xp = 926
            case 5:
                xp = 1901
            case 6:
                xp = 4001
            case 7:
                xp = 8251
            case 8:
                xp = 15501
            case 9:
                xp = 31001
            case 10:
                xp = 62001
            case 11:
                xp = 115001
            case 12:
                xp = 165001
            case 13:
                xp = 230001
            case lvl:
                let plusTp = 62000
                xp = 230001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Boszorkány" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 151
            case 3:
                xp = 301
            case 4:
                xp = 601
            case 5:
                xp = 1001
            case 6:
                xp = 2001
            case 7:
                xp = 4001
            case 8:
                xp = 9001
            case 9:
                xp = 17001
            case 10:
                xp = 38501
            case 11:
                xp = 58501
            case 12:
                xp = 78501
            case 13:
                xp = 108501
            case lvl:
                let plusTp = 31500
                xp = 108501 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Boszorkánymester" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 201
            case 3:
                xp = 401
            case 4:
                xp = 801
            case 5:
                xp = 1601
            case 6:
                xp = 4001
            case 7:
                xp = 8001
            case 8:
                xp = 16001
            case 9:
                xp = 32001
            case 10:
                xp = 59001
            case 11:
                xp = 90501
            case 12:
                xp = 140001
            case 13:
                xp = 190001
            case lvl:
                let plusTp = 55000
                xp = 190001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Tűzvarázsló" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 171
            case 3:
                xp = 351
            case 4:
                xp = 701
            case 5:
                xp = 1501
            case 6:
                xp = 3001
            case 7:
                xp = 7001
            case 8:
                xp = 12001
            case 9:
                xp = 22001
            case 10:
                xp = 52501
            case 11:
                xp = 85501
            case 12:
                xp = 135001
            case 13:
                xp = 175501
            case lvl:
                let plusTp = 58500
                xp = 175501 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        } else if secCaste == "Varázsló" {
            switch lvl {
            case 1:
                xp = 0
            case 2:
                xp = 231
            case 3:
                xp = 501
            case 4:
                xp = 1001
            case 5:
                xp = 2201
            case 6:
                xp = 5001
            case 7:
                xp = 10001
            case 8:
                xp = 18001
            case 9:
                xp = 35001
            case 10:
                xp = 70001
            case 11:
                xp = 150001
            case 12:
                xp = 200001
            case 13:
                xp = 300001
            case lvl:
                let plusTp = 80000
                xp = 300001 + ((lvl - 13) * plusTp)
            default:
                fatalError("error")
            }
        }
        return xp
    }
}
    


