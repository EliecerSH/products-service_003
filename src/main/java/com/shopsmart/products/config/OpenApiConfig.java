package com.shopsmart.products.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI productsServiceOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("Products Service API")
                        .description("""
                                Microservicio de gestión de productos para la plataforma ShopSmart.

                                Este servicio forma parte de la arquitectura de microservicios de ShopSmart
                                y es responsable de gestionar el catálogo completo de productos disponibles
                                en la plataforma de e-commerce.
                                """)
                        .version("1.0.0")
                        .contact(new Contact()
                                .name("Equipo ShopSmart")
                                .email("dev@shopsmart.com"))
                        .license(new License()
                                .name("MIT License")));
    }
}
