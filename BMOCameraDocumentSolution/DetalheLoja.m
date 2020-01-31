//
//  DetalheLoja.m
//  BMO05TableViewSimpleContactList
//
//  Created by Breno Medeiros on 30/01/20.
//  Copyright © 2020 Breno Medeiros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

#import "DetalheLoja.h"
#import "DetalheFoto.h"

@interface DetalheLoja ()


@end

@implementation DetalheLoja



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self preencherCamposWith:self->loja];
}


- (id)initWithLoja:(Loja *)lojaInicial {
    
    if(( self = [super init] )) {
        [self preencherCamposWith:lojaInicial];
    }
    
    return self;
}

- (void) preencherCamposWith:(Loja *)lojaInicial {
    
    self->loja = lojaInicial;
    self.tfNome.text = loja.nome;
    self.tfTelefone.text = loja.telefone;
    
    self.tvEndereco.text = [NSString stringWithFormat:@"Logradouro: %@\nNumero: %@\nComplemento: %@\nBairro: %@",
                            loja.endereco.logradouro,
                            loja.endereco.numero,
                            loja.endereco.complemento,
                            loja.endereco.bairro];
    self.tvEndereco.layer.borderWidth = 0.4;
    self.tvEndereco.layer.borderColor = [[UIColor grayColor] CGColor];
    self.tvEndereco.layer.cornerRadius = 5;
    
    self.ivFoto.image = [UIImage imageNamed:@"Icone Preenchido"];
}


- (IBAction)voltar:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)btEditar:(id)sender {
    DetalheFoto *df = [[DetalheFoto alloc] initWithFoto:loja.foto];
    
    df.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentModalViewController:df animated:YES];
}

@end
