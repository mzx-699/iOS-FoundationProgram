//
//  Solution.m
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/25.
//

#import "ContainerSolution.h"

@implementation ContainerSolution
+ (void)arrayTest {
    // 不可修改
    NSArray *arr1 = [[NSArray alloc] init];
    NSArray *arr2 = @[@1, @2, @3];
    NSArray *arr3 = [[NSArray alloc] initWithArray:arr2];
    NSArray *arr4 = [NSArray arrayWithArray:arr2];
    // 读取文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"arrList.plist" ofType:nil];
    NSArray *arr5 = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"arr5 - %@", arr5);
    // 遍历枚举
    [arr5 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"enumerate - %ld, %@", idx, obj);
    }];
    // 长度
    NSLog(@"len - %ld", arr5.count);
    // 判断是否存在某个元素
    NSLog(@"3 is exist: %@", [arr2 containsObject:@3] ? @"YES" : @"NO");
    // 连接成String
    NSLog(@"Join to string: %@", [arr5 componentsJoinedByString:@"-"]);
    // string to arr
    NSString *str = [arr5 componentsJoinedByString:@","];
    NSArray *arr = [str componentsSeparatedByString:@","];
    // for in 遍历
    for (id item in arr) {
        NSLog(@"%@", item);
    }
}
+ (void)mutableArrayTest {
    NSMutableArray *marr = [NSMutableArray arrayWithArray:@[@1, @2, @3]];
    NSLog(@"%@", marr);
    [marr addObject:@5];
    // 指定下标插入元素
    [marr insertObject:@6 atIndex:0];
    NSLog(@"%@", marr);
    // 删除下标元素
    [marr removeObjectAtIndex:1];
    // 添加元素
    [marr addObject:@3];
    NSLog(@"%@", marr);
    // 删除执行元素
    [marr removeObject:@3];
    NSLog(@"%@", marr);
    // 删除[0, 3) 下标中的5元素
    [marr removeObject:@5 inRange:NSMakeRange(0, 3)];
    // 删除所有元素
    [marr removeAllObjects];
}

+ (void)dictTest {
    NSDictionary *dict1 = [[NSDictionary alloc] init];
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"zhangsan", @"name", @"wenzhou", @"city", nil];
    NSDictionary *dict3 = @{@"name":@"zhangsan", @"city":@"wenzhou", @"age":@13};
    NSDictionary *dict4 = [NSDictionary dictionaryWithDictionary:dict3];
    // 读取文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"dict.plist" ofType:nil];
    NSDictionary *dict5 = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"len: %ld", dict5.count);
    NSLog(@"keys: %@", [dict5 allKeys]);
    NSLog(@"values: %@", [dict5 allValues]);
    [dict5 enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"enumerate: key-%@, value-%@", key, obj);
    }];
    for (id item in dict5) {
        NSLog(@"for-in: key-%@, value-%@", item, dict5[item]);
    }
}

+ (void)mutableDictTest {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"dict.plist" ofType:nil];
    NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    [mdict setObject:@"basketball" forKey:@"hobby"];
    [mdict setObject:@"lihua" forKey:@"name"];
    [mdict removeObjectForKey:@"age"];
    NSLog(@"%@", mdict);
    [mdict removeAllObjects];
    
}
@end
