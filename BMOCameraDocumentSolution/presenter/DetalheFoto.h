//
//  DetalheFoto.h
//  BMO05TableViewSimpleContactList
//
//  Created by Breno Medeiros on 30/01/20.
//  Copyright © 2020 Breno Medeiros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface DetalheFoto : UIViewController{
    UIImage *foto;
    __weak IBOutlet UIImageView *ivCameraInsta;
    IBOutlet UIView *quadroParaCaptura;
    @public IBOutlet UIImageView *ivImagem;
}

-(id) initWithFoto:(UIImageView *) fotoInicial;


- (IBAction)btBaterFoto:(id)sender;
- (IBAction)btSalvarFoto:(id)sender;
- (IBAction)btRotacionarfoto:(id)sender;
- (IBAction)btCancelar:(id)sender;

@end


