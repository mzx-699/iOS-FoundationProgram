//
//  BlockSolution.m
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/25.
//

#import "BlockSolution.h"

@implementation BlockSolution
+ (NSInteger) blockTest1: (voidBlockType)myBlock :(compute)mycompute {
    myBlock();
    return mycompute(10, 20);
}
// 作为函数参数
+ (NSInteger) blockTest2: (NSInteger (^)(NSInteger a, NSInteger b))compute {
    return compute(10, 20);
}
@end
