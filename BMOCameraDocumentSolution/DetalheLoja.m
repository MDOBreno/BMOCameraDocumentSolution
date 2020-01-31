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
    [self preencherCamposWith:self->loja
        andTelefone:self->loja.telefone
        andEndereco:self->loja.endereco
        andFoto:self->loja.foto.image];
}


- (id)initWithLoja:(Loja *)lojaInicial
        andTelefone:(NSString *) telefoneInicial
        andEndereco:(Endereco *) enderecoInicial
        andFoto:(UIImage *) fotoInicial {
    
    if(( self = [super init] )) {
        [self preencherCamposWith:lojaInicial
            andTelefone:telefoneInicial
            andEndereco:enderecoInicial
            andFoto:fotoInicial];
    }
    
    return self;
}

- (void) preencherCamposWith:(Loja *)lojaInicial
        andTelefone:(NSString *) telefoneInicial
        andEndereco:(Endereco *) enderecoInicial
        andFoto:(UIImage *) fotoInicial {
    
    self->loja = lojaInicial;
    self.tfNome.text = loja.nome;
    self.tfTelefone.text = telefoneInicial;
    
    self.tvEndereco.text = [NSString stringWithFormat:@"Logradouro: %@\nNumero: %@\nComplemento: %@\nBairro: %@",
                            enderecoInicial.logradouro,
                            enderecoInicial.numero,
                            enderecoInicial.complemento,
                            enderecoInicial.bairro];
    self.tvEndereco.layer.borderWidth = 0.4;
    self.tvEndereco.layer.borderColor = [[UIColor grayColor] CGColor];
    self.tvEndereco.layer.cornerRadius = 5;
    
    self.ivFoto.image = [UIImage imageNamed:@"Icone Preenchido"];
}


- (IBAction)voltar:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)btEditar:(id)sender {
    DetalheFoto *df = [[DetalheFoto alloc] init];
    
    df.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentModalViewController:df animated:YES];
}

@end
