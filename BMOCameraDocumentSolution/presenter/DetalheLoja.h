//
//  DetalheLoja.h
//  BMO05TableViewSimpleContactList
//
//  Created by Breno Medeiros on 30/01/20.
//  Copyright © 2020 Breno Medeiros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Loja.h"
#import "MainViewController.h"


@interface DetalheLoja : UIViewController{
    @public UITextField *tfNome;
    @public UITextField *tfTelefone;
    @public UITextView *tvEndereco;
    @public UIImageView *ivFoto;
    @public Loja *loja;
    @public MainViewController *mainViewController;
}

-(id) initWithLoja:(Loja *) lojaInicial
andMainViewController:(MainViewController *)mainViewControllerInicial;

@property (weak, nonatomic) IBOutlet UITextField *tfNome;
@property (weak, nonatomic) IBOutlet UITextField *tfTelefone;
@property (weak, nonatomic) IBOutlet UITextView *tvEndereco;
@property (weak, nonatomic) IBOutlet UIImageView *ivFoto;



- (IBAction)btEditar:(id)sender;

@end

    
