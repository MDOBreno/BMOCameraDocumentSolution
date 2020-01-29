//
//  Contato.m
//  BMOCameraDocumentSolution
//
//  Created by Breno Medeiros on 23/10/18.
//  Copyright © 2018 Breno Medeiros. All rights reserved.
//

#import "Contato.h"

@implementation Contato
@synthesize nome,telefone;

-(id) initWithNome:(NSString *)nomeInicaial andTelefone:(NSString *) telInicial{
    
    if(( self = [super init] )) {
        self.nome = nomeInicaial;
        self.telefone = telInicial;
    }
    
    return self;
}

/* -(void) dealloc {
    [nome release];
    [telefone release];
    [super dealloc];
} */

@end
