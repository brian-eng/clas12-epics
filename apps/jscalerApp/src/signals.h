
// 1st hexdigit:  threshold/counts type
//                1 = fadc OR tdc threshold
//                2 = trg threshold
//                3 = fadc OR tdc-gated counts
//                4 = trg-gated counts
//                5 = tdc counts
//                6 = trg counts
//            (subtracting 1 gives threshold index: 0,1)
//            (subtracting 3 gives counts index: 0,1,2,3)
//
// 2nd hexdigit:  board type 
//                0=fadc
//                1=disc
//                2=ssp

#define FADCTET 0x01
#define FADCCNT 0x03
#define TDCTET  0x11
#define TRGTET  0x12
#define GTRGCNT 0x13
#define GTDCCNT 0x14
#define TRGCNT  0x15
#define TDCCNT  0x16

