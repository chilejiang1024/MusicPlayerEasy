//
//  SongsView.m
//  MusicPlayerEasy
//
//  Created by JiangChile on 16/1/22.
//  Copyright (c) 2016年 JiangChile. All rights reserved.
//

#import "SongsView.h"
#import "UIImageView+WebCache.h"
#import "MusicModel.h"

@interface SongsView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSMutableArray *listArray;

@end

@implementation SongsView

- (instancetype)initWithFrame:(CGRect)frame Array:(NSMutableArray *)array {
    self = [super initWithFrame:frame];
    if (self) {
        _listArray = array;
        [self createTableView];
    }
    return self;
}

- (void)createTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _myBlock(self.listArray[indexPath.row]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[self.listArray[indexPath.row] picUrl]]  placeholderImage:[UIImage imageNamed:@"placeHold2.png"]];
    cell.textLabel.text = [self.listArray[indexPath.row] name];
    cell.detailTextLabel.text = [self.listArray[indexPath.row] artists_name];
    return cell;
}



@end
