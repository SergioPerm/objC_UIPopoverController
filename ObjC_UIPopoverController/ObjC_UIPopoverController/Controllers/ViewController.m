//
//  ViewController.m
//  ObjC_UIPopoverController
//
//  Created by kluv on 02/04/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import "ViewController.h"
#import "DetailsViewController.h"
#import "BirthDayViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UITextField* activeField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (UITextField* textField in self.textFieldCollection) {
        textField.delegate = self;
    }
        
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

#pragma mark - Methods

- (void) setFirstRespronderForNextTextField:(UITextField*) textField {
    
    NSUInteger textFieldIndex = [self.textFieldCollection indexOfObject:textField];

    self.activeField = [self.textFieldCollection objectAtIndex:textFieldIndex + 1];
    [self.activeField becomeFirstResponder];

}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self setFirstRespronderForNextTextField:textField];
    
    return YES;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField.tag == 4) {
        
        BirthDayViewController* birthView = [self.storyboard instantiateViewControllerWithIdentifier:@"birthDayViewController"];

        birthView.preferredContentSize = CGSizeMake(300, 300);
        birthView.modalPresentationStyle = UIModalPresentationPopover;
        
        UIPopoverPresentationController* presentCtrl = birthView.popoverPresentationController;
        presentCtrl.permittedArrowDirections = UIPopoverArrowDirectionAny;
        presentCtrl.delegate = self;
        presentCtrl.sourceRect = textField.frame;
        presentCtrl.sourceView = self.view;
            
        [self presentViewController:birthView animated:YES completion:nil];
        
        return NO;
    }
    
    return YES;
    
}

@end
