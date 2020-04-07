//
//  birthDayViewController.h
//  ObjC_UIPopoverController
//
//  Created by kluv on 06/04/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BirthDayViewDelegate <NSObject>

@optional

- (void) closeBirthDayDatePickerWithDate:(NSDate*) birdtDay;

@end

@interface BirthDayViewController : UIViewController

@property (strong, nonatomic) NSDate* birthDayDate;

@property (weak, nonatomic) id<BirthDayViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIDatePicker *birthDatePicker;
- (IBAction)datePickerChangeAction:(UIDatePicker *)sender;
- (IBAction)barItemDoneAction:(UIBarButtonItem *)sender;


@end


NS_ASSUME_NONNULL_END
