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

-(id) initWithNome:(NSString *)nomeInicaial andIdentidade:(NSString *) identidadeInicial andTelefone:(NSString *) telInicial andEndereco:(Endereco *) enderecoInicial{
    
    if(( self = [super init] )) {
        self.nome = nomeInicaial;
        self.identidade = identidadeInicial;
        self.telefone = telInicial;
        self.endereco = enderecoInicial;
    }
    
    return self;
}

/* -(void) dealloc {
    [nome release];
    [telefone release];
    [super dealloc];
} */

@end
