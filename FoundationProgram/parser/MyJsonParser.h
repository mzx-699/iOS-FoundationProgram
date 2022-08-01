//
//  MyJsonParser.h
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/23.
//

#import <Foundation/Foundation.h>

@class ByteDancer;
@interface MyJsonParser : NSObject
- (instancetype)initWithFile:(NSString *)filePath;
- (ByteDancer *)parse;
@end
