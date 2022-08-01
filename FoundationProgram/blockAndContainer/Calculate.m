//
//  Calculate.m
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/8/1.
//

#import "Calculate.h"

@implementation Calculate
- (CalculateBlock)add {
    return ^(NSInteger num) {
        self.result += num;
        return self;
    };
}
- (CalculateBlock)mul {
    return ^(NSInteger num) {
        self.result *= num;
        return self;
    };
}
@end
