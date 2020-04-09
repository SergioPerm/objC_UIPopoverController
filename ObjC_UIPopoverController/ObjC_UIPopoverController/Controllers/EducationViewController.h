//
//  EducationViewController.h
//  ObjC_UIPopoverController
//
//  Created by kluv on 09/04/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol EducationViewDelegate <NSObject>

@optional

- (void) onSelectEducationDegree:(NSString*) educationDegree;

@end

@interface EducationViewController : UITableViewController <UITableViewDelegate>

@property (weak, nonatomic) id<EducationViewDelegate> delegate;

- (IBAction)educationNavBarDoneAction:(UIBarButtonItem *)sender;

@end

NS_ASSUME_NONNULL_END
