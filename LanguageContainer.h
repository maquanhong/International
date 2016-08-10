//
//  LanguageContainer.h
//  YTNewEnergy
//
//  Created by maquanhong on 16/1/5.
//  Copyright © 2016年 YuTong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LanguageChange.h"

@interface LanguageContainer : NSObject
+ (LanguageContainer *)sharedLanguageContainer;
- (void)addLanguageChangeController:(NSObject<LanguageChange> *)vc;
- (void)removeLanguageChangeController:(NSObject<LanguageChange> *)vc;
- (void)reloadUI:(void (^)())beginblock completBlock:(void (^)())completblock;
@end
