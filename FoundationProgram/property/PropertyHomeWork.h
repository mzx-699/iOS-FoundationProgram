//
//  PropertyHomeWork.h
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/24.
//

/** 测试
 PropertyHomeWork *phw = [[PropertyHomeWork alloc] init];
 // 自定义getter / setter
 [phw myNameSetter:@"nihao"];
 NSLog(@"%@", [phw myNameGetter]);
 
 // 深拷贝
 NSMutableString *str = [NSMutableString stringWithString:@"hello"];
 phw.myCopyString = str;
 phw.noCopyString = str;
 // 0x1038115a0
 NSLog(@"str ---- %p", str);
 // 0x1c90f4fc16ab70cf
 NSLog(@"myCopyString ---- %p", phw.myCopyString);
 // 0x1038115a0
 NSLog(@"noCopyString ---- %p", phw.noCopyString);

 // 修改内容后，copy的不会被修改
 [str appendString:@"world"];
 // helloworld
 NSLog(@"str ---- %@", str);
 // hello
 NSLog(@"myCopyString ---- %@", phw.myCopyString);
 // helloworld
 NSLog(@"noCopyString ---- %@", phw.noCopyString);
 */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PropertyHomeWork : NSObject
// copy 开启深拷贝，一般修饰NSString 【变量名不能以copy开头】
@property (nonatomic, copy) NSString *myCopyString;
@property (nonatomic) NSString *noCopyString;

// nonatomic / atomic是否开启原子性，保证变量访问的线程安全，类似 volatile
@property (nonatomic) NSDictionary *nonatomicDict;
@property (atomic) NSDictionary *atomicDict;

// ARC下 strong强引用 weak弱引用，避免循环引用，OC底层为引用计数来管理内存
@property (nonatomic, strong) NSArray *strongArr;
@property (nonatomic, weak) NSArray *weakArr;

// assign修饰非OC对象，一些基本类型；retain在MRC下，会setter方法中自动管理引用计数
@property (nonatomic, assign) int assignNum;
@property (nonatomic, retain) NSNumber *retainNum;

// 自定义setter/getter方法名
@property (nonatomic, getter=myNameGetter, setter=myNameSetter:) NSString *name;

@end

NS_ASSUME_NONNULL_END
