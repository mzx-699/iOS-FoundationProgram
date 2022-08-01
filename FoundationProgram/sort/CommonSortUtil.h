//
//  CommonSortUtil.h
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/24.
//

#import <Foundation/Foundation.h>
/**
 // 测试
 NSMutableArray *arr = [NSMutableArray arrayWithArray: @[@9, @-1, @1, @5, @3]];
 NSLog(@"%@", arr);
 [CommonSortUtil heapSort:arr];
 NSLog(@"%@", arr);
 */
NS_ASSUME_NONNULL_BEGIN

@interface CommonSortUtil : NSObject
// Mutable才是可修改的，修改里面的元素 或者添加
+ (void)quickSort: (NSMutableArray *)arr;
+ (void)selectSort: (NSMutableArray *)arr;
+ (void)heapSort: (NSMutableArray *)arr;

@end

NS_ASSUME_NONNULL_END
