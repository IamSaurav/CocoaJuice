//
//  ViewController.m
//  iBeaconDemo
//
//  Created by Saurav Satpathy on 21/06/15.
//  Copyright (c) 2015 Saurav Satpathy. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property(nonatomic,strong)CLLocationManager *locationManager;
@property(nonatomic,strong)CLRegion *beaconRegion;
@property(nonatomic,strong)CBCentralManager *bluetoothManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
