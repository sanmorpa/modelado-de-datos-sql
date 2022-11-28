/*
	Titulo: Consulta Práctica
	Módulo: Práctica Modelado de datos y SQL
	Autora: Sandra Moreno Palacios
	correo: sanmorpa@gmail.com
*/

SELECT a.matricula, b.grupo_empresarial, b.marca, b.modelo, d.color, a.kilometros AS kilometros_totales, a.fecha_compra, c.aseguradora, c.numero AS numero_poliza
FROM sandra_moreno_palacios.vehiculo a
LEFT JOIN
(
	SELECT e.marca, e.grupo_empresarial, f.modelo, f.id
	FROM sandra_moreno_palacios.modelo f
	LEFT JOIN
	(
		SELECT g.id, g.marca, h.grupo_empresarial
		FROM sandra_moreno_palacios.marca g
		LEFT JOIN sandra_moreno_palacios.grupo_empresarial h
		ON g.id_grupo_empresarial = h.id
	) e
	ON f.id_marca = e.id
) b
ON a.id_modelo = b.id
LEFT JOIN
(
	SELECT i.aseguradora, j.numero
	FROM sandra_moreno_palacios.poliza j
	LEFT JOIN sandra_moreno_palacios.aseguradora i
	ON j.id_aseguradora = i.id
) c
ON a.numero_poliza = c.numero
LEFT JOIN sandra_moreno_palacios.color d
ON a.id_color = d.id;
