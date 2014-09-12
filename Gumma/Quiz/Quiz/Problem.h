//
//  Problem.h
//  Quiz
//
//  Created by Mac User on 2013/11/30.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Problem : NSObject

+ (id)initProblem;
- (void)setQ:(NSString *)q withA:(int)a;
- (NSString *)getQ;
- (int)getA;

@end
