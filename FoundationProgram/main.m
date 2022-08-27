//
//  main.m
//  FoundationProgram
//
//  Created by 麻志翔 on 2022/7/23.
//

#import <Foundation/Foundation.h>
#import "fatherAndSon/Son.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Son *s = [Son new];
        Father *f = [Father new];
        [s setName:@"zhangsan" andAge:10];
        [f setName:@"lisi"];
    }
    return 0;
}
