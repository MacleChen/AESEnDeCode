//
//  ViewController.m
//  AESEnDeCode
//
//  Created by 陈帆 on 2017/11/21.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import "ViewController.h"
#import "AESCryptJointSky.h"

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.encodePasswordTF.stringValue = @"JOINT_MOBILE_APP";
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


// 加密
- (IBAction)encodeBtnClick:(NSButton *)sender {
    // 判断是否有明文
    if (self.decodeTextView.string.length <= 0) {
        // 提示：请输入密文
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"确定"];
        [alert setMessageText:@"请输入明文"];
        [alert beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse returnCode) {
            NSLog(@"hahha");
        }];
        
        return;
    }
    
    // 判断是否有密码
    if (self.encodePasswordTF.stringValue.length <= 0) {
        // 提示：请输入解密的密码
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"确定"];
        [alert setMessageText:@"请输入解密的密码"];
        [alert beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse returnCode) {
            NSLog(@"hahha");
        }];
        return;
    }
    
    NSString *codeString = [NSString stringWithFormat:@"%@", self.decodeTextView.string];
    codeString = [codeString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    self.encodeTextView.string = [AESCryptJointSky encrypt:codeString password:self.encodePasswordTF.stringValue];
}


// 解密
- (IBAction)decodeBtnClick:(NSButton *)sender {
    // 判断是否有密文
    if (self.encodeTextView.string.length <= 0) {
        // 提示：请输入密文
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"确定"];
        [alert setMessageText:@"请输入密文"];
        [alert beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse returnCode) {
            NSLog(@"hahha");
        }];
        
        return;
    }
    
    // 判断是否有密码
    if (self.encodePasswordTF.stringValue.length <= 0) {
        // 提示：请输入解密的密码
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"确定"];
        [alert setMessageText:@"请输入解密的密码"];
        [alert beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse returnCode) {
            NSLog(@"hahha");
        }];
        return;
    }
    
    NSString *encodeString = [NSString stringWithFormat:@"%@", self.encodeTextView.string];
    encodeString = [encodeString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    self.decodeTextView.string = [AESCryptJointSky decrypt:encodeString password:self.encodePasswordTF.stringValue];
}

- (IBAction)clearBtnClick:(NSButton *)sender {
    self.encodeTextView.string = @"";
    self.decodeTextView.string = @"";
}

@end
