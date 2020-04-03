//
//  ViewController.m
//  ObjC_UIPopoverController
//
//  Created by kluv on 02/04/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import "ViewController.h"
#import "DetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Actions

- (IBAction)actionAdd:(UIBarButtonItem *)sender {
    
    DetailsViewController* detailsView = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];

    UINavigationController* navCtrl = [[UINavigationController alloc] initWithRootViewController:detailsView];
    
    navCtrl.preferredContentSize = CGSizeMake(300, 300);
    navCtrl.modalPresentationStyle = UIModalPresentationPopover;
    
    UIPopoverPresentationController* presentCtrl = navCtrl.popoverPresentationController;
    presentCtrl.permittedArrowDirections = UIPopoverArrowDirectionAny;
    presentCtrl.delegate = self;
    presentCtrl.barButtonItem = self.navigationItem.rightBarButtonItem;
        
    [self presentViewController:navCtrl animated:YES completion:nil];
    
    
}

- (IBAction)actionPressMe:(UIButton *)sender {
    
    DetailsViewController* detailsView = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];

    detailsView.preferredContentSize = CGSizeMake(300, 300);
    detailsView.modalPresentationStyle = UIModalPresentationPopover;
    
    UIPopoverPresentationController* presentCtrl = detailsView.popoverPresentationController;
    presentCtrl.permittedArrowDirections = UIPopoverArrowDirectionUp;
    presentCtrl.delegate = self;
    presentCtrl.sourceRect = sender.frame;
    presentCtrl.sourceView = self.view;
    
    [self presentViewController:detailsView animated:YES completion:nil];
    
}

- (void)presentationControllerDidDismiss:(UIPresentationController *)presentationController {
    
    NSLog(@"Dismiss");
    
}

@end
