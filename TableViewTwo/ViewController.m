//
//  ViewController.m
//  TableViewTwo
//
//  Created by clark Lyu on 10/13/14.
//  Copyright (c) 2014 clark Lyu. All rights reserved.
//

#import "ViewController.h"
#import "CreditCardPackageModel.h"
#import "CreditCard.h"
#import "AddCardViewController.h"
#import "OrderViewController.h"
#import "OrderViewModel.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize data;

CreditCardPackageModel *CCPModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    CCPModel = [CreditCardPackageModel getInstance];
    CreditCard * newCard = [CreditCard alloc];
    newCard.number = @"4242424242424242";
    CreditCardPackageModel * CCPModel= [CreditCardPackageModel getInstance];
    [CCPModel addCreditCard:newCard];
    newCard = [CreditCard alloc];
    newCard.number = @"4242424242424243";
    [CCPModel addCreditCard:newCard];
    newCard = [CreditCard alloc];
    newCard.number = @"4242424242426987";
    [CCPModel addCreditCard:newCard];
    
    data = [CCPModel displayNumberArrayOfCreditCards];
    
//    data = [[NSMutableArray alloc]initWithObjects:@"DOG",@"CAT",@"MOUSE", nil];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated{
    self.data = CCPModel.displayNumberArrayOfCreditCards;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIndentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
    }
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    return cell;
}




//- (IBAction)unwindToTableViewController:(UIStoryboardSegue *)sender
//{
//    AddViewController *addViewController = (AddViewController *)sender.sourceViewController;
//
//    NSMutableArray *text = addViewController.textField.text;
//    
//    
//    
//    if (![text length] == 0 && ! [[text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0 ) {
//        [data insertObject:text atIndex:0];
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//        
//        [self.tableView beginUpdates];
//        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//        [self.tableView endUpdates];
//    }
//    
//    
//    
//}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
    
        //remove from the nssarry
        [CCPModel removeCreditCardWithIndex:indexPath.row];
        self.data =[CCPModel displayNumberArrayOfCreditCards];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        
    }
}

- (IBAction)addButtonOnClick:(id)sender {
    AddCardViewController * addCardVC = [AddCardViewController alloc];
    [self.navigationController pushViewController:addCardVC animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [OrderViewModel instance].selectedCardIndex =indexPath.row;
    OrderViewController * OVController = [OrderViewController alloc];
    [self.navigationController pushViewController: OVController animated:YES];
}

@end
