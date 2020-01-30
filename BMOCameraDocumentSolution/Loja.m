//
//  Loja.m
//  BMOCameraDocumentSolution
//
//  Created by Breno Medeiros on 23/10/18.
//  Copyright © 2018 Breno Medeiros. All rights reserved.
//

#import "Loja.h"

@implementation Loja
@synthesize nome,identidade,telefone,endereco;

-(id) initWithNome:(NSString *)nomeInicial andIdentidade:(NSString *) identidadeInicial andTelefone:(NSString *) telInicial andEndereco:(Endereco *) enderecoInicial{
    
    if(( self = [super init] )) {
        self.nome = nomeInicial;
        self.identidade = identidadeInicial;
        self.telefone = telInicial;
        self.endereco = enderecoInicial;
    }
    
    return self;
}

/* -(void) dealloc {
    [nome release];
    [identidade release];
    [telefone release];
    [endereco release];
    [super dealloc];
} */

@end
