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
    DetalheLoja *detalheLoja;
    MainViewController *mainViewController;
    NSString *identidadeLoja;
    __weak IBOutlet UIImageView *ivCameraInsta;
    IBOutlet UIView *quadroParaCaptura;
    @public IBOutlet UIImageView *ivImagem;
}

-(id) initWithFoto:(UIImage *) fotoInicial andIdentidadeLoja:(NSString *)identidadeInicial andDetalheLoja:(DetalheLoja *)detalheLojaInicial andMainViewController:(MainViewController *)mainViewControllerInicial;


- (IBAction)btBaterFoto:(id)sender;
- (IBAction)btSalvarFoto:(id)sender;
- (IBAction)btRotacionarfoto:(id)sender;
- (IBAction)btCancelar:(id)sender;

@end


