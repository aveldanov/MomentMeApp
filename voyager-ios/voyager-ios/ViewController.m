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


@end
