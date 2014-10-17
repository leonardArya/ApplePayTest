//
//  AddCardViewController.m
//  TableViewTwo
//
//  Created by Leonard Li on 10/14/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "AddCardViewController.h"
#import "PTKView.h"
#import <STPCard.h>
#import "CreditCard.h"
#import "CreditCardPackageModel.h"

@interface AddCardViewController ()<PTKViewDelegate>

@property(weak, nonatomic) PTKView * paymentView;

@property(weak, nonatomic) UIButton * saveButton;

@end

CreditCardPackageModel * CCPModel;

@implementation AddCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CCPModel = [CreditCardPackageModel getInstance];
    UIButton * newButton = [[UIButton alloc] initWithFrame:CGRectMake(50,50,290,55)];
    [newButton setTitle:@"save" forState:UIControlStateNormal];
    [newButton addTarget:self action:@selector(saveButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [newButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.saveButton = newButton;
    [self.view addSubview:self.saveButton];
    PTKView *view = [[PTKView alloc] initWithFrame:CGRectMake(15,20,290,55)];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.paymentView = view;
    self.paymentView.delegate = self;
    [self.view addSubview:self.paymentView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)saveButtonOnClick:(id)sender{
    CreditCard *newCard = [CreditCard alloc];
    newCard.number = self.paymentView.card.number;
    newCard.expridMouth = self.paymentView.card.expMonth;
    newCard.expridYear = self.paymentView.card.expYear;
    newCard.CVC = self.paymentView.card.cvc;
    [CCPModel addCreditCard:newCard];
    STPCard *card = [[STPCard alloc] init];
    card.number = self.paymentView.card.number;
    card.expMonth = self.paymentView.card.expMonth;
    card.expYear = self.paymentView.card.expYear;
    card.cvc = self.paymentView.card.cvc;
    [self.navigationController popViewControllerAnimated:YES];
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
