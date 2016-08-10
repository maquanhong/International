//
//  LanguageContainer.m
//  YTNewEnergy
//
//  Created by maquanhong on 16/1/5.
//  Copyright © 2016年 YuTong. All rights reserved.
//

#import "LanguageContainer.h"

@interface LanguageContainer ()
@property (nonatomic, strong) NSMutableArray  *controllerContains;
@end

@implementation LanguageContainer
+ (LanguageContainer *)sharedLanguageContainer {
    static LanguageContainer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LanguageContainer alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _controllerContains = [NSMutableArray array];
    }
    return self;
}

- (void)addLanguageChangeController:(NSObject<LanguageChange> *)vc {
    [self.controllerContains addObject:vc];
}

- (void)removeLanguageChangeController:(NSObject<LanguageChange> *)vc {
    [self.controllerContains removeObject:vc];
}

- (void)reloadUI:(void (^)())beginblock completBlock:(void (^)())completblock {
    beginblock();
    for (NSObject<LanguageChange> *object in self.controllerContains) {
        if ([object conformsToProtocol:@protocol(LanguageChange)]) {
             [object reloadUIWhenLanguageChange];
        }
       
    }
    completblock();
}
@end
