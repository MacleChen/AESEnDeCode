//
//  RequestViewController.h
//  AESEnDeCode
//
//  Created by 陈帆 on 2017/11/21.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RequestViewController : NSViewController

@property (weak) IBOutlet NSTextField *baseUrlTextField;

@property (weak) IBOutlet NSTextField *headerParamTF;

@property (weak) IBOutlet NSTextField *paramTextField;

@property (weak) IBOutlet NSPopUpButton *requestTypePuBtn;

@property (unsafe_unretained) IBOutlet NSTextView *resultTextView;

@property (weak) IBOutlet NSButton *checkBtn;

@property (weak) IBOutlet NSTextField *codePasswordTF;



- (IBAction)sendRequestBtnClick:(NSButton *)sender;

- (IBAction)checkBtnClick:(NSButton *)sender;



@end
