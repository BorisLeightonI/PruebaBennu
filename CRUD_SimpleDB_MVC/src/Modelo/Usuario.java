package Modelo;

public class Usuario {
	int socioId,estatura,edad;
	String nombre,localidad;
	
	public Usuario() {	}

	public Usuario(int socioId, int estatura, int edad, String nombre, String localidad) {
		this.socioId = socioId;
		this.estatura = estatura;
		this.edad = edad;
		this.nombre = nombre;
		this.localidad = localidad;
	}

	public int getSocioId() {
		return socioId;
	}

	public void setSocioId(int socioId) {
		this.socioId = socioId;
	}

	public int getEstatura() {
		return estatura;
	}

	public void setEstatura(int estatura) {
		this.estatura = estatura;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	@Override
	public String toString() {
		return "Usuarios [socioId=" + socioId + ", estatura=" + estatura + ", edad=" + edad + ", nombre=" + nombre
				+ ", localidad=" + localidad + "]";
	}
	
	
	
	
	
	

}
