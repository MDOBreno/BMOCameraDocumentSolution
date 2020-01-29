//
//  Endereco.h
//  BMO05TableViewSimpleContactList
//
//  Created by Breno Medeiros on 29/01/20.
//  Copyright © 2020 Breno Medeiros. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Endereco : NSObject {
    NSString *complemento;
    NSString *bairro;
    NSString *numero;
    NSString *logradouro;
}

-(id) initWithComplemento:(NSString *) complementoInicial
       andBairro:(NSString *) bairroInicial
       andNumero:(NSString *) numeroInicial
       andLogradouro:(NSString *) logradouroInicial;

@property (nonatomic, retain) NSString *complemento;
@property (nonatomic, retain) NSString *bairro;
@property (nonatomic, retain) NSString *numero;
@property (nonatomic, retain) NSString *logradouro;

@end

NS_ASSUME_NONNULL_END
