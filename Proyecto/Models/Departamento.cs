using System;
using System.Collections.Generic;
using System.ComponentModel;


namespace Proyecto.Models;

public partial class Departamento
{
    public int IdDepartamento { get; set; }

    [DisplayName("Departamento")]
    public string? Name { get; set; }

    public virtual ICollection<Municipio> Municipios { get; } = new List<Municipio>();
}
