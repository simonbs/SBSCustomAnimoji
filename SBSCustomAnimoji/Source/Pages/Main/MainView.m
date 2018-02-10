//
//  MainView.m
//  SBSAnimoji
//
//  Created by Simon Støvring on 05/11/2017.
//  Copyright © 2017 SimonBS. All rights reserved.
//

#import "MainView.h"
#import "AVTPuppetView.h"

@interface MainView ()
@property (nonatomic, strong) AVTPuppetView *puppetView;
@end

@implementation MainView

- (instancetype)init {
    if (self = [super init]) {
        [self setupView];
        [self setupLayout];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor whiteColor];
    self.puppetView = [[AVTPuppetView alloc] init];
    self.puppetView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.puppetView];
}

- (void)setupLayout {
    [self.puppetView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [self.puppetView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [self.puppetView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
    [self.puppetView.heightAnchor constraintEqualToAnchor:self.puppetView.widthAnchor].active = YES;
}

@end
