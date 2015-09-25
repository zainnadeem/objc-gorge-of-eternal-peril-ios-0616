//
//  FISGorgeOfEternalPerilViewController.m
//  objc-gorge-of-eternal-peril
//
//  Created by Mark Murray on 9/24/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISGorgeOfEternalPerilViewController.h"

@interface FISGorgeOfEternalPerilViewController ()

- (IBAction)acceptYourFateTapped:(id)sender;

@end

@implementation FISGorgeOfEternalPerilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)acceptYourFateTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
