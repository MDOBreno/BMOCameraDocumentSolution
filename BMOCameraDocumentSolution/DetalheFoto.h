//
//  DetalheFoto.h
//  BMO05TableViewSimpleContactList
//
//  Created by Breno Medeiros on 30/01/20.
//  Copyright © 2020 Breno Medeiros. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetalheFoto : UIViewController{
    UIImageView *foto;
}

-(id) initWithFoto:(UIImageView *) fotoInicial;

 @property (weak, nonatomic) IBOutlet UIImageView *ivFoto;


@end

    
