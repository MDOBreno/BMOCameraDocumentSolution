//
//  Loja.h
//  BMOCameraDocumentSolution
//
//  Created by Breno Medeiros on 23/10/18.
//  Copyright © 2018 Breno Medeiros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Endereco.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Loja : NSObject {
    NSString *nome;
    NSString *identidade;
    NSString *telefone;
    Endereco *endereco;
    UIImageView *foto;
}

-(id) initWithNome:(NSString *) nomeInicial
       andIdentidade:(NSString *) identidadeInicial
       andTelefone:(NSString *) telInicial
       andEndereco:(Endereco *) enderecoInicial
       andFoto:(UIImageView *) fotoInicial;

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *identidade;
@property (nonatomic, retain) NSString *telefone;
@property (nonatomic, retain) Endereco *endereco;
@property (nonatomic, retain) UIImageView *foto;

@end

NS_ASSUME_NONNULL_END
