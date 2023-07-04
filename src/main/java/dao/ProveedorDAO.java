package dao;

import java.util.List;

import entity.Proveedor;

public interface ProveedorDAO {

	public abstract int insertaProveedor(Proveedor obj);
	
	public abstract List<Proveedor> listaProveedor(String filtro);
	public abstract int actualizaProveedor(Proveedor obj);
	public abstract int eliminaProveedor(int idProveedor);
	public abstract Proveedor buscaProveedor(int idProveedor);
	
	public abstract List<Proveedor> listaCompleja(String razon, String ruc, String contacto, int estado, int idPais);

	
}

