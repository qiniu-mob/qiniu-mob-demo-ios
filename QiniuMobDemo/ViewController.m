//
//  ViewController.m
//  QiniuMobDemo
//
//  Created by Spring MC on 19/03/2017.
//  Copyright © 2017 com.qiniu.mob. All rights reserved.
//

#import "ViewController.h"

#define ClientID @""
#define AccessToken @""
#define RefreshToken @""

@interface ViewController ()

@property (nonatomic, strong) QNMobRegisterModel * registerModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _registerModel = [[QNMobRegisterModel alloc] initWithClientID:ClientID
                                        accessToken:AccessToken
                                        refreshToken:RefreshToken];
    
    [QNMobAPI registerWithMobRegisterModel:_registerModel];
    
    QNMob * mob = [QNMob defaultQNMob];
    
    // create a new folder
    QNMobCreateFolderRequest * request = [QNMobCreateFolderRequest new];
    request.folderPath = [NSString stringWithFormat:@"mobdemo/%@", [[NSUUID UUID] UUIDString]];
    
    [mob createFolder:request completionHandler:^(QNMobCreateFolderOutput * _Nullable response, NSError * _Nullable error) {
        NSLog(@"response:%@",response.name);
        NSLog(@"error:%@", error);
    }];
    
    // create a new file
    QNMobCreateFileRequest * fileRequest = [QNMobCreateFileRequest new];
    fileRequest.filePath = [NSString stringWithFormat:@"mobdemo/%@", [[NSUUID UUID] UUIDString]];
    fileRequest.body = [NSString stringWithFormat:@"Hello, %@", [[NSUUID UUID] UUIDString]];
    
    [mob createFile:fileRequest completionHandler:^(QNMobCreateFileOutput * _Nullable response, NSError * _Nullable error) {
        NSLog(@"response:%@", response.name);
        NSLog(@"error:%@", error);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
