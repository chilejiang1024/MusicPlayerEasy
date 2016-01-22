//
//  PlayView.m
//  MusicPlayerEasy
//
//  Created by JiangChile on 16/1/22.
//  Copyright (c) 2016年 JiangChile. All rights reserved.
//

#import "PlayView.h"

@interface PlayView () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation PlayView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    UIImageView *backgroundView = [UIImageView.alloc initWithImage:[UIImage imageNamed:@"backGround_4.jpg"]];
    backgroundView.frame = [UIScreen mainScreen].bounds;
    [self addSubview:backgroundView];
    [self createTableView];
    [self createControlPanel];
}

- (void)createTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667 - 80) style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.backgroundColor = [UIColor clearColor];
    [self addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = @"我是歌词";
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

- (void)createControlPanel {
    UIView *controlPanel = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 80, [UIScreen mainScreen].bounds.size.width, 80)];
    controlPanel.backgroundColor = [UIColor clearColor];
    
    UIButton *btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
    btnImage.frame = CGRectMake(20, 10, 60, 60);
    btnImage.layer.cornerRadius = 30;
    btnImage.backgroundColor = [UIColor blueColor];
    [controlPanel addSubview:btnImage];
    
    UIButton *btnPlay = [UIButton buttonWithType:UIButtonTypeCustom];
    btnPlay.frame = CGRectMake(200, 0, 60, 60);
    [btnPlay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnPlay setImage:[UIImage imageNamed:@"playbar_playbtn_nomal"] forState:UIControlStateNormal];
    [btnPlay addTarget:self action:@selector(playOrPause:) forControlEvents:UIControlEventTouchUpInside];
    [controlPanel addSubview:btnPlay];
    
    UIButton *btnLast = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLast.frame = CGRectMake(120, 0, 60, 60);
    [btnLast setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnLast setImage:[UIImage imageNamed:@"playbar_prebtn_nomal"] forState:UIControlStateNormal];
    [controlPanel addSubview:btnLast];
    
    UIButton *btnNext = [UIButton buttonWithType:UIButtonTypeCustom];
    btnNext.frame = CGRectMake(280, 0, 60, 60);
    [btnNext setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnNext setImage:[UIImage imageNamed:@"playbar_nextbtn_nomal"] forState:UIControlStateNormal];
    [controlPanel addSubview:btnNext];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(90, 50, 280, 20)];
    [controlPanel addSubview:slider];
    
    
    [self addSubview:controlPanel];
}

- (void)playOrPause:(UIButton *)sender {
    sender.selected = !sender.selected;
    void (^block)() = sender.selected ? ^(){
        NSLog(@"Play");
        [sender setImage:[UIImage imageNamed:@"playbar_pausebtn_nomal"] forState:UIControlStateNormal];
    } : ^(){
        NSLog(@"Pause");
        [sender setImage:[UIImage imageNamed:@"playbar_playbtn_nomal"] forState:UIControlStateNormal];
    };
    block();
}



@end
