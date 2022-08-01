//
//  Calculate.h
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/8/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 Calculate *calculate = [Calculate new];
 // 调用add返回的闭包
 calculate.add(2).mul(3);
 NSLog(@"%ld", calculate.result);
 */
@interface Calculate : NSObject
typedef Calculate* _Nullable (^CalculateBlock)(NSInteger num);
@property (nonatomic) NSInteger result;
- (CalculateBlock)add;
- (CalculateBlock)mul;
@end

NS_ASSUME_NONNULL_END
