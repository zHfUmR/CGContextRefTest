//
//  ViewController.m
//  CGContextRefTest
//
//  Created by GES-iMac on 17/2/10.
//  Copyright © 2017年 GES-iMac. All rights reserved.
//

#import "ViewController.h"

#import "SecondViewController.h"
#import "CellBackgroundView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"Push" style:(UIBarButtonItemStyleDone) target:self action:@selector(pushNextVC)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - nav bar action

- (void)pushNextVC {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    
    //1.context
    cell.backgroundView = [CellBackgroundView new];
    
    //2.QuartzCore
//    {        
//        CAGradientLayer *_gradientLayer = [CAGradientLayer layer];
//        
//        _gradientLayer.bounds = cell.contentView.bounds;
//        
//        _gradientLayer.borderWidth = 0;
//        
//        _gradientLayer.frame = cell.contentView.bounds;
//        
//        _gradientLayer.colors = [NSArray arrayWithObjects:
//                                 (id)[[UIColor clearColor] CGColor],
//                                 (id)[[UIColor blackColor] CGColor],nil];
//        
//        _gradientLayer.startPoint = CGPointMake(0.5, 0.5);
//        
//        _gradientLayer.endPoint = CGPointMake(0.5, 1.0);
//        
//        [cell.contentView.layer insertSublayer:_gradientLayer atIndex:0];
//    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
