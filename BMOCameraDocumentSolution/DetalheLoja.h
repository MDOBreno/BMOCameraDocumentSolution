//
//  DetalheLoja.h
//  BMO05TableViewSimpleContactList
//
//  Created by Breno Medeiros on 30/01/20.
//  Copyright © 2020 Breno Medeiros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Loja.h"


@interface DetalheLoja : UIViewController{
    @public UITextField *tfNome;
    @public UITextField *tfTelefone;
    @public UITextView *tvEndereco;
    @public UIImageView *ivFoto;
    @public Loja *loja;
}

-(id) initWithLoja:(Loja *) lojaInicial
       andTelefone:(NSString *)telefoneInicial
        andEndereco:(Endereco *)enderecoInicial
        andFoto:(UIImage *)fotoInicial;

@property (weak, nonatomic) IBOutlet UITextField *tfNome;
@property (weak, nonatomic) IBOutlet UITextField *tfTelefone;
@property (weak, nonatomic) IBOutlet UITextView *tvEndereco;
@property (weak, nonatomic) IBOutlet UIImageView *ivFoto;


- (IBAction)btEditar:(id)sender;

@end

    
