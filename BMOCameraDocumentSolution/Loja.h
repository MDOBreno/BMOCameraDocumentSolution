//
//  Loja.h
//  BMOCameraDocumentSolution
//
//  Created by Breno Medeiros on 23/10/18.
//  Copyright © 2018 Breno Medeiros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Endereco.h"

NS_ASSUME_NONNULL_BEGIN

@interface Loja : NSObject {
    NSString *nome;
    NSString *identidade;
    NSString *telefone;
    Endereco *endereco;
}

-(id) initWithNome:(NSString *) nomeInicial
       andIdentidade:(NSString *) identidadeInicial
       andTelefone:(NSString *) telInicial
       andEndereco:(Endereco *) enderecoInicial;

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *identidade;
@property (nonatomic, retain) NSString *telefone;
@property (nonatomic, retain) Endereco *endereco;

@end

NS_ASSUME_NONNULL_END
