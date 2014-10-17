//
//  OrderViewController.m
//  TableViewTwo
//
//  Created by Leonard Li on 10/14/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "OrderViewController.h"
#import "CreditCardPackageModel.h"
#import "OrderViewModel.h"

@interface OrderViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cardNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *expdateLabel;
@property (weak, nonatomic) IBOutlet UITextField *address1TextField;
@property (weak, nonatomic) IBOutlet UITextField *address2TextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation OrderViewController

CreditCardPackageModel * CCPModel;
NSInteger selectedCardIndex;

- (void)viewDidLoad {
//    [super viewDidLoad];
//    CCPModel =[CreditCardPackageModel getInstance];
//    selectedCardIndex = [OrderViewModel instance].selectedCardIndex;
//    [self initUIText];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUIText{
    CreditCard * card =[CCPModel getCreditCardByIndex:(int)selectedCardIndex];
    self.cardNumberLabel.text = card.number;
    self.expdateLabel.text = [NSString stringWithFormat:@"Expired Date:%d/%d",(int)card.expridMouth,(int)card.expridYear];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
