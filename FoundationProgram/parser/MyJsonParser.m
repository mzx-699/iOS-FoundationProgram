//
//  MyJsonParser.m
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/23.
//

#import "MyJsonParser.h"
#import "ByteDancer.h"
#import <Foundation/Foundation.h>
@interface MyJsonParser ()
@property (nonatomic, assign) NSString *filePath;
@end
@implementation MyJsonParser
- (instancetype)initWithFile:(NSString *)filePath {
    if (self = [super init]) {
        _filePath = filePath;
    }
    return self;
}
- (ByteDancer *)parse {
    // 读取文件
    NSData *fileContent = [self readFile];
    NSDictionary *dictionary = [MyJsonParser parseJsonStr:fileContent];
    
    ByteDancer *byteDancer = [[ByteDancer alloc] init];
    if ([dictionary objectForKey:@"name"]) {
        byteDancer.name = (NSString *)[dictionary objectForKey:@"name"];
    }
    return byteDancer;
}
- (NSData *)readFile {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSData *content = [fileManager contentsAtPath:self.filePath];
    if (!content) {
        exit(1);
    }
    return content;
}
+ (NSDictionary *)parseJsonStr:(NSData *)jsonData {
    return [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
}

@end
