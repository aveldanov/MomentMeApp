//
//  ViewController.m
//  voyager-ios
//
//  Created by Anton Veldanov on 3/31/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HelloLogger *log = [[HelloLogger alloc] init];
    
    [log helloWithText:@"Passed Text"];
    
}


- (void) viewDidAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    
    SemaphoreViewController *vc = [[SemaphoreViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: vc];
        
    [self presentViewController:nav animated:YES completion:nil];
}


@end
