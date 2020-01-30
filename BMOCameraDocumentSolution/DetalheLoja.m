//
//  DetalheLoja.m
//  BMO05TableViewSimpleContactList
//
//  Created by Breno Medeiros on 30/01/20.
//  Copyright © 2020 Breno Medeiros. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DetalheLoja.h"

@interface DetalheLoja ()

@end

@implementation DetalheLoja

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)voltar:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
