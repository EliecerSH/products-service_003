package com.shopsmart.products.service;

import com.shopsmart.products.model.Producto;
import com.shopsmart.products.repository.ProductoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ProductoService {

    private final ProductoRepository productoRepository;

    public List<Producto> listarTodos() {
        return productoRepository.findByActivoTrue();
    }

    public Optional<Producto> buscarPorId(Long id) {
        return productoRepository.findById(id);
    }

    public List<Producto> buscarPorCategoria(String categoria) {
        return productoRepository.findByCategoria(categoria);
    }

    public List<Producto> buscarPorNombre(String nombre) {
        return productoRepository.findByNombreContainingIgnoreCase(nombre);
    }

    public Producto crear(Producto producto) {
        return productoRepository.save(producto);
    }

    public Optional<Producto> actualizar(Long id, Producto datosActualizados) {
        return productoRepository.findById(id).map(producto -> {
            producto.setNombre(datosActualizados.getNombre());
            producto.setDescripcion(datosActualizados.getDescripcion());
            producto.setPrecio(datosActualizados.getPrecio());
            producto.setStock(datosActualizados.getStock());
            producto.setCategoria(datosActualizados.getCategoria());
            return productoRepository.save(producto);
        });
    }

    public boolean eliminar(Long id) {
        return productoRepository.findById(id).map(producto -> {
            producto.setActivo(false);
            productoRepository.save(producto);
            return true;
        }).orElse(false);
    }
}
