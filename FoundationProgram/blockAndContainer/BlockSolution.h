//
//  BlockSolution.h
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/25.
//

#import <Foundation/Foundation.h>

/**
 NSInteger ret1 = [BlockSolution blockTest1:^{
     NSLog(@"myBlock");
 } :^NSInteger(NSInteger a, NSInteger b) {
     return a - b;
 }];
 NSInteger ret2 = [BlockSolution blockTest2:^NSInteger(NSInteger a, NSInteger b) {
     return a + b;
 }];
 NSLog(@"ret1: %ld, ret2: %ld", ret1, ret2);
 */
NS_ASSUME_NONNULL_BEGIN
// 定义了参数类型
typedef void (^voidBlockType)(void);
typedef NSInteger (^compute)(NSInteger a, NSInteger b);

@interface BlockSolution : NSObject
// block 定义方式 returnType (^TypeName)(parameterTypes); block作为方法参数时，TypreName不写
+ (NSInteger) blockTest1: (voidBlockType)myBlock :(compute)mycompute;
+ (NSInteger) blockTest2: (NSInteger (^)(NSInteger a, NSInteger b))compute;
@end

NS_ASSUME_NONNULL_END
