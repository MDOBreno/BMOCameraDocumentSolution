//
//  Endereco.m
//  BMO05TableViewSimpleContactList
//
//  Created by Breno Medeiros on 29/01/20.
//  Copyright © 2020 Breno Medeiros. All rights reserved.
//


#import "Endereco.h"

@implementation Endereco
@synthesize complemento,bairro,numero,logradouro;

-(id) initWithComplemento:(NSString *)complementoInicaial andBairro:(NSString *) bairroInicial andNumero:(NSString *) numeroInicial andLogradouro:(nonnull NSString *) logradouroInicial{
    
    if(( self = [super init] )) {
        self.complemento = complementoInicaial;
        self.bairro = bairroInicial;
        self.numero = numeroInicial;
        self.logradouro = logradouroInicial;
    }
    
    return self;
}

/* -(void) dealloc {
    [complemento release];
    [bairro release];
    [numero release];
    [logradouro release];
    [super dealloc];
} */

@end
