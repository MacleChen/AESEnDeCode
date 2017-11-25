//
//  ViewController.h
//  AESEnDeCode
//
//  Created by 陈帆 on 2017/11/21.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (unsafe_unretained) IBOutlet NSTextView *encodeTextView;

@property (weak) IBOutlet NSButton *encodeBtn;
@property (weak) IBOutlet NSButton *decodeBtn;

@property (unsafe_unretained) IBOutlet NSTextView *decodeTextView;

@property (weak) IBOutlet NSTextField *encodePasswordTF;

- (IBAction)encodeBtnClick:(NSButton *)sender;

- (IBAction)decodeBtnClick:(NSButton *)sender;

- (IBAction)clearBtnClick:(NSButton *)sender;



@end

