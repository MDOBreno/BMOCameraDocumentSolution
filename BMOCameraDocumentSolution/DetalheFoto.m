//
//  DetalheFoto.m
//  BMO05TableViewSimpleContactList
//
//  Created by Breno Medeiros on 30/01/20.
//  Copyright © 2020 Breno Medeiros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "DetalheFoto.h"

@interface DetalheFoto ()

@end

@implementation DetalheFoto

- (id)initWithFoto:(UIImageView *)fotoInicial {
    
    if(( self = [super init] )) {
        self->foto = fotoInicial;
    }
    
    
    return self;
}



@end
