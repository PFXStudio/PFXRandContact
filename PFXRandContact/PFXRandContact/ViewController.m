//
//  ViewController.m
//  PFXRandContact
//
//  Created by succorer on 2016. 1. 14..
//  Copyright © 2016년 succorer. All rights reserved.
//

#import "ViewController.h"
#import "PFXRandContact.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[PFXRandContact sharedRandContact] createContactWithMaxRand:1000 completion:^(NSDictionary *contactDict) {
        NSLog(@"%@", contactDict);
        [self.indicatorView stopAnimating];
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
