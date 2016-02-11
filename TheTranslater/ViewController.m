//
//  ViewController.m
//  TheTranslater
//
//  Created by Brian Chen on 2/9/16.
//  Copyright © 2016 Brian Chen. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <MBProgressHUD.h>
#import "TableViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)segmentedControlAction:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lbl_action;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)btn_enter:(id)sender;

@property (nonatomic, strong) NSDictionary * responseData;
@property (nonatomic, strong) NSString * searchType;

@end

static NSString * const API_URL = @"http://www.nactem.ac.uk/software/acromine/dictionary.py";

@implementation ViewController
@synthesize segmentedControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.responseData = [[NSDictionary alloc]init];
    self.searchType = @"lf";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendingURLRequest
{
    NSDictionary * para = @{self.searchType:self.textField.text};
    
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [manager GET:API_URL parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.responseData = responseObject;
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self performSegueWithIdentifier:@"segue_tableview" sender:self];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];

}

- (IBAction)segmentedControlAction:(id)sender {
    self.textField.text = @"";
    if (segmentedControl.selectedSegmentIndex == 0) {
        self.lbl_action.text = @"Please enter a acronym";
        self.textField.placeholder = @"ex: california";
        self.searchType = @"lf";
    } else {
        self.lbl_action.text = @"Please enter a initialsm";
        self.textField.placeholder = @"ex: ca";
        self.searchType = @"sf";
    }
}
- (IBAction)btn_enter:(id)sender {
    if (![self.textField.text isEqualToString:@""]) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [self sendingURLRequest];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segue_tableview"]) {
        TableViewController * controller = (TableViewController *)segue.destinationViewController;
        controller.responseData = self.responseData;
        controller.titleOfTableView = self.textField.text;
    }
}

@end
