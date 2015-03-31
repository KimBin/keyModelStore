//
//  ViewController.m
//  YTKKeyValueStore
//
//  Created by TangQiao on 10/3/14.
//  Copyright (c) 2014 TangQiao. All rights reserved.
//

#import "ViewController.h"
#import "YTKKeyValueStore.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan111:(NSSet *)touches withEvent:(UIEvent *)event
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"test.db"];
    NSString *tableName = @"zm_table";
    [store createTableWithName:tableName];
    // 保存
    NSString *key = @"1";
    NSDictionary *user = @{@"id": @1, @"name": @"tangqiao", @"age": @30};
    [store putObject:user withId:key intoTable:tableName];
    // 查询
    NSDictionary *queryUser = [store getObjectById:key fromTable:tableName];
    NSLog(@"query data result: %@", queryUser);
}

@end
